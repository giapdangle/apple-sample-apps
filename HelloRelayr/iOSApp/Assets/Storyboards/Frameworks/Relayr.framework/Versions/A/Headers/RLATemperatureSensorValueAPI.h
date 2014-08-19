// Apple
@import Foundation;

// Relayr.framework
// Protocols
#import "RLASensorValueAPI.h"

/**
 * Provides means to wrap raw sensor data in a domain object
 * by defining a fixed set of methods for each sensor type
 */

@protocol RLATemperatureSensorValueAPI <RLASensorValueAPI>

#pragma mark - Getters

/**
 * @return NSNumber value for the measured temperature
 */

@required
- (NSNumber *)temperature;

@end