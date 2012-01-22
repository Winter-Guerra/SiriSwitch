
include /opt/theos/makefiles/common.mk

THEOS_MAKE_PATH=/opt/theos/makefiles/

AGGREGATE_NAME = SiriSwitch
SUBPROJECTS = Preferences Hooks Injector

include $(THEOS_MAKE_PATH)/aggregate.mk

