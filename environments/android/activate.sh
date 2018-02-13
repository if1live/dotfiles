ANDROID_ROOT_DIR_LIST=(
  ~/android
  /opt
  /opt/android
  /usr/local/opt
)

function dotfiles::android::sdk_init {
  dotfiles::android::set_sdk_dir ""
  ANDROID_SDK_NAME_LIST=(
    "android-sdk"
    # for linux
    "android-sdk-linux"
    # for osx
    "android-sdk-macosx"
    "adt-bundle-mac-x86_64"
  )

  # find android sdk
  for ANDROID_ROOT_DIR in ${ANDROID_ROOT_DIR_LIST[@]}; do
    for android_sdk_name in ${ANDROID_SDK_NAME_LIST[@]}; do
      local TARGET_DIR=${ANDROID_ROOT_DIR}/${android_sdk_name}
      if [ -d $TARGET_DIR ]; then
        dotfiles::android::set_sdk_dir $TARGET_DIR
        return
      fi
    done
  done
}

function dotfiles::android::ndk_init {
  dotfiles::android::set_ndk_dir ""

  # find android ndk
  for ANDROID_ROOT_DIR in ${ANDROID_ROOT_DIR_LIST[@]}; do
    if [ ! -d $ANDROID_ROOT_DIR ]; then
      continue;
    fi

    for f in $(ls $ANDROID_ROOT_DIR | sort -r); do
      local TARGET=${ANDROID_ROOT_DIR}/$f
      if [ -f $TARGET ]; then
        continue
      fi
      if [[ $f == *"ndk"* ]]; then
        dotfiles::android::set_ndk_dir $TARGET
      fi
    done
  done
}

function dotfiles::android::set_sdk_dir {
  if [[ "$1" == "" ]]; then
    unset ANDROID_SDK_ROOT
    unset ANDROID_HOME
  else
    export PATH=$1/platform-tools:$PATH
    export PATH=$1/tools:$PATH
    export ANDROID_SDK_ROOT=$1
    export ANDROID_HOME=$1
  fi
}

function dotfiles::android::set_ndk_dir {
  if [[ "$1" == "" ]]; then
    unset ANDROID_NDK_VERSION
    unset ANDROID_NDK_ROOT
    unset NDK_ROOT
  else
    # example : android-ndk-r8e
    export ANDROID_NDK_VERSION=`expr "$1" : '.*ndk-\(r[0-9]*[a-z]\)'`
    export ANDROID_NDK_ROOT=$1
    export NDK_ROOT=$1
    export PATH=${ANDROID_NDK_ROOT}:$PATH
  fi
}

function dotfiles::android::display {
  echo "## Android"

  if [[ $ANDROID_SDK_ROOT == "" ]]; then
    echo "Android SDK is not exist"
  else
    echo "Android SDK\t: ${ANDROID_SDK_ROOT}"
  fi

  if [[ $ANDROID_NDK_ROOT == "" ]]; then
    echo "NDK is not exist"
  else
    echo "NDK(${ANDROID_NDK_VERSION})\t: ${ANDROID_NDK_ROOT}"
  fi

  if [[ $NDK_CCACHE == "" ]]; then
    echo "ccache is not exist"
  else
    echo "ccache\t\t: Enabled"
  fi
  echo ""
}

function dotfiles::android::ccache {
  export NDK_CCACHE=`which ccache`
  if [[ $NDK_CCACHE == "ccache not found" ]]; then
    NDK_CCACHE=""
  fi
}


function dotfiles::android::reset_adb {
  # http://stackoverflow.com/questions/9210152/set-up-device-for-development-no-permissions
  # Fix this problem
  # List of devices attached
  # ????????????    no permissions
  # Configure udev or use root permission
  # I use root permission becuase zshrc configuration file is used in many computer.
  sudo adb kill-server
  sudo adb start-server
  sudo adb devices
}

function dotfiles::android::setup {
  #http://stackoverflow.com/questions/22701405/aapt-ioexception-error-2-no-such-file-or-directory-why-cant-i-build-my-grad
  # for x86_64 + android sdk
  sudo apt-get install lib32stdc++6 lib32z1
}


dotfiles::android::sdk_init
dotfiles::android::ndk_init
dotfiles::android::ccache
dotfiles::android::display
