# Copyright (c) 2009, Code Aurora Forum.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# config.mk
#
# Product-specific compile-time definitions.
#
# Based on xian1243's BoardConfig.mk
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_QCOM_LIBS := true
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_HAVE_FM_RADIO := true
BOARD_CAMERA_USE_GETBUFFERINFO := true
BOARD_VENDOR_QCOM_AMSS_VERSION := 6225
USE_CAMERA_STUB := true

BOARD_HAS_NO_SELECT_BUTTON := true

# BCM4325
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION := VER_0_6_X
BOARD_WLAN_DEVICE := bcm4325
WIFI_DRIVER_MODULE_PATH := "/system/etc/wifi/dhd.ko"
WIFI_DRIVER_FW_STA_PATH := "/system/etc/wifi/BCM4325.bin"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/wifi/BCM4325.bin nvram_path=/system/etc/wifi/nvram.txt"
WIFI_DRIVER_MODULE_NAME := "dhd"
WIFI_SDIO_IF_DRIVER_MODULE_ARG := ""

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
TARGET_NO_RADIOIMAGE := true

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_PRELINKER_MAP := build/core/prelink-linux-arm-2G.map
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_HARDWARE_3D := false
TARGET_BOARD_PLATFORM := qsd8k
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_BOOTLOADER_BOARD_NAME := salsa
TARGET_PROVIDES_INIT_RC := true

TARGET_USES_2G_VM_SPLIT := true

BOARD_KERNEL_BASE := 0x20000000
# mkbootimg was tweaked to use 4096 pagesize in the file and 2048 pagesize in
# the theader
BOARD_NAND_PAGE_SIZE := 2048

BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=salsa hw_ver=6
BOARD_EGL_CFG := device/acer/a1/egl.cfg

