
include /opt/theos/makefiles/common.mk

THEOS_MAKE_PATH=/opt/theos/makefiles/

AGGREGATE_NAME = Spire
SUBPROJECTS = Preferences Installer Hooks Injector

include $(THEOS_MAKE_PATH)/aggregate.mk

