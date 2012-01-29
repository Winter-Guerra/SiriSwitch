#import <UIKit/UIKit.h>

@interface PSListController : UIViewController {
    id _specifiers;
}
- (id)loadSpecifiersFromPlistName:(NSString *)name target:(id)target;
@end

@interface SSPreferencesListController : PSListController <UIActionSheetDelegate>
@end

@implementation SSPreferencesListController

- (NSArray *)specifiers {
    if (!_specifiers) {
        _specifiers =  [[self loadSpecifiersFromPlistName:@"SiriSwitchPreferences" target:self] mutableCopy];
    }

    return _specifiers;
}

- (void)havingTroublePressed:(id)specifier {
    UIActionSheet *havingTrouble = [[UIActionSheet alloc] 
    	initWithTitle:@"Sometimes Siri likes to keep her connection to the server alive, regardless if you haven't asked her anything for a while. If Siri refuses to transfer hosts, try toggling Airplane Mode or restarting your iPhone to force a connection reset." 
        delegate:nil 
        cancelButtonTitle:nil  destructiveButtonTitle:nil 
        otherButtonTitles:@"Alright", nil];
    [havingTrouble showInView:self.view];
    [havingTrouble release];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == [actionSheet firstOtherButtonIndex]) { //Open bug report page
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/xtremd/SiriSwitch/issues"]];
        
    }
}


- (void)stillHavingTroublePressed:(id)specifier {
    UIActionSheet *githubLinkSheet = [[UIActionSheet alloc] 
                                      initWithTitle:@"Still having trouble? Open a bug report on my Github repo!" 
                                      delegate:self
                                      cancelButtonTitle:@"Back" destructiveButtonTitle:nil 
                                      otherButtonTitles:@"Github", nil];
    [githubLinkSheet showInView:self.view];
    [githubLinkSheet release];
}


- (void)donatePressed:(id)specifier {
    UIActionSheet *donationApology = [[UIActionSheet alloc] 
    	initWithTitle:@"I'm not accepting donations at this time, but thanks for the kind thought! Truthfully, I just haven't gotten around to setting up my donation pages." 
        delegate:nil 
        cancelButtonTitle:nil  destructiveButtonTitle:nil 
        otherButtonTitles:@"Alright", nil];
    [donationApology showInView:self.view];
    [donationApology release];
}


@end

