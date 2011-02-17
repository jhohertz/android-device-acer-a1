# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# 
# This file is the build configuration for a generic Android
# build for dream hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
# 

# we may try inheriting from qualcomm 
#$(call inherit-product, device/qcom/qsd8250_ffa/qsd8250_ffa.mk)

PRODUCT_COPY_FILES := \
	device/acer/a1/init.salsa.rc:root/init.salsa.rc \
	device/acer/a1/init.rc:root/init.rc \

PRODUCT_PACKAGES := \
	Email \
	IM \
	VoiceDialer \
	SdkSetup \
	LiveWallpapers \
	LiveWallpapersPicker \
	MagicSmokeWallpapers \
	VisualizationWallpapers

PRODUCT_COPY_FILES += \
	device/acer/a1/apns-conf.xml:system/etc/apns-conf.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/platform.xml:system/etc/permissions/platform.xml \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \

PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

$(call inherit-product, build/target/product/generic.mk)

#Enabling Ring Tones
include frameworks/base/data/sounds/OriginalAudio.mk

# Overrides
PRODUCT_BRAND := acer
PRODUCT_NAME := a1_generic1
PRODUCT_DEVICE := a1
PRODUCT_MANUFACTURER := Acer
PRODUCT_DEFAULT_LANGUAGE := en
PRODUCT_DEFAULT_REGION := US

ADDITIONAL_DEFAULT_PROPERTIES := \
	ro.product.modelalias=S100 \
	ro.sf.lcd_density=240 \
	dalvik.vm.heapsize=27m \
	ro.opengles.version=131072 \

$(call inherit-product-if-exists, vendor/acer/a1/a1-vendor.mk)

