// Apple
@import Foundation;

// Base class
#import "RLAUser.h"

// Relayr.framework
// Protocols
#import "RLARemoteUserAPI.h"
#import "RLAUserDevicesAPI.h"

@interface RLARemoteUser : RLAUser <RLARemoteUserAPI, RLAUserDevicesAPI>

@end
