#!/bin/sh

# Copyright (C) 2010 The Android Open Source Project
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

DEVICE=a1

mkdir -p ../../../vendor/acer/$DEVICE/proprietary

# configs and firmware
adb pull /system/etc/updatecmds/google_generic_update.txt ../../../vendor/acer/$DEVICE/proprietary/google_generic_update.txt
adb pull /system/etc/eccs-conf.xml ../../../vendor/acer/$DEVICE/proprietary/eccs-conf.xml
adb pull /system/etc/NOTICE.html.gz ../../../vendor/acer/$DEVICE/proprietary/NOTICE.html.gz
adb pull /system/etc/init.salsa.post_boot.sh ../../../vendor/acer/$DEVICE/proprietary/init.salsa.post_boot.sh
adb pull /system/etc/security/otacerts.zip ../../../vendor/acer/$DEVICE/proprietary/otacerts.zip
adb pull /system/etc/security/cacerts.bks ../../../vendor/acer/$DEVICE/proprietary/cacerts.bks
adb pull /system/etc/bluetooth/blacklist.conf ../../../vendor/acer/$DEVICE/proprietary/blacklist.conf
adb pull /system/etc/bluetooth/input.conf ../../../vendor/acer/$DEVICE/proprietary/input.conf
adb pull /system/etc/bluetooth/audio.conf ../../../vendor/acer/$DEVICE/proprietary/audio.conf
adb pull /system/etc/bluetooth/auto_pairing.conf ../../../vendor/acer/$DEVICE/proprietary/auto_pairing.conf
adb pull /system/etc/bluetooth/main.conf ../../../vendor/acer/$DEVICE/proprietary/main.conf
adb pull /system/etc/BCM4325.hcd ../../../vendor/acer/$DEVICE/proprietary/BCM4325.hcd
adb pull /system/etc/firmware/yamato_pm4.fw ../../../vendor/acer/$DEVICE/proprietary/yamato_pm4.fw
adb pull /system/etc/firmware/yamato_pfp.fw ../../../vendor/acer/$DEVICE/proprietary/yamato_pfp.fw
adb pull /system/etc/gps.conf ../../../vendor/acer/$DEVICE/proprietary/gps.conf
adb pull /system/etc/wifi/wpa_supplicant.conf ../../../vendor/acer/$DEVICE/proprietary/wpa_supplicant.conf
adb pull /system/etc/wifi/BCM4325.bin ../../../vendor/acer/$DEVICE/proprietary/BCM4325.bin
adb pull /system/etc/wifi/BCM4325_apsta.bin ../../../vendor/acer/$DEVICE/proprietary/BCM4325_apsta.bin
adb pull /system/etc/wifi/BCM4325Fac.bin ../../../vendor/acer/$DEVICE/proprietary/BCM4325Fac.bin
adb pull /system/etc/wifi/nvram.txt ../../../vendor/acer/$DEVICE/proprietary/nvram.txt
adb pull /system/etc/init.salsa.bt.sh ../../../vendor/acer/$DEVICE/proprietary/init.salsa.bt.sh
adb pull /system/etc/bootsound.wav ../../../vendor/acer/$DEVICE/proprietary/bootsound.wav
adb pull /system/etc/loc_parameter.ini ../../../vendor/acer/$DEVICE/proprietary/loc_parameter.ini

