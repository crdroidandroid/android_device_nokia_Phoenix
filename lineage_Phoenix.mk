# Device Stuff
$(call inherit-product, device/nokia/Phoenix/device.mk)

# Inherit some common LineageOS stuff.
TARGET_BOOT_ANIMATION_RES := 1080
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_Phoenix
PRODUCT_DEVICE := Phoenix
PRODUCT_BRAND := Nokia
PRODUCT_MODEL := Nokia 8.1
PRODUCT_MANUFACTURER := Nokia

BUILD_FINGERPRINT := "google/redfin/redfin:11/RQ3A.210805.001.A1/7474174:user/release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="redfin-user 11 RQ3A.210805.001.A1 7474174 release-keys" \
    PRODUCT_NAME="Phoenix_00WW" \
    PRODUCT_DEVICE="Phoenix"
DEVICE_MAINTAINER := NAME
PRODUCT_GMS_CLIENTID_BASE := android-nokia
