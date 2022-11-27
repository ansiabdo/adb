LOCAL_PATH := $(call my-dir)

#
# libsystem
#
include $(CLEAR_VARS)
LOCAL_MODULE:= libsystem
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/libsystem/include
include $(BUILD_STATIC_LIBRARY)

#
# libbase
#
include $(CLEAR_VARS)
LOCAL_MODULE:= libbase
LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/libbase/include \
    $(LOCAL_PATH)/liblog/include \
    $(LOCAL_PATH)/include
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/libbase/include
LOCAL_STATIC_LIBRARIES := libfmt
LOCAL_SRC_FILES := \
    libbase/abi_compatibility.cpp \
    libbase/chrono_utils.cpp \
    libbase/cmsg.cpp \
    libbase/file.cpp \
    libbase/hex.cpp \
    libbase/logging.cpp \
    libbase/mapped_file.cpp \
    libbase/parsebool.cpp \
    libbase/parsenetaddress.cpp \
    libbase/posix_strerror_r.cpp \
    libbase/process.cpp \
    libbase/properties.cpp \
    libbase/stringprintf.cpp \
    libbase/strings.cpp \
    libbase/threads.cpp \
    libbase/test_utils.cpp \
    libbase/errors_unix.cpp
include $(BUILD_STATIC_LIBRARY)

#
# libutils
#
include $(CLEAR_VARS)
LOCAL_MODULE:= libutils
LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/libbase/include \
    $(LOCAL_PATH)/liblog/include \
    $(LOCAL_PATH)/include
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/libutils/include
LOCAL_SRC_FILES := \
    libutils/FileMap.cpp \
	libutils/SharedBuffer.cpp \
	libutils/String16.cpp \
	libutils/String8.cpp \
	libutils/VectorImpl.cpp \
	libutils/Unicode.cpp
include $(BUILD_STATIC_LIBRARY)

#
# libcutils
#
include $(CLEAR_VARS)
LOCAL_MODULE:= libcutils
LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/libbase/include \
    $(LOCAL_PATH)/libcutils/include \
    $(LOCAL_PATH)/liblog/include \
    $(LOCAL_PATH)/include
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/libcutils/include
LOCAL_CPPFLAGS := -D_GNU_SOURCE
LOCAL_SRC_FILES := \
    libcutils/android_get_control_file.cpp \
    libcutils/ashmem-host.cpp \
	libcutils/canned_fs_config.cpp \
	libcutils/config_utils.cpp \
	libcutils/fs.cpp \
	libcutils/fs_config.cpp \
	libcutils/hashmap.cpp \
	libcutils/iosched_policy.cpp \
	libcutils/load_file.cpp \
	libcutils/multiuser.cpp \
	libcutils/native_handle.cpp \
	libcutils/properties.cpp \
	libcutils/record_stream.cpp \
	libcutils/socket_inaddr_any_server_unix.cpp \
	libcutils/socket_local_client_unix.cpp \
	libcutils/socket_local_server_unix.cpp \
	libcutils/socket_network_client_unix.cpp \
	libcutils/sockets_unix.cpp \
	libcutils/sockets.cpp \
	libcutils/str_parms.cpp \
	libcutils/strlcpy.c \
	libcutils/trace-host.cpp \
	libcutils/threads.cpp
include $(BUILD_STATIC_LIBRARY)

#
# liblog
#
include $(CLEAR_VARS)
LOCAL_MODULE:= liblog
LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/libbase/include \
    $(LOCAL_PATH)/liblog/include \
    $(LOCAL_PATH)/libcutils/include \
    $(LOCAL_PATH)/include
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/liblog/include
LOCAL_CPPFLAGS := -DLIBLOG_LOG_TAG=1006 -D_XOPEN_SOURCE=700 -DFAKE_LOG_DEVICE=1
LOCAL_SRC_FILES := \
    liblog/log_event_list.cpp \
	liblog/log_event_write.cpp \
	liblog/logger_name.cpp \
	liblog/logger_read.cpp \
	liblog/logger_write.cpp \
	liblog/properties.cpp \
	liblog/logprint.cpp
include $(BUILD_STATIC_LIBRARY)

#
# libandroidfw
#
include $(CLEAR_VARS)
LOCAL_MODULE:= libandroidfw
LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/libbase/include \
    $(LOCAL_PATH)/liblog/include \
    $(LOCAL_PATH)/androidfw/include \
    $(LOCAL_PATH)/libziparchive/include \
    $(LOCAL_PATH)/libziparchive/incfs_support/include \
    $(LOCAL_PATH)/incfs/util/include \
    $(LOCAL_PATH)/include
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/androidfw/include
LOCAL_STATIC_LIBRARIES := libfmt
LOCAL_CPPFLAGS := -D_GNU_SOURCE -DNDEBUG
LOCAL_EXPORT_CPPFLAGS := -DSTATIC_ANDROIDFW_FOR_TOOLS
LOCAL_SRC_FILES := \
    androidfw/ApkAssets.cpp \
    androidfw/Asset.cpp \
    androidfw/AssetDir.cpp \
    androidfw/AssetManager.cpp \
    androidfw/AssetManager2.cpp \
    androidfw/AttributeResolution.cpp \
    androidfw/ChunkIterator.cpp \
    androidfw/ConfigDescription.cpp \
    androidfw/Idmap.cpp \
    androidfw/LoadedArsc.cpp \
    androidfw/Locale.cpp \
    androidfw/LocaleData.cpp \
    androidfw/misc.cpp \
    androidfw/ObbFile.cpp \
    androidfw/PosixUtils.cpp \
    androidfw/ResourceTypes.cpp \
    androidfw/ResourceUtils.cpp \
    androidfw/StreamingZipInflater.cpp \
    androidfw/TypeWrappers.cpp \
    androidfw/Util.cpp \
    androidfw/ZipFileRO.cpp \
    androidfw/ZipUtils.cpp
