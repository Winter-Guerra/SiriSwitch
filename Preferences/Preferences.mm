#import <UIKit/UIKit.h>

@interface PSListController : UIViewController {
    id _specifiers;
}
- (id)loadSpecifiersFromPlistName:(NSString *)name target:(id)target;
@end

@interface SSPreferencesListController : PSListController
@end

@implementation SSPreferencesListController

- (NSArray *)specifiers {
    if (!_specifiers) {
        _specifiers =  [[self loadSpecifiersFromPlistName:@"SiriSwitchPreferences" target:self] mutableCopy];
    }

    return _specifiers;
}

- (void)moreInfoPressed:(id)specifier {
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://chpwn.com/apps/spire"]];
    UIActionSheet *moreInfoApology = [[UIActionSheet alloc] 
    	initWithTitle:@"More info on this tool is not available at this time. Sorry!" 
        delegate:nil 
        cancelButtonTitle:nil  destructiveButtonTitle:nil 
        otherButtonTitles:@"Alright", nil];
    [moreInfoApology showInView:self.view];
    [moreInfoApology release];
}

- (void)donatePressed:(id)specifier {
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://chpwn.com/apps/spire/donate"]];
    UIActionSheet *donationApology = [[UIActionSheet alloc] 
    	initWithTitle:@"I'm not accepting donations at this time, but thanks for the kind thought! Truthfully, I just haven't gotten arround to setting up my donation pages." 
        delegate:nil 
        cancelButtonTitle:nil  destructiveButtonTitle:nil 
        otherButtonTitles:@"Alright", nil];
    [donationApology showInView:self.view];
    [donationApology release];
}

@end

