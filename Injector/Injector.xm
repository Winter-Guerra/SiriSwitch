
#import "SSPreferences.h"

%hook ADAccount

- (NSString *)hostname {
    SSPreferences *preferences = SSLoadPreferences();

    // Only use the proxy URL only if the user has turned proxying ON.
    if (SSPreferencesUseProxyURL(preferences)) {
        return SSPreferencesGetProxyURL(preferences);
    } else {
        return %orig;
    }
}

%end



