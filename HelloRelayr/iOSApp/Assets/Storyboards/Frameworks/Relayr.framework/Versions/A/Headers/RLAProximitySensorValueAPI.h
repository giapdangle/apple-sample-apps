// Apple
@import Foundation;

// Relayr.framework
// Protocols
#import "RLASensorValueAPI.h"

/**
 * Provides means to access proximity sensor data
 */

@protocol RLAProximitySensorValueAPI <RLASensorValueAPI>

#pragma mark - Getters

/**
 * @return NSNumber representation of proximity
 */

@required
- (NSNumber *)proximity;

@end