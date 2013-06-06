/*
 * Copyright (C) 2008 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


// #define LOG_NDEBUG 0
#define LOG_TAG "lights"

#include <cutils/log.h>

#include <stdint.h>
#include <string.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>
#include <pthread.h>

#include <sys/ioctl.h>
#include <sys/types.h>

#include <hardware/lights.h>

/* Local light IDs */

#define LIGHT_ID_CALL               "call"
#define LIGHT_ID_EMAIL              "email"

/******************************************************************************/

static pthread_once_t g_init = PTHREAD_ONCE_INIT;
static pthread_mutex_t g_lock = PTHREAD_MUTEX_INITIALIZER;

char const*const LED_TEMPLATE
	= "/sys/class/leds/%s/%s";

/**
 * device methods
 */

void init_globals(void)
{
    // init the mutex
    pthread_mutex_init(&g_lock, NULL);
}

static int
write_str(char const* path, const char* value)
{
    int fd;
    static int already_warned = 0;

    fd = open(path, O_RDWR);
    if (fd >= 0) {
	int amt = write(fd, value, strlen(value));
	close(fd);
	return amt == -1 ? -errno : 0;
    } else {
	if (already_warned == 0) {
	    LOGE("write_str failed to open %s\n", path);
	    already_warned = 1;
	}
	return -errno;
    }
}

static int
write_int(char const* path, int value)
{
    int fd;
    static int already_warned = 0;

    fd = open(path, O_RDWR);
    if (fd >= 0) {
        char buffer[20];
        int bytes = sprintf(buffer, "%d\n", value);
        int amt = write(fd, buffer, bytes);
        close(fd);
        return amt == -1 ? -errno : 0;
    } else {
        if (already_warned == 0) {
            LOGE("write_int failed to open %s\n", path);
            already_warned = 1;
        }
        return -errno;
    }
}

static int
is_lit(struct light_state_t const* state)
{
    return state->color & 0x00ffffff;
}

static int
rgb_to_brightness(struct light_state_t const* state)
{
    int color = state->color & 0x00ffffff;
    return ((77*((color>>16)&0x00ff))
            + (150*((color>>8)&0x00ff)) + (29*(color&0x00ff))) >> 8;
}

static int
set_led_brightness(char const* led_name, int brightness)
{
    char *buf;
    int rc = 0;
    int buf_size = strlen(LED_TEMPLATE) + 512;

    buf = malloc(buf_size);
    if (!buf) {
	LOGE("set_led_brignthess(%s) malloc failed\n", led_name);
	goto err_out;
    }

    if (snprintf(buf, buf_size, LED_TEMPLATE, led_name, "brightness") < 0) {
	LOGE("set_led_brightness(%s) snprintf failed\n", led_name);
	goto err_out;
    }

    if (write_int(buf, brightness)) {
	LOGE("set_led_brightness(%s) write_int failed\n", led_name);
	goto err_out;
    }

    return 0;
err_out:
    LOGE("set_led_brightness failed for %s\n", led_name);
    if (buf) {
	free(buf);
    }
    return -1;
}

static int
set_led_blink(char const* led_name, int onMS, int offMS)
{
    char *buf = NULL;
    int rc = 0;
    int retry = 3;

    int buf_size = strlen(LED_TEMPLATE) + 512;
    buf = malloc(buf_size);

    if (!buf) {
	goto err_out;
    }

    if (snprintf(buf, buf_size, LED_TEMPLATE, led_name, "trigger") < 0) {
	LOGE("set_led_brightness(%s) snprintf trigger failed\n", led_name);
	goto err_out;
    }

    if (write_str(buf, "timer")) {
	LOGE("write_str failed for timer\n");
	goto err_out;
    }

    // After this delay_on/delay_of sysfs nodes are available.
    // Write can fail in case permission is not yet set by vold. In this case
    // we need to sleep and retry.
    if (snprintf(buf, buf_size, LED_TEMPLATE, led_name, "delay_on") < 0) {
	LOGE("set_led_brightness(%s) snprintf delay_on failed\n", led_name);
	goto err_out;
    }

    do {
	rc = write_int(buf, onMS);
	if (!rc)
	    break;
	sleep(1);
    } while (--retry > 0);

    if (rc) {
	LOGE("set_led_brightness(%s) write_int failed\n", led_name);
    }

    if (snprintf(buf, buf_size, LED_TEMPLATE, led_name, "delay_off") < 0) {
	LOGE("set_led_brightness(%s) snprintf delay_off failed\n", led_name);
	goto err_out;
    }

    retry = 3;
    do {
	rc = write_int(buf, offMS);
	if (!rc)
	    break;
	sleep(1);
    } while (--retry > 0);

    if (rc) {
	LOGE("set_led_brightness(%s) write_int failed\n", led_name);
    }

    return 0;

err_out:
    LOGE("set_led_blink failed for %s\n", led_name);
    if (buf) {
	free(buf);
    }
    return -1;
}


