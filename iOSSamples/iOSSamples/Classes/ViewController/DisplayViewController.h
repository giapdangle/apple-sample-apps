#import <UIKit/UIKit.h> // Apple
#import <Relayr/RelayrApp.h>
#import <Relayr/RelayrUser.h>

@interface DisplayViewController : UIViewController

@property (strong, nonatomic) RelayrApp* relayrApp;
@property (strong, nonatomic) RelayrUser* relayrUser;

@end