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

LOCAL_PATH := $(call my-dir)

#----------------------------------------------------------------------
# Compile Linux Kernel
#----------------------------------------------------------------------
ifeq ($(KERNEL_DEFCONFIG),)
	KERNEL_DEFCONFIG := acer-q8k-a1-dvt_defconfig
endif

include kernel/AndroidKernel.mk

file := $(INSTALLED_KERNEL_TARGET)
ALL_PREBUILT += $(file)
$(file) : $(TARGET_PREBUILT_KERNEL) | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_KEYLAYOUT)/a1-keypad.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/a1-keypad.kl | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_OUT_KEYLAYOUT)/acer-hs-butt.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/acer-hs-butt.kl | $(ACP)
	$(transform-prebuilt-to-target)

# unkcm Copyright (c) 2010 Alejandro R. Sedeño <asedeno@mit.edu>
# https://github.com/asedeno/unkcm
#
include $(CLEAR_VARS)
LOCAL_SRC_FILES := a1-keypad.kcm
include $(BUILD_KEY_CHAR_MAP)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := acer-hs-butt.kcm
include $(BUILD_KEY_CHAR_MAP)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := avr.kcm
include $(BUILD_KEY_CHAR_MAP)


file := $(TARGET_OUT)/etc/vold.fstab
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/vold.fstab | $(ACP)
	$(transform-prebuilt-to-target)

