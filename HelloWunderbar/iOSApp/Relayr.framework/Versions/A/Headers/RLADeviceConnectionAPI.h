// Apple
@import Foundation;

// Relayr.framework
// Protocols
#import "RLADeviceAPI.h"

/**
 * Provides means to start and stop monitoring device data remotely
 * via the relayr server
 */

@protocol RLADeviceConnectionAPI <RLADeviceAPI>

#pragma mark - Sensor data

#pragma mark - Monitoring

/**
 * @return BOOL value indicating if the device is currently receiving sensor content data
 */

@required
- (BOOL)isConnected;

/**
 * Starts streaming sensor and input data
 * @param handler (void(^)(NSError *error))handler
 * When an error occues the handler is beeing called with it
 * otherwise the error object equals nil
 */

@required
- (void)connectWithSuccessHandler:(void(^)(NSError*))handler;

/**
 * Stops updating the devices sensors and outputs with data
 * Calling this method is not obligatory.
 * RLADevice objects will automatically unsubscribe
 * from any data stream once they get deallocated.
 * @param handler (void(^)(NSError *error))handler
 * When an error occues the handler is beeing called with it
 * otherwise the error object equals nil
 */

@required
- (void)disconnectWithSuccessHandler:(void(^)(NSError*))handler;

#pragma mark - Error handling

/**
 * @param handler (void(^)(NSError *error))handler
 * When an error occures the handler is beeing called with it
 * otherwise the error object equals nil
 */

@required
- (void)setErrorHandler:(void(^)(NSError*))handler;

@end