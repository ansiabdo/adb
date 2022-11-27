LOCAL_PATH := $(call my-dir)

#
# libcrypto
#
include $(CLEAR_VARS)
LOCAL_MODULE := libcrypto
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/boringssl/include
LOCAL_SRC_FILES := boringssl/lib/$(TARGET_ARCH_ABI)/libcrypto.a
include $(PREBUILT_STATIC_LIBRARY)

#
# libssl
#
include $(CLEAR_VARS)
LOCAL_MODULE := libssl
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/boringssl/include
LOCAL_SRC_FILES := boringssl/lib/$(TARGET_ARCH_ABI)/libssl.a
include $(PREBUILT_STATIC_LIBRARY)

#
# libprotobuf
#
include $(CLEAR_VARS)
LOCAL_MODULE := libprotobuf
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/protobuf/src
LOCAL_SRC_FILES := protobuf/lib/$(TARGET_ARCH_ABI)/libprotobuf.a
include $(PREBUILT_STATIC_LIBRARY)

#
# libgtest
#
include $(CLEAR_VARS)
LOCAL_MODULE := libgtest
LOCAL_C_INCLUDES := $(LOCAL_PATH)/googletest $(LOCAL_PATH)/googletest/include
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/googletest/include
LOCAL_SRC_FILES := googletest/src/gtest-all.cc
include $(BUILD_STATIC_LIBRARY)

#
# libfmt
#
include $(CLEAR_VARS)
LOCAL_MODULE := libfmt
LOCAL_C_INCLUDES := $(LOCAL_PATH)/fmtlib/include
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/fmtlib/include
LOCAL_CFLAGS := -DNDEBUG -fno-exceptions
LOCAL_SRC_FILES := \
    fmtlib/src/format.cc \
    fmtlib/src/os.cc
include $(BUILD_STATIC_LIBRARY)

#
# libusb
#
include $(CLEAR_VARS)
LIBUSB_INCLUDES = $(LOCAL_PATH)/libusb $(LOCAL_PATH)/libusb/libusb
LOCAL_MODULE := libusb
LOCAL_C_INCLUDES := $(LIBUSB_INCLUDES) $(LOCAL_PATH)/libusb/libusb/os $(LOCAL_PATH)/libusb/android
LOCAL_EXPORT_C_INCLUDES := $(LIBUSB_INCLUDES)
LOCAL_CFLAGS := -fvisibility=hidden -pthread
LOCAL_SRC_FILES := \
    libusb/libusb/core.c \
    libusb/libusb/descriptor.c \
    libusb/libusb/hotplug.c \
    libusb/libusb/io.c \
    libusb/libusb/sync.c \
    libusb/libusb/strerror.c \
    libusb/libusb/os/linux_usbfs.c \
    libusb/libusb/os/events_posix.c \
    libusb/libusb/os/threads_posix.c \
    libusb/libusb/os/linux_netlink.c
include $(BUILD_STATIC_LIBRARY)

#
# libbrotli
#
include $(CLEAR_VARS)
LOCAL_MODULE := libbrotli
LOCAL_C_INCLUDES := $(LOCAL_PATH)/brotli/include
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/brotli/include
LOCAL_SRC_FILES := \
    brotli/dec/state.c \
    brotli/dec/huffman.c \
    brotli/dec/bit_reader.c \
    brotli/dec/decode.c \
    brotli/enc/encoder_dict.c \
    brotli/enc/histogram.c \
    brotli/enc/memory.c \
    brotli/enc/compress_fragment.c \
    brotli/enc/entropy_encode.c \
    brotli/enc/backward_references.c \
    brotli/enc/literal_cost.c \
    brotli/enc/fast_log.c \
    brotli/enc/bit_cost.c \
    brotli/enc/utf8_util.c \
    brotli/enc/backward_references_hq.c \
    brotli/enc/metablock.c \
    brotli/enc/compress_fragment_two_pass.c \
    brotli/enc/command.c \
    brotli/enc/brotli_bit_stream.c \
    brotli/enc/encode.c \
    brotli/enc/dictionary_hash.c \
    brotli/enc/cluster.c \
    brotli/enc/block_splitter.c \
    brotli/enc/static_dict.c \
    brotli/common/platform.c \
    brotli/common/context.c \
    brotli/common/transform.c \
    brotli/common/constants.c \
    brotli/common/dictionary.c
