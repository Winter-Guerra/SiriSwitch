
#import "SSPreferences.h"

%hook ADAccount

- (NSString *)hostname {
    SSPreferences *preferences = SSLoadPreferences(); //Return a autoreleased dictionary

    // Only use the proxy URL only if the user has turned proxying ON.
    if (SSPreferencesUseProxyURL(preferences)) {
        return SSPreferencesGetProxyURL(preferences);
    } else {
        return @"https://guzzoni.apple.com"; //Return default.
    }
}

%end



