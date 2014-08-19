// Apple
@import Foundation;

// Framework protocols
#import "RLASensorAPI.h"

/**
 * Provides means to access thermometer sensor data
 */

@protocol RLAHumiditySensorAPI <RLASensorAPI>

#pragma mark - Sensor properties

/**
 * Provides information about measuring unit, eg. celsius, fahrenheit ...
 * See constant unit strings in RLASensorAPI for predefined values.
 * This list is not exhaustive. Other non predefined values may appear.
 * @return NSString containing the name of the unit
 */

@required
- (NSString *)unit;

@end