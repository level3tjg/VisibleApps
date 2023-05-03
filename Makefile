TARGET := iphone:clang:latest:15.0
ARCHS = arm64 arm64e
INSTALL_TARGET_PROCESSES = SpringBoard

ifneq ($(THEOS_PACKAGE_SCHEME),rootless)
TARGET := iphone:clang:14.2:7.0
ARCHS := armv7 armv7s $(ARCHS)
PREFIX = /Applications/Xcode-11.7.0.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/
endif

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = VisibleApps

$(TWEAK_NAME)_FILES = Tweak.x
$(TWEAK_NAME)_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