# libraries
adb pull /system/lib/libaudio.so ../../../vendor/acer/$DEVICE/proprietary/libaudio.so
adb pull /system/lib/libauth.so ../../../vendor/acer/$DEVICE/proprietary/libauth.so
adb pull /system/lib/libcamera.so ../../../vendor/acer/$DEVICE/proprietary/libcamera.so
adb pull /system/lib/libcm.so ../../../vendor/acer/$DEVICE/proprietary/libcm.so
adb pull /system/lib/libdll.so ../../../vendor/acer/$DEVICE/proprietary/libdll.so
adb pull /system/lib/libdsm.so ../../../vendor/acer/$DEVICE/proprietary/libdsm.so
adb pull /system/lib/libdss.so ../../../vendor/acer/$DEVICE/proprietary/libdss.so
adb pull /system/lib/libgps.so ../../../vendor/acer/$DEVICE/proprietary/libgps.so
adb pull /system/lib/libgsl.so ../../../vendor/acer/$DEVICE/proprietary/libgsl.so
adb pull /system/lib/libgsdi_exp.so ../../../vendor/acer/$DEVICE/proprietary/libgsdi_exp.so
adb pull /system/lib/libgstk_exp.so ../../../vendor/acer/$DEVICE/proprietary/libgstk_exp.so
adb pull /system/lib/libloc.so ../../../vendor/acer/$DEVICE/proprietary/libloc.so
adb pull /system/lib/libloc_api.so ../../../vendor/acer/$DEVICE/proprietary/libloc_api.so
adb pull /system/lib/libloc-rpc.so ../../../vendor/acer/$DEVICE/proprietary/libloc-rpc.so
adb pull /system/lib/libmmgsdilib.so ../../../vendor/acer/$DEVICE/proprietary/libmmgsdilib.so
adb pull /system/lib/libmmjpeg.so ../../../vendor/acer/$DEVICE/proprietary/libmmjpeg.so
adb pull /system/lib/libnv.so ../../../vendor/acer/$DEVICE/proprietary/libnv.so
adb pull /system/lib/liboemcamera.so ../../../vendor/acer/$DEVICE/proprietary/liboemcamera.so
adb pull /system/lib/liboem_rapi.so ../../../vendor/acer/$DEVICE/proprietary/liboem_rapi.so
adb pull /system/lib/libOmxEvrcDec.so ../../../vendor/acer/$DEVICE/proprietary/libOmxEvrcDec.so
adb pull /system/lib/libOmxQcelp13Dec.so ../../../vendor/acer/$DEVICE/proprietary/libOmxQcelp13Dec.so
adb pull /system/lib/liboncrpc.so ../../../vendor/acer/$DEVICE/proprietary/liboncrpc.so
adb pull /system/lib/libpbmlib.so ../../../vendor/acer/$DEVICE/proprietary/libpbmlib.so
adb pull /system/lib/libpdapi.so ../../../vendor/acer/$DEVICE/proprietary/libpdapi.so
adb pull /system/lib/libpdsm_atl.so ../../../vendor/acer/$DEVICE/proprietary/libpdsm_atl.so
adb pull /system/lib/libping_mdm.so ../../../vendor/acer/$DEVICE/proprietary/libping_mdm.so
adb pull /system/lib/libqmi.so ../../../vendor/acer/$DEVICE/proprietary/libqmi.so
adb pull /system/lib/libril-acer-1.so ../../../vendor/acer/$DEVICE/proprietary/libril-acer-1.so
adb pull /system/lib/libuim.so ../../../vendor/acer/$DEVICE/proprietary/libuim.so
adb pull /system/lib/libwms.so ../../../vendor/acer/$DEVICE/proprietary/libwms.so
adb pull /system/lib/libwmsts.so ../../../vendor/acer/$DEVICE/proprietary/libwmsts.so

