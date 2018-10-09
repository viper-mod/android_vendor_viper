# Inherit full common Lineage stuff
$(call inherit-product, vendor/viper/config/common_full.mk)

ifeq ($(SUDA_CPU_ABI),arm64-v8a)
PRODUCT_PACKAGES += \
    GooglePinYin

PRODUCT_COPY_FILES += $(shell test -d vendor/lineage/prebuilt/common/app/GooglePinYin && \
    find vendor/lineage/prebuilt/common/app/GooglePinYin -name '*.so' \
    -printf '%p:system/app/GooglePinYin/lib/arm64/%f ')
else
# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include Lineage LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/viper/overlay/dictionaries
endif

$(call inherit-product, vendor/viper/config/telephony.mk)
