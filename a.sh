# credits to rktdnt
# sync
/opt/crave/resync.sh

# signing
rm -rf vendor/lineage-priv/keys
git clone --depth=1 https://github.com/mdalam073/p3 vendor/lineage-priv/keys

#rm -rf vendor/aosp/signing/keys
#git clone https://github.com/mdalam073/p3 -b pos vendor/aosp/signing/keys

# extras be4 beelding
rm -rf hardware/mediatek
git clone https://github.com/LineageOS/android_hardware_mediatek hardware/mediatek -b lineage-21
rm -rf device/mediatek/sepolicy_vndr
git clone https://github.com/LineageOS/android_device_mediatek_sepolicy_vndr device/mediatek/sepolicy_vndr -b lineage-21 

# trees
rm -rf */xiaomi
git clone --depth=1 https://github.com/plrine/device_xiaomi_mt6768-common device/xiaomi/mt6768-common -b lineage-21
git clone --depth=1 https://github.com/mdalam073/device_xiaomi_merlinx device/xiaomi/merlinx -b alpha-14
git clone --depth=1 https://github.com/plrine/vendor_xiaomi_mt6768_common vendor/xiaomi/mt6768-common -b lineage-21
git clone --depth=1 https://github.com/lilium-haine/vendor_xiaomi_merlinx vendor/xiaomi/merlinx -b lineage-21
git clone --depth=1 https://github.com/plrine/kernel_xiaomi_mt6768 kernel/xiaomi/mt6768 -b main
git clone --depth=1 https://github.com/LineageOS/android_hardware_xiaomi hardware/xiaomi

cd vendor/lineage
git fetch https://github.com/LineageOS/android_vendor_lineage refs/changes/89/405989/1 && git cherry-pick FETCH_HEAD
cd ../..

#beelding
. build/envsetup.sh
brunch merlinx