# all other libraries
db pull /system/lib/libAtiSoftDict.so ../../../vendor/acer/$DEVICE/proprietary/libAtiSoftDict.so
adb pull /system/lib/libatu.so ../../../vendor/acer/$DEVICE/proprietary/libatu.so
adb pull /system/lib/libcommondefs.so ../../../vendor/acer/$DEVICE/proprietary/libcommondefs.so
adb pull /system/lib/libdiag.so ../../../vendor/acer/$DEVICE/proprietary/libdiag.so
adb pull /system/lib/libDxAndroidSpecific.so ../../../vendor/acer/$DEVICE/proprietary/libDxAndroidSpecific.so
adb pull /system/lib/libDxDrmJava.so ../../../vendor/acer/$DEVICE/proprietary/libDxDrmJava.so
adb pull /system/lib/libDxWBXML.so ../../../vendor/acer/$DEVICE/proprietary/libDxWBXML.so
adb pull /system/lib/libflashplayer.so ../../../vendor/acer/$DEVICE/proprietary/libflashplayer.so
adb pull /system/lib/libfuse.so ../../../vendor/acer/$DEVICE/proprietary/libfuse.so
adb pull /system/lib/libHDMIsetting.so ../../../vendor/acer/$DEVICE/proprietary/libHDMIsetting.so
adb pull /system/lib/libjni_acerAgpsSetting.so ../../../vendor/acer/$DEVICE/proprietary/libjni_acerAgpsSetting.so
adb pull /system/lib/libjni_AcerNativeMethod.so ../../../vendor/acer/$DEVICE/proprietary/libjni_AcerNativeMethod.so
adb pull /system/lib/libjni_xt9input.so ../../../vendor/acer/$DEVICE/proprietary/libjni_xt9input.so
adb pull /system/lib/libmm-abl.so ../../../vendor/acer/$DEVICE/proprietary/libmm-abl.so
adb pull /system/lib/libmmipl.so ../../../vendor/acer/$DEVICE/proprietary/libmmipl.so
adb pull /system/lib/libnemoPlayer_hdmi_jni.so ../../../vendor/acer/$DEVICE/proprietary/libnemoPlayer_hdmi_jni.so
adb pull /system/lib/libOmxAacDec.so ../../../vendor/acer/$DEVICE/proprietary/libOmxAacDec.so
adb pull /system/lib/libOmxAacEnc.so ../../../vendor/acer/$DEVICE/proprietary/libOmxAacEnc.so
adb pull /system/lib/libOmxAmrEnc.so ../../../vendor/acer/$DEVICE/proprietary/libOmxAmrEnc.so
adb pull /system/lib/libOmxEvrcEnc.so ../../../vendor/acer/$DEVICE/proprietary/libOmxEvrcEnc.so
adb pull /system/lib/libOmxMp3Dec.so ../../../vendor/acer/$DEVICE/proprietary/libOmxMp3Dec.so
adb pull /system/lib/libOmxQcelp13Enc.so ../../../vendor/acer/$DEVICE/proprietary/libOmxQcelp13Enc.so
adb pull /system/lib/libOmxVdec.so ../../../vendor/acer/$DEVICE/proprietary/libOmxVdec.so
adb pull /system/lib/libOmxVidEnc.so ../../../vendor/acer/$DEVICE/proprietary/libOmxVidEnc.so
adb pull /system/lib/libqueue.so ../../../vendor/acer/$DEVICE/proprietary/libqueue.so
adb pull /system/lib/libril-acerril-hook-oem.so ../../../vendor/acer/$DEVICE/proprietary/libril-acerril-hook-oem.so
adb pull /system/lib/librs_jni.so ../../../vendor/acer/$DEVICE/proprietary/librs_jni.so
adb pull /system/lib/libRS.so ../../../vendor/acer/$DEVICE/proprietary/libRS.so
adb pull /system/lib/libusbconn.so ../../../vendor/acer/$DEVICE/proprietary/libusbconn.so
adb pull /system/lib/libvoAACDec.so ../../../vendor/acer/$DEVICE/proprietary/libvoAACDec.so
adb pull /system/lib/libvoAC3Dec.so ../../../vendor/acer/$DEVICE/proprietary/libvoAC3Dec.so
adb pull /system/lib/libvoAMRNBDec.so ../../../vendor/acer/$DEVICE/proprietary/libvoAMRNBDec.so
adb pull /system/lib/libvoAMRWBDec.so ../../../vendor/acer/$DEVICE/proprietary/libvoAMRWBDec.so
adb pull /system/lib/libvoAndroid.so ../../../vendor/acer/$DEVICE/proprietary/libvoAndroid.so
adb pull /system/lib/libvoASFFR.so ../../../vendor/acer/$DEVICE/proprietary/libvoASFFR.so
adb pull /system/lib/libvoH264Dec.so ../../../vendor/acer/$DEVICE/proprietary/libvoH264Dec.so
adb pull /system/lib/libvoicesearch.so ../../../vendor/acer/$DEVICE/proprietary/libvoicesearch.so
adb pull /system/lib/libvomemedia.so ../../../vendor/acer/$DEVICE/proprietary/libvomemedia.so
adb pull /system/lib/libvoMMCCRRS.so ../../../vendor/acer/$DEVICE/proprietary/libvoMMCCRRS.so
adb pull /system/lib/libvoMMPlay.so ../../../vendor/acer/$DEVICE/proprietary/libvoMMPlay.so
adb pull /system/lib/libvoMP3Dec.so ../../../vendor/acer/$DEVICE/proprietary/libvoMP3Dec.so
adb pull /system/lib/libvoMPEG4Dec.so ../../../vendor/acer/$DEVICE/proprietary/libvoMPEG4Dec.so
adb pull /system/lib/libvoOMXOne.so ../../../vendor/acer/$DEVICE/proprietary/libvoOMXOne.so
adb pull /system/lib/libvoPackUV.so ../../../vendor/acer/$DEVICE/proprietary/libvoPackUV.so
adb pull /system/lib/libvoQCELPDec.so ../../../vendor/acer/$DEVICE/proprietary/libvoQCELPDec.so
adb pull /system/lib/libvoSrcRTSP.so ../../../vendor/acer/$DEVICE/proprietary/libvoSrcRTSP.so
adb pull /system/lib/libvoVidDec.so ../../../vendor/acer/$DEVICE/proprietary/libvoVidDec.so
adb pull /system/lib/libvoWMADec.so ../../../vendor/acer/$DEVICE/proprietary/libvoWMADec.so
adb pull /system/lib/libvoWMVDec.so ../../../vendor/acer/$DEVICE/proprietary/libvoWMVDec.so
adb pull /system/lib/libxt9core.so ../../../vendor/acer/$DEVICE/proprietary/libxt9core.so
adb pull /system/lib/libysshared.so ../../../vendor/acer/$DEVICE/proprietary/libysshared.so

