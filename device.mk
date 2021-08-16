# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Set shipping API level
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o_mr1.mk)

# Get non-open-source specific aspects
$(call inherit-product, vendor/nokia/Phoenix/Phoenix-vendor.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 2280
TARGET_SCREEN_WIDTH := 1080

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# A/B Updater
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl.recovery \
    bootctrl.sdm710.recovery \
    bootctrl.sdm710

PRODUCT_PACKAGES_DEBUG += \
    bootctl

# Camera
PRODUCT_PACKAGES += \
    Snap

# Display
PRODUCT_PACKAGES += \
    libdisplayconfig \
    libqdMetaData \
    libqdMetaData.system \
    libvulkan \
    vendor.display.config@1.0

# Fingerprint
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml

# Fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# IDC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/idc/goodix_fp.idc:system/usr/idc/goodix_fp.idc

# IMS
PRODUCT_PACKAGES += \
    ims-ext-common \
    ims_ext_common.xml

PRODUCT_PACKAGES += \
    qti-telephony-utils \
    qti_telephony_utils.xml \

# Init
PRODUCT_PACKAGES += \
    init.qcom.rc

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/goodix_fp.kl:system/usr/keylayout/goodix_fp.kl

# LiveDisplay
PRODUCT_PACKAGES += \
    lineage.livedisplay@2.0-service-sdm

# Misc
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.controls.xml:system/etc/permissions/android.software.controls.xml

# Net
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    com.android.nfc_extras

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service-qti \
    vendor.qti.hardware.perf@2.2

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# System properties
-include $(LOCAL_PATH)/system_prop.mk

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext \
    qti-telephony-hidl-wrapper \
    qti_telephony_hidl_wrapper.xml \

PRODUCT_BOOT_JARS += \
    telephony-ext

# Trust HAL
PRODUCT_PACKAGES += \
    vendor.lineage.trust@1.0-service

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

# VNDK
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v29/arm64/arch-arm-armv8-a/shared/vndk-sp/libcutils.so:$(TARGET_COPY_OUT_SYSTEM)/lib/libcutils-v29.so \
    prebuilts/vndk/v29/arm64/arch-arm64-armv8-a/shared/vndk-sp/libcutils.so:$(TARGET_COPY_OUT_SYSTEM)/lib64/libcutils-v29.so

# WiFi Display
PRODUCT_PACKAGES += \
    libnl

PRODUCT_BOOT_JARS += \
    WfdCommon