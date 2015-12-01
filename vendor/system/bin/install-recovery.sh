#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 10838016 237be4ab7902044aeffdf251bb3a511ed58a8bfb 8558592 858b037f7b17f84b67fb1637813f0e689786a05c
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:10838016:237be4ab7902044aeffdf251bb3a511ed58a8bfb; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:8558592:858b037f7b17f84b67fb1637813f0e689786a05c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 237be4ab7902044aeffdf251bb3a511ed58a8bfb 10838016 858b037f7b17f84b67fb1637813f0e689786a05c:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
