// Apple
@import Foundation;

/*!
 *  @protocol RLAUserDevicesAPI
 *
 *  @abstract Provides an unified API for querying available devices
 */
@protocol RLAUserDevicesAPI <NSObject>

#pragma mark - Devices

/**
 * Available devices
 * @param completion (void(^)(NSArray *devices, NSError *error))completion
 * After device detection completes the handler will be called
 * with the found devices or an error if there was any
 * Those devices will be of class RLALocalDevice in case the methods was invoked on a
 * RLALocal user object and they will be of class RLARemoteDevice in case the method
 * was invoked in a remote user object
 */

@required
- (void)devicesWithCompletionHandler:(void(^)(NSArray*, NSError*))completion;

/**
 * Available devices with the specified sensors and/or outputs
 * @param classes RLADevice or RLASensor subclasses that the device should contain
 * @param completion (void(^)(NSArray *devices, NSError *error))completion
 * After device detection completes the handler will be called
 * with the found devices or an error if there was any
 * Those devices will be of class RLALocalDevice in case the methods was invoked on a
 * RLALocal user object and they will be of class RLARemoteDevice in case the method
 * was invoked in a remote user object
 */

@required
- (void)devicesWithSensorsAndOutputsOfClasses:(NSArray *)classes
  completion:(void(^)(NSArray*, NSError*))completion;

@end