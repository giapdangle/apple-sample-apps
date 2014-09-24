#import <Relayr/RelayrCloud.h>
#import <Relayr/RelayrApp.h>

#import "ViewController.h" // Header

#pragma mark - Constants

// These value are specific to the sample app. Replace them with your own apps values (which are available on the apps page of the developer dashboard).
static NSString* const kSignInViewControllerAppID = @"56cc9a72-9b5b-4ea5-b9dd-577fd1b3bba9";
static NSString* const kSignInViewControllerSecret = @"IJHUNvQ4fzSY3syVBZAbI57.rCYaRdIV";
static NSString* const kSignInViewControllerRedirectURI = @"https://relayr.io";
static NSString* const kWebHostURI = @"https://api.relayr.io";

@interface ViewController ()

@property (strong, nonatomic) RelayrApp* relayrApp;

@end

@implementation ViewController

#pragma mark - View Management

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  
  [self checkReachability];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

#pragma mark - API Calls

// Most of these calls will probably be used in model code rather than in a view controller, but in order that the architecture of the demo app is as simple as possible, they have been included in the view controller.

- (void)checkReachability
{
  [RelayrCloud isReachable:^(NSError *error, NSNumber *isReachable) {
    
    if (!error)
    {
      if (isReachable)
      {
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
      _relayrApp = app;
    }
    else
    {
      // Handle the error.
    }
  }];
}


@end
