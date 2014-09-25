#import <Relayr/RelayrCloud.h>
#import <Relayr/RelayrApp.h>

#import "SignInViewController.h" // Header

#pragma mark - Constants

// These value are specific to the sample app. Replace them with the values for your own app (which are available on the apps page of the developer dashboard).
static NSString* const kSignInViewControllerAppID = @"e1b4cb0f-f586-4147-910b-d2e8de9889c1";
static NSString* const kSignInViewControllerSecret = @"b_InkHAavjwtWnFZ_SlDXV1x.nVuUXAW";
static NSString* const kSignInViewControllerRedirectURI = @"https://relayr.io";

@interface SignInViewController ()

@property (strong, nonatomic) RelayrApp* relayrApp;
@property (strong, nonatomic) IBOutlet UIButton* signInButton;
@property (strong, nonatomic) IBOutlet UILabel *reachabilityLabel;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *reachabilityActivityIndicator;

- (IBAction)signInAction:(id)sender;

@end


@implementation SignInViewController

#pragma mark - View Management

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  
  _signInButton.userInteractionEnabled = NO; // Disabled by default.
  _signInButton.enabled = NO;
  
  [self checkReachability];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}


#pragma mark - API Calls

// Most of these calls will probably be used in model or store manager code rather than in a view controller, however, in order that the architecture of the demo app is as simple as possible, they have been included in the view controller.

- (void)checkReachability
{
  [RelayrCloud isReachable:^(NSError *error, NSNumber *isReachable) {
    
    if (!error)
    {
      if (isReachable.boolValue)
      {
        _signInButton.userInteractionEnabled = YES;
        _signInButton.enabled = YES;
        _reachabilityLabel.text = @"";
        [_reachabilityActivityIndicator stopAnimating];
        [self createCloudApp];
      }
      else
      {
        // Cloud not reachable.
      }
    }
    else
    {
      // Handle the error.
    }
  }];
}

- (void)createCloudApp
{
  [RelayrApp appWithID:kSignInViewControllerAppID
     OAuthClientSecret:kSignInViewControllerSecret
           redirectURI:kSignInViewControllerRedirectURI
            completion:^(NSError *error, RelayrApp *app) {
              
    if (!error)
    {
      // Put a breakpoint here and print out app in the terminal to see the Name and Description entered in the developer dashboard.
      _relayrApp = app;
    }
    else
    {
      // Handle the error.
    }
  }];
}

#pragma mark - Actions

- (IBAction)signInAction:(id)sender
{
  [_relayrApp signInUser:^(NSError *error, RelayrUser *user) {
    
    if (!error)
    {
      // Sign in was sucessful.
      [self performSegueWithIdentifier:@"SegueToDisplayView" sender:self];
    }
    else
    {
      // Handle the error.
    }
  }];
}

@end
