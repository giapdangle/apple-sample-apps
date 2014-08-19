// Apple
@import Foundation;

// Base class
#import "RLADevice.h"

// Relayr.framework
#import "RLALocalDeviceAPI.h"
#import "RLADeviceConnectionAPI.h"

@interface RLALocalDevice : RLADevice

<
  RLALocalDeviceAPI,
  RLADeviceConnectionAPI
>

@end
