#import "DataViewController.h"
#import "Relayr/RLARemoteUser.h"
#import "Relayr/RLADevice.h"
#import "Relayr/RLASensor.h"

static NSString* const kHelloRelayrRedirectURI = @"https://relayr.io";
static NSString* const kHelloRelayrAppID = @"e2155c3e-aaa4-4706-99e2-ea03bdbf9c16";
static NSString* const kHelloRelayrClientID = @"s2toGeu.OPkBHfMupFu6YjT9cs4upoyZ";
static NSString* const kHelloRelayrSecret = @"79nl.Lbjz7pY1pGad_I1uIPwjki2dEYY";

@interface DataViewController ()

@property (nonatomic, strong, readwrite) NSArray *devices;

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
       // A user exists so get their devices
       [user devicesWithCompletionHandler:^(NSArray *devices, NSError *error) {
         if (error) {
           NSLog(@"%@", error);
         } else {
           NSLog(@"%@", devices);
           self.devices = devices;
           if (devices) {
             self.devices = devices;
             [self connectAllDevices];
           } else {
             NSLog(@"No devices.");
           }
         }
       }];
     }
   }];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
}

#pragma mark - Actions

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

#pragma mark - Private helper methods

- (void)connectAllDevices
{
  for (RLADevice *device in self.devices)
  {
    // Device is already connected
    if (device.isConnected) {
      NSLog(@"%@ is connected", device);
    } else {
      NSLog(@"%@ is not connected", device);
      [device connectWithSuccessHandler:^(NSError *error) {
        if (error) {
          NSLog(@"%@", error);
        } else {
          NSLog(@"%@ is now connected", device);
        }
      }];
    }
  }
}

@end
