// Apple
@import Foundation;

/**
 * Provides means to read values measured by a sensor
 */

@protocol RLASensorValueAPI <NSObject>

#pragma mark - Getters

/**
 * @return NSDate value indicating the time the measurement was taken
 */

@required
- (NSDate *)timestamp;

/**
 * @return Raw key/value data as returned from remote source
 */

@required
- (NSDictionary *)dictionary;

@end