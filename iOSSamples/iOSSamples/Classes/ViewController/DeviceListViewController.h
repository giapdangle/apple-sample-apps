#import <UIKit/UIKit.h> // Apple

#import <Relayr/Relayr.h>


@interface DeviceListViewController : UIViewController

@property (strong, nonatomic) RelayrUser* relayrUser;
@property (strong, nonatomic) RelayrTransmitter* relayrTransmitter;

@end
