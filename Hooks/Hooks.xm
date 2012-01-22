#import <UIKit/UIKit.h>
#import "SSPreferences.h"

static BOOL shouldOverrideUnavailableText = NO;

%hook AFConnection

- (BOOL)isAvailable {
    SSPreferences *preferences = SSLoadPreferences();

    if (!SSPreferencesHasProxyURL(preferences) && SSPreferencesUseProxyURL(preferences)) {
        return NO;
    } else {
        return %orig;
    }
}

%end

%hook SBAssistantUnavailableView

- (id)initWithFrame:(CGRect)frame {
    SSPreferences *preferences = SSLoadPreferences();

    if (!SSPreferencesHasProxyURL(preferences) && SSPreferencesUseProxyURL(preferences)) {
        shouldOverrideUnavailableText = YES;
        self = %orig;
        shouldOverrideUnavailableText = NO;
    } else {
        self = %orig;
    }

    return self;
}

%end

%hook NSBundle

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName {
    if (shouldOverrideUnavailableText) {
        if ([key isEqual:@"ASSISTANT_NOT_AVAILABLE_TITLE"]) return @"Siri Proxy Server Not Configured";
        if ([key isEqual:@"ASSISTANT_NOT_AVAILABLE_SUBTITLE"]) return @"Open Settings to configure proxy or disable proxying";
    }

    return %orig;
}

%end