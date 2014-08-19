// Apple
@import Foundation;

// Base class
#import "RLAUser.h"

// Relayr.framework
// Protocols
#import "RLALocalUserAPI.h"
#import "RLAUserDevicesAPI.h"

@interface RLALocalUser : RLAUser <RLALocalUserAPI, RLAUserDevicesAPI>

@end