include $(BUILD_STATIC_LIBRARY)

#
# libincfs
#
include $(CLEAR_VARS)
LOCAL_MODULE:= libincfs
LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/libbase/include \
    $(LOCAL_PATH)/liblog/include \
    $(LOCAL_PATH)/incfs/util/include \
    $(LOCAL_PATH)/include
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/incfs/util/include
LOCAL_SRC_FILES := incfs/util/map_ptr.cpp
include $(BUILD_STATIC_LIBRARY)

#
# libziparchive
#
include $(CLEAR_VARS)
LOCAL_MODULE:= libziparchive
LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/libbase/include \
    $(LOCAL_PATH)/liblog/include \
    $(LOCAL_PATH)/libziparchive/include \
    $(LOCAL_PATH)/libziparchive/incfs_support/include \
    $(LOCAL_PATH)/include
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/libziparchive/include
LOCAL_STATIC_LIBRARIES := libgtest
LOCAL_CPPFLAGS := -DZLIB_CONST -DZIPARCHIVE_DISABLE_CALLBACK_API=1
LOCAL_SRC_FILES := \
    libziparchive/zip_archive.cc \
	libziparchive/zip_archive_stream_entry.cc \
	libziparchive/zip_cd_entry_map.cc \
	libziparchive/zip_error.cpp \
	libziparchive/zip_writer.cc \
	libziparchive/incfs_support/signal_handling.cpp
include $(BUILD_STATIC_LIBRARY)

#
# libcrypto_utils
#
include $(CLEAR_VARS)
LOCAL_MODULE:= libcrypto_utils
LOCAL_C_INCLUDES := $(LOCAL_PATH)/libcrypto_utils/include
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/libcrypto_utils/include
LOCAL_STATIC_LIBRARIES := libcrypto
LOCAL_SRC_FILES := libcrypto_utils/android_pubkey.cpp
include $(BUILD_STATIC_LIBRARY)

#
# adb
#
include $(CLEAR_VARS)
LOCAL_MODULE:= adb
LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/adb \
    $(LOCAL_PATH)/adb/proto \
    $(LOCAL_PATH)/adb/fastdeploy/proto \
    $(LOCAL_PATH)/adb/fastdeploy/deployagent \
	$(LOCAL_PATH)/adb/crypto/include \
	$(LOCAL_PATH)/adb/pairing_auth/include \
	$(LOCAL_PATH)/adb/pairing_connection/include \
	$(LOCAL_PATH)/adb/tls/include
LOCAL_STATIC_LIBRARIES := \
    libsystem \
    libbase \
    libutils \
    libcutils \
    liblog \
    libandroidfw \
    libincfs \
    libziparchive \
    libcrypto_utils \
    libcrypto \
    libssl \
    libprotobuf \
    libusb \
    libbrotli \
    liblz4 \
    libzstd \
    libz
LOCAL_CPPFLAGS := -DADB_HOST=1 -D_GNU_SOURCE -DENABLE_FASTDEPLOY
LOCAL_SRC_FILES := \
    adb/client/main.cpp \
    adb/client/adb_client.cpp \
	adb/client/adb_install.cpp \
	adb/client/adb_wifi.cpp \
	adb/client/auth.cpp \
	adb/client/bugreport.cpp \
	adb/client/commandline.cpp \
	adb/client/console.cpp \
	adb/client/file_sync_client.cpp \
	adb/client/incremental.cpp \
	adb/client/incremental_server.cpp \
	adb/client/incremental_utils.cpp \
	adb/client/line_printer.cpp \
	adb/client/fastdeploy.cpp \
	adb/client/fastdeploycallbacks.cpp \
	adb/client/pairing/pairing_client.cpp \
	adb/client/transport_local.cpp \
	adb/client/transport_usb.cpp \
	adb/client/usb_libusb.cpp \
	adb/client/usb_linux.cpp \
	adb/pairing_auth/aes_128_gcm.cpp \
	adb/pairing_auth/pairing_auth.cpp \
	adb/pairing_connection/pairing_connection.cpp \
	adb/sysdeps_unix.cpp \
	adb/sysdeps/errno.cpp \
	adb/sysdeps/posix/network.cpp \
	adb/sysdeps/env.cpp \
	adb/crypto/key.cpp \
	adb/crypto/rsa_2048_key.cpp \
	adb/crypto/x509_generator.cpp \
	adb/tls/adb_ca_list.cpp \
	adb/tls/tls_connection.cpp \
	adb/adb.cpp \
	adb/adb_io.cpp \
	adb/adb_listeners.cpp \
	adb/adb_trace.cpp \
	adb/adb_unique_fd.cpp \
	adb/adb_utils.cpp \
	adb/shell_service_protocol.cpp \
	adb/sockets.cpp \
	adb/socket_spec.cpp \
	adb/transport.cpp \
	adb/transport_fd.cpp \
	adb/types.cpp \
	adb/services.cpp \
	adb/fdevent/fdevent.cpp \
	adb/fdevent/fdevent_poll.cpp \
	adb/fdevent/fdevent_epoll.cpp \
	adb/proto/app_processes.pb.cc \
	adb/proto/adb_known_hosts.pb.cc \
	adb/proto/key_type.pb.cc \
	adb/proto/pairing.pb.cc \
	adb/fastdeploy/proto/ApkEntry.pb.cc \
	adb/fastdeploy/deploypatchgenerator/apk_archive.cpp \
    adb/fastdeploy/deploypatchgenerator/deploy_patch_generator.cpp \
    adb/fastdeploy/deploypatchgenerator/patch_utils.cpp
include $(BUILD_EXECUTABLE)

include external/Android.mk
