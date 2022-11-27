#!/com/termux/files/usr/bin/bash

out_dir="output"
api="24"
stl="c++_static"

${NDK_PATH}/ndk-build \
    NDK_PROJECT_PATH=. \
    APP_BUILD_SCRIPT=Android.mk \
    NDK_APPLICATION_MK=Application.mk \
    NDK_LIBS_OUT="$out_dir" \
    APP_PLATFORM="android-$api" \
    APP_STL="$stl" \
    NDK_DEBUG=0 \
    -j8 || exit 1


declare -a abis=("armeabi-v7a" "arm64-v8a" "x86" "x86_64")
for i in ${!abis[@]}; do
    adb="${out_dir}/${abis[$i]}/adb"
    if [ -e "$adb" ]
        then termux-elf-cleaner \
                 --api-level "$api" \
                 "$adb" || exit 1
    fi
done