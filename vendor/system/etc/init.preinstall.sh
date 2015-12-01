#!/system/bin/sh

cd /system/media/app

#android shell script: check if preinstall is exist
if [ -s /data/property/persist.preinstalled ]; then
    echo "don't need to copy preinstall files"
else
    # scan all apk files under system/media/app
    apklist="$(ls)"
    for apkfile in ${apklist}; do
        #copy all apk file to data/app
        dd if=${apkfile} of=/data/app/${apkfile}
        # change the permission
        chmod 666 /data/app/${apkfile}
    done
    setprop persist.preinstalled  y
fi

#delete preinstall apps
cd ../../..
rm -rf /system/media/app
