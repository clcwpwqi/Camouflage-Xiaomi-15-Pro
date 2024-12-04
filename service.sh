#!/system/bin/sh

check_reset_prop() {
  local NAME=$1
  local EXPECTED=$2
  local VALUE=$(resetprop $NAME)
  [ -z $VALUE ] || [ $VALUE = $EXPECTED ] || resetprop $NAME $EXPECTED
}

contains_reset_prop() {
  local NAME=$1
  local CONTAINS=$2
  local NEWVAL=$3
  [[ "$(resetprop $NAME)" = *"$CONTAINS"* ]] && resetprop $NAME $NEWVAL
}

resetprop -w sys.boot_completed 0

check_reset_prop "ro.boot.vbmeta.device_state" "locked"
check_reset_prop "ro.boot.verifiedbootstate" "green"
check_reset_prop "ro.boot.flash.locked" "1"
check_reset_prop "ro.boot.veritymode" "enforcing"
check_reset_prop "ro.boot.warranty_bit" "0"
check_reset_prop "ro.warranty_bit" "0"
check_reset_prop "ro.debuggable" "0"
check_reset_prop "ro.force.debuggable" "0"
check_reset_prop "ro.secure" "1"
check_reset_prop "ro.adb.secure" "1"
check_reset_prop "ro.build.type" "user"
check_reset_prop "ro.build.tags" "release-keys"
check_reset_prop "ro.vendor.boot.warranty_bit" "0"
check_reset_prop "ro.vendor.warranty_bit" "0"
check_reset_prop "vendor.boot.vbmeta.device_state" "locked"
check_reset_prop "vendor.boot.verifiedbootstate" "green"
check_reset_prop "sys.oem_unlock_allowed" "0"

# MIUI specific
check_reset_prop "ro.secureboot.lockstate" "locked"

# Realme specific
check_reset_prop "ro.boot.realmebootstate" "green"
check_reset_prop "ro.boot.realme.lockstate" "1"

# Hide that we booted from recovery when magisk is in recovery mode
contains_reset_prop "ro.bootmode" "recovery" "unknown"
contains_reset_prop "ro.boot.bootmode" "recovery" "unknown"
contains_reset_prop "vendor.boot.bootmode" "recovery" "unknown"

# 认证型号
check_reset_prop "ro.product.vendor.cert" "2410DPN6CC"
check_reset_prop "ro.product.odm.cert" "2410DPN6CC"
check_reset_prop "ro.product.cert" "2410DPN6CC"
check_reset_prop "ro.boot.cert" "2410DPN6CC"

#设备代号
check_reset_prop "ro.product.product.name" "haotian"
check_reset_prop "ro.product.vendor.device" "haotian"
check_reset_prop "ro.product.vendor.name" "haotian"
check_reset_prop "ro.product.odm.name" "haotian"
check_reset_prop "ro.product.odm.device" "haotian"
check_reset_prop "ro.product.name" "haotian"
check_reset_prop "ro.product.mod_device" "haotian"
check_reset_prop "ro.product.device" "haotian"
check_reset_prop "ro.product.board" "haotian"

#设备指纹
check_reset_prop "ro.vendor.build.fingerprint" "Xiaomi/haotian/haotian:15/AQ3A.240812.002/OS2.0.23.2.VOBCNXM:user/release-keys"
check_reset_prop "ro.odm.build.fingerprint" "Xiaomi/haotian/haotian:15/AQ3A.240812.002/OS2.0.23.2.VOBCNXM:user/release-keys"
check_reset_prop "ro.build.fingerprint" "Xiaomi/haotian/haotian:15/AQ3A.240812.002/OS2.0.23.2.VOBCNXM:user/release-keys"
check_reset_prop "ro.bootimage.build.fingerprint" "Xiaomi/haotian/haotian:15/AQ3A.240812.002/OS2.0.23.2.VOBCNXM:user/release-keys"