# 3D
adb pull /system/lib/egl/libGLES_android.so ../../../vendor/acer/$DEVICE/proprietary/libGLES_android.so
adb pull /system/lib/egl/libEGL_adreno200.so ../../../vendor/acer/$DEVICE/proprietary/libEGL_adreno200.so
adb pull /system/lib/egl/libGLESv2_adreno200.so ../../../vendor/acer/$DEVICE/proprietary/libGLESv2_adreno200.so
adb pull /system/lib/egl/libGLESv1_CM_adreno200.so ../../../vendor/acer/$DEVICE/proprietary/libGLESv1_CM_adreno200.so
adb pull /system/lib/egl/libq3dtools_adreno200.so ../../../vendor/acer/$DEVICE/proprietary/libq3dtools_adreno200.so
adb pull /system/lib/egl/egl.cfg ../../../vendor/acer/$DEVICE/proprietary/egl.cfg

# bin
adb pull /system/bin/diag_klog ../../../vendor/acer/$DEVICE/proprietary/diag_klog
chmod 0755 ../../../vendor/acer/$DEVICE/proprietary/diag_klog
adb pull /system/bin/loc_api_app ../../../vendor/acer/$DEVICE/proprietary/loc_api_app
chmod 0755 ../../../vendor/acer/$DEVICE/proprietary/loc_api_app
adb pull /system/bin/PktRspTest ../../../vendor/acer/$DEVICE/proprietary/PktRspTest
chmod 0755 ../../../vendor/acer/$DEVICE/proprietary/PktRspTest
adb pull /system/bin/qmuxd ../../../vendor/acer/$DEVICE/proprietary/qmuxd
chmod 0755 ../../../vendor/acer/$DEVICE/proprietary/qmuxd
adb pull /system/bin/sensorcalibutil_yamaha ../../../vendor/acer/$DEVICE/proprietary/sensorcalibutil_yamaha
chmod 0755 ../../../vendor/acer/$DEVICE/proprietary/sensorcalibutil_yamaha
adb pull /system/bin/sensorserver_yamaha ../../../vendor/acer/$DEVICE/proprietary/sensorserver_yamaha
chmod 0755 ../../../vendor/acer/$DEVICE/proprietary/sensorserver_yamaha
adb pull /system/bin/sensorstatutil_yamaha ../../../vendor/acer/$DEVICE/proprietary/sensorstatutil_yamaha
chmod 0755 ../../../vendor/acer/$DEVICE/proprietary/sensorstatutil_yamaha

