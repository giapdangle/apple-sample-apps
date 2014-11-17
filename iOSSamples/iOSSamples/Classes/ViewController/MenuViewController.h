#import <UIKit/UIKit.h> // Apple

#import <Relayr/Relayr.h> // relayr


@interface MenuViewController : UIViewController

@property (strong, nonatomic) RelayrApp* relayrApp;
@property (strong, nonatomic) RelayrUser* relayrUser;

@end
