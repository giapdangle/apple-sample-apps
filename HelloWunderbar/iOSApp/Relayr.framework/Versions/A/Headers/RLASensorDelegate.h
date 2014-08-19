// Apple
@import Foundation;

// Relayr.framework
// Classes
@class RLASensor;

/**
 * Provides means to monitor how many observers are attached to a sensor
 */

@protocol RLASensorDelegate <NSObject>

@required
- (void)sensorDidAddObserver:(RLASensor *)sensor;

@required
- (void)sensorDidRemoveObserver:(RLASensor *)sensor;

@end