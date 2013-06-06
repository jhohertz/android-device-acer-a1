/*
 * Copyright (C) 2013 Roman Yepishev
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

#define LOG_NDEBUG 0
#define LOG_TAG "acer_acoustic"

#include <cutils/log.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <errno.h>

#include <sys/ioctl.h>

#include <linux/tpa2018d1.h>

#define TPA2018_DEVICE	  "/dev/tpa2018d1"

#define TPA2018_CSV_PATH  "/etc/TPA2018.csv"
#define TPA2018_CMD_LEN	  8

/* 
 * From board-salsa-tpa2018.h
 * cmd_data[y][0..7] = x
 * y = mode, x = i2c_byte
 */

struct tpa2018d1_config_data {
    unsigned char *cmd_data;  
    unsigned int mode_num;
    unsigned int data_len;
};

static struct {
    char *name;
    int id;
} stream_map[] = {
    { "TPA2018_MODE_OFF",	  TPA2018_MODE_OFF },
    { "TPA2018_MODE_PLAYBACK",	  TPA2018_MODE_PLAYBACK},
    { "TPA2018_MODE_RINGTONE",	  TPA2018_MODE_RINGTONE},
    { "TPA2018_MODE_VOICE_CALL",  TPA2018_MODE_VOICE_CALL},
};

static int parse_tpa2018d1_parameters(unsigned char *config, FILE *fh)
{
    /*
     * Find new line, read from current offset to newline
     * get the line, parse tokens
     * check first entry. if unknown then skip line
     * if known then parse the data and put according to type map offset
     */
    char buf[512];
    char *saveptr;
    char *token;
    unsigned int i;
    int stream_id;
    int value;
    int parsed_count = 0;

    while (fgets(buf, sizeof(buf), fh)) {
	/* Drop trailing newline */
	if (buf[strlen(buf) - 1] == '\n')
	    buf[strlen(buf) - 1] = 0;

	token = strtok_r(buf, ",", &saveptr);

	LOGD("Got token = %s\n", token);
	stream_id = -1;

	for (i = 0; i < (sizeof(stream_map)/sizeof(*stream_map)); i++) {
	    if (!strcmp(stream_map[i].name, token)) {
		stream_id = stream_map[i].id;
		break;
	    }
	}

	if (stream_id < 0) {
	    LOGD("Ignored token %s\n", token);
	    continue;
	}

	i = 0;
	while ((token = strtok_r(NULL, ",", &saveptr)) != NULL) {
	    if (i > TPA2018_CMD_LEN - 1) {
		LOGE("Error: malformed %s line, skipping extras\n",
		     buf);
		continue;
	    }
	    value = strtol(token, NULL, 16);
	    config[stream_id * TPA2018_CMD_LEN + i] = value;
	    i++;
	}

	parsed_count++;
    }

    return (parsed_count > 0 ? 0 : 1);
}

static int write_tpa2018d1_parameters(unsigned char *config)
{
    int fd, res = 0;
    struct tpa2018d1_config_data cdata;

    cdata.cmd_data = config;
    cdata.mode_num = TPA2018_NUM_MODES;
    cdata.data_len = TPA2018_NUM_MODES * TPA2018_CMD_LEN;

    fd = open(TPA2018_DEVICE, O_RDWR);
    if (fd < 0) {
	res = -errno;
	LOGE("%s failed to open %s: %s\n", __func__,
	     TPA2018_DEVICE, strerror(errno));
	goto out;
    }

    if (ioctl(fd, TPA2018_SET_PARAM, &cdata)) {
	res = -errno;
	LOGE("%s: ioctl(TPA2018_SET_PARAM) failed: %s\n",
	     __func__, strerror(errno));
	goto out;
    }

out:
    if (fd > -1) {
	close(fd);
    }
    return -res;
}

int set_tpa2018d1_parameters(void)
{
    int res;
    FILE *fh = NULL;
    unsigned char *tpa2018_config = NULL;

    fh = fopen(TPA2018_CSV_PATH, "r");
    if (! fh) {
	res = -errno;
	LOGE("%s failed to open %s: %s\n", __func__,
	     TPA2018_CSV_PATH, strerror(errno));
	goto out;
    }

    tpa2018_config = calloc(TPA2018_NUM_MODES, TPA2018_CMD_LEN);

    if (parse_tpa2018d1_parameters(tpa2018_config, fh)) {
	LOGE("parse_tpa2018d1_parameters failed\n");
	res = -1;
	goto out;
    }

    if (write_tpa2018d1_parameters(tpa2018_config)) {
	LOGE("write_tpa2018d1_parameters failed\n");
	res = -1;
	goto out;
    }

    LOGI("TPA2018 parameters set\n");

    res = 0;

out:
    if (tpa2018_config)
	free(tpa2018_config);

    if (fh)
	fclose(fh);

    return res;
}
