// Apple
@import Foundation;

// Relayr.framework
// Protocols
#import "RLASensorDelegate.h"
// Classes
@class RLASensorValue;

/**
 * RLASensorAPI provides means to access information about and a sensor and its data
 */

#pragma mark - Constant strings

#pragma mark - Meanings

static NSString* const kRLASensorMeaningUndefined    = @"undefined";
static NSString* const kRLASensorMeaningProximity    = @"proximity";
static NSString* const kRLASensorMeaningColor        = @"color";
static NSString* const kRLASensorMeaningLight        = @"light";
static NSString* const kRLASensorMeaningLuminosity   = @"luminosity";
static NSString* const kRLASensorMeaningGyroscope    = @"angular_speed";
static NSString* const kRLASensorMeaningAcceleration = @"acceleration";
static NSString* const kRLASensorMeaningHumidity     = @"humidity";
static NSString* const kRLASensorMeaningTemperature  = @"temperature";
static NSString* const kRLASensorMeaningNoiseLevel   = @"noise_level";

#pragma mark - Units

static NSString* const kRLASensorUnitCelsius = @"celsius";
static NSString* const kRLASensorUnitFahrenheit = @"fahrenheit";

@protocol RLASensorAPI <NSObject>

#pragma mark - Getters

/**
 * @return RLASensorValue representation of the measured value
 * Each RLASensor subclass is responsible for overriding this
 * method and returning an appropriate value
 */

@required
- (RLASensorValue *)value;

#pragma mark - Info

/**
 * @return NSString representation of the sensor unit
 */

@required
- (NSString *)unit;

/**
 * @return NSString representation of the sensor meaning
 */

@required
- (NSString *)meaning;


@end