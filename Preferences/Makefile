

include /opt/theos/makefiles/common.mk

THEOS_MAKE_PATH=/opt/theos/makefiles/

BUNDLE_NAME = SiriSwitchPreferences
SiriSwitchPreferences_FILES = Preferences.mm
SiriSwitchPreferences_OBJCFLAGS = -I$(THEOS_PROJECT_DIR) -F$(THEOS_PROJECT_DIR)
SiriSwitchPreferences_FRAMEWORKS = UIKit
SiriSwitchPreferences_PRIVATE_FRAMEWORKS = Preferences
SiriSwitchPreferences_INSTALL_PATH = /Library/PreferenceBundles

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp SiriSwitch.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/SiriSwitch.plist$(ECHO_END)