# yamaha sensor
adb pull /system/lib/libsensor_yamaha.so ../../../vendor/acer/$DEVICE/proprietary/libsensor_yamaha.so
adb pull /system/lib/libms3c_yamaha.so ../../../vendor/acer/$DEVICE/proprietary/libms3c_yamaha.so

# hw
adb pull /system/lib/hw/lights.qsd8k.so ../../../vendor/acer/$DEVICE/proprietary/lights.qsd8k.so
adb pull /system/lib/hw/sensors.salsa.so ../../../vendor/acer/$DEVICE/proprietary/sensors.salsa.so

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/acer/$DEVICE/$DEVICE-vendor.mk
# Copyright (C) 2010 The Android Open Source Project
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

# This file is generated by device/acer/__DEVICE__/extract-files.sh

# configs and firmware
PRODUCT_COPY_FILES += \\
    vendor/acer/__DEVICE__/proprietary/google_generic_update.txt:/system/etc/updatecmds/google_generic_update.txt \\
    vendor/acer/__DEVICE__/proprietary/eccs-conf.xml:/system/etc/eccs-conf.xml \\
    vendor/acer/__DEVICE__/proprietary/NOTICE.html.gz:/system/etc/NOTICE.html.gz \\
    vendor/acer/__DEVICE__/proprietary/init.salsa.post_boot.sh:/system/etc/init.salsa.post_boot.sh \\
    vendor/acer/__DEVICE__/proprietary/otacerts.zip:/system/etc/security/otacerts.zip \\
    vendor/acer/__DEVICE__/proprietary/cacerts.bks:/system/etc/security/cacerts.bks \\
    vendor/acer/__DEVICE__/proprietary/blacklist.conf:/system/etc/bluetooth/blacklist.conf \\
    vendor/acer/__DEVICE__/proprietary/input.conf:/system/etc/bluetooth/input.conf \\
    vendor/acer/__DEVICE__/proprietary/audio.conf:/system/etc/bluetooth/audio.conf \\
    vendor/acer/__DEVICE__/proprietary/auto_pairing.conf:/system/etc/bluetooth/auto_pairing.conf \\
    vendor/acer/__DEVICE__/proprietary/main.conf:/system/etc/bluetooth/main.conf \\
    vendor/acer/__DEVICE__/proprietary/BCM4325.hcd:/system/etc/BCM4325.hcd \\
    vendor/acer/__DEVICE__/proprietary/yamato_pm4.fw:/system/etc/firmware/yamato_pm4.fw \\
    vendor/acer/__DEVICE__/proprietary/yamato_pfp.fw:/system/etc/firmware/yamato_pfp.fw \\
    vendor/acer/__DEVICE__/proprietary/gps.conf:/system/etc/gps.conf \\
    vendor/acer/__DEVICE__/proprietary/wpa_supplicant.conf:/system/etc/wifi/wpa_supplicant.conf \\
    vendor/acer/__DEVICE__/proprietary/BCM4325.bin:/system/etc/wifi/BCM4325.bin \\
    vendor/acer/__DEVICE__/proprietary/BCM4325_apsta.bin:/system/etc/wifi/BCM4325_apsta.bin \\
    vendor/acer/__DEVICE__/proprietary/BCM4325Fac.bin:/system/etc/wifi/BCM4325Fac.bin \\
    vendor/acer/__DEVICE__/proprietary/nvram.txt:/system/etc/wifi/nvram.txt \\
    vendor/acer/__DEVICE__/proprietary/init.salsa.bt.sh:/system/etc/init.salsa.bt.sh \\
    vendor/acer/__DEVICE__/proprietary/bootsound.wav:/system/etc/bootsound.wav \\
    vendor/acer/__DEVICE__/proprietary/loc_parameter.ini:/system/etc/loc_parameter.ini \\

