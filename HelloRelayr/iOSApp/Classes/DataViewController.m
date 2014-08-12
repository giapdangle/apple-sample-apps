#import "DataViewController.h"
#import "Relayr/RLARemoteUser.h"

static NSString* const kHelloRelayrRedirectURI = @"https://relayr.io";
static NSString* const kHelloRelayrAppID = @"e2155c3e-aaa4-4706-99e2-ea03bdbf9c16";
static NSString* const kHelloRelayrClientID = @"s2toGeu.OPkBHfMupFu6YjT9cs4upoyZ";
static NSString* const kHelloRelayrSecret = @"79nl.Lbjz7pY1pGad_I1uIPwjki2dEYY";

@interface DataViewController ()

@end

@implementation DataViewController

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  
  [RLARemoteUser authenticateUserWithClientID:kHelloRelayrClientID
                                        appID:kHelloRelayrAppID
                                    appSecret:kHelloRelayrSecret
                                  redirectURI:kHelloRelayrRedirectURI
                     presentingViewController:self
                            completionHandler:^(RLARemoteUser *user, NSError *error) {
     
     if (error) {
       // Authentication failed
       NSLog(@"%@", error);
     } else {
       // A user exists
       NSLog(@"%@", user);
     }
   }];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
}

- (IBAction)signOut:(id)sender
{
  [RLARemoteUser authenticateUserWithClientID:kHelloRelayrClientID
                                        appID:kHelloRelayrAppID
                                    appSecret:kHelloRelayrSecret
                                  redirectURI:kHelloRelayrRedirectURI
                     presentingViewController:self
                            completionHandler:^(RLARemoteUser *user, NSError *error) {
                              
                              [user unauthenticateUser];
                            }];
  [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
