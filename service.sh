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
check_reset_prop "ro.vendor.build.fingerprint" "Xiaomi/haotian/haotian:15/AQ3A.240812.002/OS2.0.101.0.VOBCNXM:user/release-keys"
check_reset_prop "ro.odm.build.fingerprint" "Xiaomi/haotian/haotian:15/AQ3A.240812.002/OS2.0.101.0.VOBCNXM:user/release-keys"
check_reset_prop "ro.build.fingerprint" "Xiaomi/haotian/haotian:15/AQ3A.240812.002/OS2.0.101.0.VOBCNXM:user/release-keys"
check_reset_prop "ro.bootimage.build.fingerprint" "Xiaomi/haotian/haotian:15/AQ3A.240812.002/OS2.0.101.0.VOBCNXM:user/release-keys"