static int
set_light(const char* led_name,
	struct light_state_t const* state)
{
    int err = 0;
    int onMS, offMS;
    int on = is_lit(state);
    int blink = 0;
    int brightness = rgb_to_brightness(state);

    pthread_mutex_lock(&g_lock);

    switch (state->flashMode) {
	case LIGHT_FLASH_TIMED:
	    onMS = state->flashOnMS;
	    offMS = state->flashOffMS;
	    blink = 1;
	    break;
	case LIGHT_FLASH_NONE:
	    onMS = offMS = 0;
	    break;
    }

    if (blink) {
	err = set_led_blink(led_name, onMS, offMS);
	if (err)
	    goto out;
    } else {
	err = set_led_brightness(led_name, brightness);
    }

out:
    pthread_mutex_unlock(&g_lock);
    return err;
}

static int
set_light_backlight(struct light_device_t* dev,
        struct light_state_t const* state)
{
    return set_light("lcd-backlight", state);
}

static int
set_light_keyboard(struct light_device_t* dev,
        struct light_state_t const* state)
{
    int err = 0;
    int on = is_lit(state);
    pthread_mutex_lock(&g_lock);
    err = set_led_brightness("keyboard-backlight", on?255:0);
    pthread_mutex_unlock(&g_lock);
    return err;
}

static int
set_light_battery(struct light_device_t* dev,
	struct light_state_t const* state)
{
    return set_light("battery", state);
}

static int
set_light_notifications(struct light_device_t* dev,
	struct light_state_t const* state)
{
    return set_light("notification", state);
}

static int
set_light_call(struct light_device_t* dev,
	struct light_state_t const* state)
{
    return set_light("call", state);
}

/** Close the lights device */
static int
close_lights(struct light_device_t *dev)
{
    if (dev) {
        free(dev);
    }
    return 0;
}


/******************************************************************************/

/**
 * module methods
 */

/** Open a new instance of a lights device using name */
static int open_lights(const struct hw_module_t* module, char const* name,
        struct hw_device_t** device)
{
    int (*set_light)(struct light_device_t* dev,
            struct light_state_t const* state);

    if (0 == strcmp(LIGHT_ID_BACKLIGHT, name)) {
        set_light = set_light_backlight;
    }
    else if (0 == strcmp(LIGHT_ID_KEYBOARD, name)) {
        set_light = set_light_keyboard;
    }
    else if (0 == strcmp(LIGHT_ID_BATTERY, name)) {
        set_light = set_light_battery;
    }
    else if (0 == strcmp(LIGHT_ID_NOTIFICATIONS, name)) {
        set_light = set_light_notifications;
    }
    else if (0 == strcmp(LIGHT_ID_CALL, name)) {
	set_light = set_light_call;
    }
    else if (0 == strcmp(LIGHT_ID_EMAIL, name)) {
	set_light = set_light_notifications;
    }
    else {
        return -EINVAL;
    }

    pthread_once(&g_init, init_globals);

    struct light_device_t *dev = malloc(sizeof(struct light_device_t));
    memset(dev, 0, sizeof(*dev));

    dev->common.tag = HARDWARE_DEVICE_TAG;
    dev->common.version = 0;
    dev->common.module = (struct hw_module_t*)module;
    dev->common.close = (int (*)(struct hw_device_t*))close_lights;
    dev->set_light = set_light;

    *device = (struct hw_device_t*)dev;
    return 0;
}


static struct hw_module_methods_t lights_module_methods = {
    .open =  open_lights,
};

/*
 * The lights Module
 */
const struct hw_module_t HAL_MODULE_INFO_SYM = {
    .tag = HARDWARE_MODULE_TAG,
    .version_major = 1,
    .version_minor = 0,
    .id = LIGHTS_HARDWARE_MODULE_ID,
    .name = "QCT MSM7K lights Module",
    .author = "Google, Inc.",
    .methods = &lights_module_methods,
};
