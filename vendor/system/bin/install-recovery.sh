#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 10838016 2597f71d73a3cbaab16a651dabfba2bf40053aac 8558592 44c7f5c78bc72f2cba9555b91864e7fb3bc5d3cf
fi

if ! applypatch -c EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery:10838016:2597f71d73a3cbaab16a651dabfba2bf40053aac; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/msm_sdcc.1/by-name/boot:8558592:44c7f5c78bc72f2cba9555b91864e7fb3bc5d3cf EMMC:/dev/block/platform/msm_sdcc.1/by-name/recovery 2597f71d73a3cbaab16a651dabfba2bf40053aac 10838016 44c7f5c78bc72f2cba9555b91864e7fb3bc5d3cf:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
