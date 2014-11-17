#import <UIKit/UIKit.h> // Apple

#import <Relayr/RelayrApp.h> // relayr
#import <Relayr/RelayrUser.h>


@interface MenuViewController : UIViewController

@property (strong, nonatomic) RelayrApp* relayrApp;
@property (strong, nonatomic) RelayrUser* relayrUser;

@end
