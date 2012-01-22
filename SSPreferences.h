
#import <Foundation/Foundation.h>

typedef NSDictionary SSPreferences;

static NSDictionary *SSLoadPreferences() {
    return [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.XtremD.SiriSwitch.preferences.plist"];
}

static NSString *SSPreferencesGetProxyURL(SSPreferences *preferences) {
    return [preferences objectForKey:@"SSProxyURL"];
}

static BOOL SSPreferencesHasProxyURL(SSPreferences *preferences) {
    NSString *proxy = SSPreferencesGetProxyURL(preferences);
    return proxy != nil && [[proxy stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] > 0;
}

static BOOL *SSPreferencesUseProxyURL(SSPreferences *preferences) {
    return [preferences objectForKey:@"SSProxySwitch"];
}