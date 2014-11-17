#import "DeviceViewController.h" // Header


@interface DeviceViewController ()

@property (strong, nonatomic) IBOutlet UILabel *deviceNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *deviceIdLabel;

@end


@implementation DeviceViewController


#pragma mark - View Management

- (void)viewDidLoad {
    [super viewDidLoad];
    _deviceNameLabel.text = _relayrDevice.name;
    _deviceIdLabel.text = _relayrDevice.uid;
}

@end
