#import "DisplayViewController.h" // Header

@implementation DisplayViewController

-(void)viewDidLoad
{
  [_relayrUser queryCloudForIoTs:^(NSError *error) {
    
    if (!error)
    {
      NSLog(@"%@", self.relayrUser.transmitters);
      NSLog(@"%@", self.relayrUser.devices);
    }
  }];
}

@end
