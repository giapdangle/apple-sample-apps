#import <Relayr/Relayr.h> // relayr

#import "SignInViewController.h" // Headers
#import "TransmitterViewController.h"


#pragma mark - Constants

// These value are specific to the sample app. Replace them with the appropriate values for your own app. (They are available on the "apps" page of the developer dashboard).
static NSString *const kSignInViewControllerAppID = @"e1b4cb0f-f586-4147-910b-d2e8de9889c1";
static NSString *const kSignInViewControllerSecret = @"b_InkHAavjwtWnFZ_SlDXV1x.nVuUXAW";
static NSString *const kSignInViewControllerRedirectURI = @"https://relayr.io";


@interface SignInViewController ()

@property (strong, nonatomic) RelayrApp *relayrApp;
@property (strong, nonatomic) RelayrUser *relayrUser;
@property (strong, nonatomic) IBOutlet UIButton *signInButton;
@property (strong, nonatomic) IBOutlet UILabel *reachabilityLabel;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *reachabilityActivityIndicator;

- (IBAction)signInAction:(id)sender;

@end


@implementation SignInViewController


#pragma mark - View Management

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialiseView];
}


#pragma mark - API Calls

// Most of these calls will probably be used in model code rather than in a view controller, but in order that the architecture of the demo app is as simple as possible, they have been included in the view controller.

- (void)checkReachability {
    [RelayrCloud isReachable:^(NSError *error, NSNumber *isReachable) {
        if (!error) {
            if (isReachable.boolValue) {
                _signInButton.userInteractionEnabled = YES;
                _signInButton.enabled = YES;
                _reachabilityLabel.text = @"";
                [_reachabilityActivityIndicator stopAnimating];
                [self createCloudApp];
            } else {
                NSLog(@"Cloud not reachable");
            }
        }
        else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

- (void)createCloudApp {
    [RelayrApp appWithID:kSignInViewControllerAppID OAuthClientSecret:kSignInViewControllerSecret redirectURI:kSignInViewControllerRedirectURI completion:^(NSError *error, RelayrApp *app) {
        if (!error) {
            // Put a breakpoint here and print out app in the terminal to see the Name and Description entered in the developer dashboard.
            _relayrApp = app;
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

#pragma mark - Actions

- (IBAction)signInAction:(id)sender {
    _signInButton.userInteractionEnabled = NO; // Prevent further presses
    [_relayrApp signInUser:^(NSError *error, RelayrUser *user) {
        if (!error) {
            _relayrUser = user;
            [self performSegueWithIdentifier:@"showDisplayView" sender:self];
        } else {
            NSLog(@"%@", error.localizedDescription);
        }
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDisplayView"]) {
        MenuViewController *displayViewController = segue.destinationViewController;
        displayViewController.relayrApp = _relayrApp;
        displayViewController.relayrUser = _relayrUser;
    }
}


#pragma mark - Public Methods

- (void)signOutUser {
    [_relayrApp signOutUser:_relayrUser];
    [self initialiseView];
}


#pragma mark - Private Methods

- (void)initialiseView {
    _signInButton.userInteractionEnabled = NO; // Disabled by default.
    _signInButton.enabled = NO;
    _reachabilityLabel.text = @"checking that the cloud is reachable...";
    [_reachabilityActivityIndicator startAnimating];
    [self checkReachability];
}

@end
