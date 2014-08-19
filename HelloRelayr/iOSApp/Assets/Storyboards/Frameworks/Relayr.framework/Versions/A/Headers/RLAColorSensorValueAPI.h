// Apple
@import UIKit;

// Relayr.framework
// Protocols
#import "RLASensorValueAPI.h"

/**
 * Provides means to wrap raw sensor data in a domain object
 * by defining a fixed set of methods for each sensor type
 */

@protocol RLAColorSensorValueAPI <RLASensorValueAPI>

#pragma mark - Getters

/**
 * @return UIColor value for the measured color
 */

@required
- (UIColor *)color;

@end