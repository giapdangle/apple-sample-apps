// Apple
@import UIKit;

// Relayr.framework
// Protocols
#import "RLASensorValueAPI.h"

/**
 * Provides means to wrap raw sensor data in a domain object
 * by defining a fixed set of methods for each sensor type
 */

@protocol RLAAccelerometerSensorValueAPI <RLASensorValueAPI>

#pragma mark - Getters

@required
- (NSNumber *)accelerationX;

@required
- (NSNumber *)accelerationY;

@required
- (NSNumber *)accelerationZ;

@end