# libraries
PRODUCT_COPY_FILES += \\
    vendor/acer/__DEVICE__/proprietary/libaudio.so:/system/lib/libaudio.so \\
    vendor/acer/__DEVICE__/proprietary/libauth.so:/system/lib/libauth.so \\
    vendor/acer/__DEVICE__/proprietary/libcm.so:/system/lib/libcm.so \\
    vendor/acer/__DEVICE__/proprietary/libcamera.so:/system/lib/libcamera.so \\
    vendor/acer/__DEVICE__/proprietary/libdll.so:/system/lib/libdll.so \\
    vendor/acer/__DEVICE__/proprietary/libdsm.so:/system/lib/libdsm.so \\
    vendor/acer/__DEVICE__/proprietary/libdss.so:/system/lib/libdss.so \\
    vendor/acer/__DEVICE__/proprietary/libgps.so:/system/lib/libgps.so \\
    vendor/acer/__DEVICE__/proprietary/libgsdi_exp.so:/system/lib/libgsdi_exp.so \\
    vendor/acer/__DEVICE__/proprietary/libgsl.so:/system/lib/libgsl.so \\
    vendor/acer/__DEVICE__/proprietary/libgstk_exp.so:/system/lib/libgstk_exp.so \\
    vendor/acer/__DEVICE__/proprietary/libloc.so:/system/lib/libloc.so \\
    vendor/acer/__DEVICE__/proprietary/libloc_api.so:/system/lib/libloc_api.so \\
    vendor/acer/__DEVICE__/proprietary/libloc-rpc.so:/system/lib/libloc-rpc.so \\
    vendor/acer/__DEVICE__/proprietary/libmmgsdilib.so:/system/lib/libmmgsdilib.so \\
    vendor/acer/__DEVICE__/proprietary/libmmjpeg.so:/system/lib/libmmjpeg.so \\
    vendor/acer/__DEVICE__/proprietary/libms3c_yamaha.so:/system/lib/libms3c_yamaha.so \\
    vendor/acer/__DEVICE__/proprietary/libnv.so:/system/lib/libnv.so \\
    vendor/acer/__DEVICE__/proprietary/liboemcamera.so:/system/lib/liboemcamera.so \\
    vendor/acer/__DEVICE__/proprietary/liboem_rapi.so:/system/lib/liboem_rapi.so \\
    vendor/acer/__DEVICE__/proprietary/libOmxEvrcDec.so:/system/lib/libOmxEvrcDec.so \\
    vendor/acer/__DEVICE__/proprietary/libOmxQcelp13Dec.so:/system/lib/libOmxQcelp13Dec.so \\
    vendor/acer/__DEVICE__/proprietary/liboncrpc.so:/system/lib/liboncrpc.so \\
    vendor/acer/__DEVICE__/proprietary/libpbmlib.so:/system/lib/libpbmlib.so \\
    vendor/acer/__DEVICE__/proprietary/libpdapi.so:/system/lib/libpdapi.so \\
    vendor/acer/__DEVICE__/proprietary/libpdsm_atl.so:/system/lib/libpdsm_atl.so \\
    vendor/acer/__DEVICE__/proprietary/libping_mdm.so:/system/lib/libping_mdm.so \\
    vendor/acer/__DEVICE__/proprietary/libqmi.so:/system/lib/libqmi.so \\
    vendor/acer/__DEVICE__/proprietary/libril-acer-1.so:/system/lib/libril-acer-1.so \\
    vendor/acer/__DEVICE__/proprietary/libsensor_yamaha.so:/system/lib/libsensor_yamaha.so \\
    vendor/acer/__DEVICE__/proprietary/libuim.so:/system/lib/libuim.so \\
    vendor/acer/__DEVICE__/proprietary/libwms.so:/system/lib/libwms.so \\
    vendor/acer/__DEVICE__/proprietary/libwmsts.so:/system/lib/libwmsts.so \\