include $(BUILD_STATIC_LIBRARY)

#
# liblz4
#
include $(CLEAR_VARS)
LOCAL_MODULE := liblz4
LOCAL_C_INCLUDES := $(LOCAL_PATH)/lz4
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/lz4
LOCAL_SRC_FILES := \
    lz4/lz4.c \
    lz4/lz4frame.c \
    lz4/lz4hc.c \
    lz4/xxhash.c
include $(BUILD_STATIC_LIBRARY)

#
# libzstd
#
include $(CLEAR_VARS)
LIBZSTD_INCLUDES = $(LOCAL_PATH)/zstd $(LOCAL_PATH)/zstd/common
LOCAL_MODULE := libzstd
LOCAL_C_INCLUDES := $(LIBZSTD_INCLUDES)
LOCAL_EXPORT_C_INCLUDES := $(LIBZSTD_INCLUDES)
LOCAL_CFLAGS := -DXXH_NAMESPACE=ZSTD_ -DZSTD_LEGACY_SUPPORT=0 \
    -Wall -Werror -Wno-error -Wno-pointer-arith
LOCAL_SRC_FILES := \
    zstd/common/error_private.c \
    zstd/common/fse_decompress.c \
    zstd/common/debug.c \
    zstd/common/pool.c \
    zstd/common/entropy_common.c \
    zstd/common/threading.c \
    zstd/common/zstd_common.c \
    zstd/common/xxhash.c \
    zstd/compress/zstd_ldm.c \
    zstd/compress/hist.c \
    zstd/compress/zstd_opt.c \
    zstd/compress/zstd_lazy.c \
    zstd/compress/zstd_compress_sequences.c \
    zstd/compress/zstd_compress_superblock.c \
    zstd/compress/zstd_compress_literals.c \
    zstd/compress/zstdmt_compress.c \
    zstd/compress/fse_compress.c \
    zstd/compress/huf_compress.c \
    zstd/compress/zstd_compress.c \
    zstd/compress/zstd_double_fast.c \
    zstd/compress/zstd_fast.c \
    zstd/dictBuilder/fastcover.c \
    zstd/dictBuilder/divsufsort.c \
    zstd/dictBuilder/zdict.c \
    zstd/dictBuilder/cover.c \
    zstd/decompress/zstd_decompress_block.c \
    zstd/decompress/huf_decompress.c \
    zstd/decompress/zstd_ddict.c \
    zstd/decompress/zstd_decompress.c \
    zstd/decompress/huf_decompress_amd64.S
include $(BUILD_STATIC_LIBRARY)

#
# libz
#
include $(CLEAR_VARS)
LOCAL_MODULE := libz
LOCAL_C_INCLUDES := $(LOCAL_PATH)/zlib
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/zlib
LOCAL_CFLAGS := \
    -DHAVE_HIDDEN -DZLIB_CONST -Wall -Werror \
    -Wno-unused -Wno-unused-parameter
LOCAL_SRC_FILES := \
    zlib/adler32.c \
    zlib/compress.c \
    zlib/cpu_features.c \
    zlib/crc32.c \
    zlib/deflate.c \
    zlib/gzclose.c \
    zlib/gzlib.c \
    zlib/gzread.c \
    zlib/gzwrite.c \
    zlib/infback.c \
    zlib/inffast.c \
    zlib/inflate.c \
    zlib/inftrees.c \
    zlib/trees.c \
    zlib/uncompr.c \
    zlib/zutil.c
include $(BUILD_STATIC_LIBRARY)
