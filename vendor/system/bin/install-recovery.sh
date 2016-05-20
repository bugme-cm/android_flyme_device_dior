#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 16570368 7261c23e5ce672b4cee88a104eb932905170a610 14282752 9aecb107580b09a51c754dcd25c200fd3105dc7b
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:16570368:7261c23e5ce672b4cee88a104eb932905170a610; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:14282752:9aecb107580b09a51c754dcd25c200fd3105dc7b EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 7261c23e5ce672b4cee88a104eb932905170a610 16570368 9aecb107580b09a51c754dcd25c200fd3105dc7b:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