# additional libraries
    vendor/acer/__DEVICE__/proprietary/libysshared.so:/system/lib/libysshared.so \\
    vendor/acer/__DEVICE__/proprietary/libxt9core.so:/system/lib/libxt9core.so \\
    vendor/acer/__DEVICE__/proprietary/libvoWMVDec.so:/system/lib/libvoWMVDec.so \\
    vendor/acer/__DEVICE__/proprietary/libvoWMADec.so:/system/lib/libvoWMADec.so \\
    vendor/acer/__DEVICE__/proprietary/libvoVidDec.so:/system/lib/libvoVidDec.so \\
    vendor/acer/__DEVICE__/proprietary/libvoSrcRTSP.so:/system/lib/libvoSrcRTSP.so \\
    vendor/acer/__DEVICE__/proprietary/libvoQCELPDec.so:/system/lib/libvoQCELPDec.so \\
    vendor/acer/__DEVICE__/proprietary/libvoPackUV.so:/system/lib/libvoPackUV.so \\
    vendor/acer/__DEVICE__/proprietary/libvoOMXOne.so:/system/lib/libvoOMXOne.so \\
    vendor/acer/__DEVICE__/proprietary/libvoOMXME.so:/system/lib/libvoOMXME.so \\
    vendor/acer/__DEVICE__/proprietary/libvoMPEG4Dec.so:/system/lib/libvoMPEG4Dec.so \\
    vendor/acer/__DEVICE__/proprietary/libvoMP3Dec.so:/system/lib/libvoMP3Dec.so \\
    vendor/acer/__DEVICE__/proprietary/libvoMMPlay.so:/system/lib/libvoMMPlay.so \\
    vendor/acer/__DEVICE__/proprietary/libvoMMCCRRS.so:/system/lib/libvoMMCCRRS.so \\
    vendor/acer/__DEVICE__/proprietary/libvomemedia.so:/system/lib/libvomemedia.so \\
    vendor/acer/__DEVICE__/proprietary/libvoicesearch.so:/system/lib/libvoicesearch.so \\
    vendor/acer/__DEVICE__/proprietary/libvoH264Dec.so:/system/lib/libvoH264Dec.so \\
    vendor/acer/__DEVICE__/proprietary/libvoASFFR.so:/system/lib/libvoASFFR.so \\
    vendor/acer/__DEVICE__/proprietary/libvoAndroid.so:/system/lib/libvoAndroid.so \\
    vendor/acer/__DEVICE__/proprietary/libvoAMRWBDec.so:/system/lib/libvoAMRWBDec.so \\
    vendor/acer/__DEVICE__/proprietary/libvoAMRNBDec.so:/system/lib/libvoAMRNBDec.so \\
    vendor/acer/__DEVICE__/proprietary/libvoAC3Dec.so:/system/lib/libvoAC3Dec.so \\
    vendor/acer/__DEVICE__/proprietary/libvoAACDec.so:/system/lib/libvoAACDec.so \\
    vendor/acer/__DEVICE__/proprietary/libusbconn.so:/system/lib/libusbconn.so \\
    vendor/acer/__DEVICE__/proprietary/libRS.so:/system/lib/libRS.so \\
    vendor/acer/__DEVICE__/proprietary/librs_jni.so:/system/lib/librs_jni.so \\
    vendor/acer/__DEVICE__/proprietary/libril-acerril-hook-oem.so:/system/lib/libril-acerril-hook-oem.so \\
    vendor/acer/__DEVICE__/proprietary/libqueue.so:/system/lib/libqueue.so \\
    vendor/acer/__DEVICE__/proprietary/libOmxVidEnc.so:/system/lib/libOmxVidEnc.so \\
    vendor/acer/__DEVICE__/proprietary/libOmxVdec.so:/system/lib/libOmxVdec.so \\
    vendor/acer/__DEVICE__/proprietary/libOmxQcelp13Enc.so:/system/lib/libOmxQcelp13Enc.so \\
    vendor/acer/__DEVICE__/proprietary/libOmxMp3Dec.so:/system/lib/libOmxMp3Dec.so \\
    vendor/acer/__DEVICE__/proprietary/libOmxEvrcEnc.so:/system/lib/libOmxEvrcEnc.so \\
    vendor/acer/__DEVICE__/proprietary/libOmxAmrEnc.so:/system/lib/libOmxAmrEnc.so \\
    vendor/acer/__DEVICE__/proprietary/libOmxAacEnc.so:/system/lib/libOmxAacEnc.so \\
    vendor/acer/__DEVICE__/proprietary/libOmxAacDec.so:/system/lib/libOmxAacDec.so \\
    vendor/acer/__DEVICE__/proprietary/libnemoPlayer_hdmi_jni.so:/system/lib/libnemoPlayer_hdmi_jni.so \\
    vendor/acer/__DEVICE__/proprietary/libmmipl.so:/system/lib/libmmipl.so \\
    vendor/acer/__DEVICE__/proprietary/libmm-abl.so:/system/lib/libmm-abl.so \\
    vendor/acer/__DEVICE__/proprietary/libjni_xt9input.so:/system/lib/libjni_xt9input.so \\
    vendor/acer/__DEVICE__/proprietary/libjni_AcerNativeMethod.so:/system/lib/libjni_AcerNativeMethod.so \\
    vendor/acer/__DEVICE__/proprietary/libjni_acerAgpsSetting.so:/system/lib/libjni_acerAgpsSetting.so \\
    vendor/acer/__DEVICE__/proprietary/libHDMIsetting.so:/system/lib/libHDMIsetting.so \\
    vendor/acer/__DEVICE__/proprietary/libfuse.so:/system/lib/libfuse.so \\
    vendor/acer/__DEVICE__/proprietary/libflashplayer.so:/system/lib/libflashplayer.so \\
    vendor/acer/__DEVICE__/proprietary/libDxWBXML.so:/system/lib/libDxWBXML.so \\
    vendor/acer/__DEVICE__/proprietary/libDxDrmJava.so:/system/lib/libDxDrmJava.so \\
    vendor/acer/__DEVICE__/proprietary/libDxAndroidSpecific.so:/system/lib/libDxAndroidSpecific.so \\
    vendor/acer/__DEVICE__/proprietary/libdiag.so:/system/lib/libdiag.so \\
    vendor/acer/__DEVICE__/proprietary/libcommondefs.so:/system/lib/libcommondefs.so \\
    vendor/acer/__DEVICE__/proprietary/libatu.so:/system/lib/libatu.so \\
    vendor/acer/__DEVICE__/proprietary/libAtiSoftDict.so:/system/lib/libAtiSoftDict.so \\

