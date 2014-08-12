// Apple
@import Foundation;

// Relayr.framework
// Classes
@class RLASensor;

/**
 * RLADeviceAPI provides means to access information about each registered device
 * carrying sensors.
 */

@protocol RLADeviceAPI <NSObject>

#pragma mark - Getters

#pragma mark - Identification

/**
 * Unique id assigned to the device by relayr during registration of the device
 * @return Unique NSString explicitely udentifiying the device
 */

@required
- (NSString *)uid;

/**
 * ID identifiying a device class with specific capabilities
 * @return NSString representation of the model identifier
 */

@required
- (NSString *)modelID;

#pragma mark - Info

/**
 * Name of the device. Typically choosen by the user during registration
 * @return NSString containing the device name
 */

@required
- (NSString *)name;

/**
 * Name of the device manufacturer
 * @return NSString containing the name of the device manufacturer
 */

@required
- (NSString *)manufacturer;

#pragma mark - Sensors

/**
 * Returns information about the sensors available on the device
 * @return NSArray of RLASensor objects
 */

@required
- (NSArray *)sensors;

/**
 * Returns one sensor matching the specified class
 * @param class RLASensor subclass
 * @return Found RLASensor subclass or nil if none was found
 */

@required
- (RLASensor *)sensorOfClass:(Class)class;

/**
 * Returns sensors matching the specified class
 * @param class RLASensor subclass
 * @return Array of RLASensor subclasses or nil if none was found
 */

@required
- (NSArray *)sensorsOfClass:(Class)class;

#pragma mark - Outputs

@required
- (NSArray *)outputs;

@end