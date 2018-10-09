# Inherit mini common Lineage stuff
$(call inherit-product, vendor/viper/config/common_mini.mk)

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
endif