# 3D
PRODUCT_COPY_FILES += \\
    vendor/acer/__DEVICE__/proprietary/libGLES_android.so:/system/lib/egl/libGLES_android.so \\
    vendor/acer/__DEVICE__/proprietary/libEGL_adreno200.so:/system/lib/egl/libEGL_adreno200.so \\
    vendor/acer/__DEVICE__/proprietary/libGLESv2_adreno200.so:/system/lib/egl/libGLESv2_adreno200.so \\
    vendor/acer/__DEVICE__/proprietary/libGLESv1_CM_adreno200.so:/system/lib/egl/libGLESv1_CM_adreno200.so \\
    vendor/acer/__DEVICE__/proprietary/libq3dtools_adreno200.so:/system/lib/egl/libq3dtools_adreno200.so \\
    vendor/acer/__DEVICE__/proprietary/egl.cfg:/system/lib/egl/egl.cfg \\

# bin
PRODUCT_COPY_FILES += \\
    vendor/acer/__DEVICE__/proprietary/diag_klog:/system/bin/diag_klog \\
    vendor/acer/__DEVICE__/proprietary/loc_api_app:/system/bin/loc_api_app \\
    vendor/acer/__DEVICE__/proprietary/PktRspTest:/system/bin/PktRspTest \\
    vendor/acer/__DEVICE__/proprietary/qmuxd:/system/bin/qmuxd \\
    vendor/acer/__DEVICE__/proprietary/sensorstatutil_yamaha:/system/bin/sensorstatutil_yamaha \\
    vendor/acer/__DEVICE__/proprietary/sensorserver_yamaha:/system/bin/sensorserver_yamaha \\
    vendor/acer/__DEVICE__/proprietary/sensorcalibutil_yamaha:/system/bin/sensorcalibutil_yamaha \\

# hw
PRODUCT_COPY_FILES += \\
    vendor/acer/__DEVICE__/proprietary/lights.qsd8k.so:/system/lib/hw/lights.qsd8k.so \\
    vendor/acer/__DEVICE__/proprietary/sensors.salsa.so:/system/lib/hw/sensors.salsa.so \\

DEVICE_PACKAGE_OVERLAYS := vendor/acer/__DEVICE__/overlay

EOF

