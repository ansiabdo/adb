# APP_ABI := arm64-v8a
APP_ABI := armeabi-v7a arm64-v8a x86 x86_64
APP_CFLAGS := -std=c11 -fcolor-diagnostics -fPIC -Wno-attributes
APP_CPPFLAGS := -std=c++20 -fcolor-diagnostics -fPIC -Wno-attributes
# APP_STL := c++_static
# APP_PLATFORM := android-24
APP_STRIP_MODE := --strip-all
