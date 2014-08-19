// Apple
@import Foundation;

/**
 * Provides means to set data on an output
 */

@protocol RLAOutputAPI <NSObject>

#pragma mark - Setters

/**
 * Writes data to the output
 * @param data NSData representation of the data to write
 */

- (void)setData:(NSData *)data;

#pragma mark - Getters

/**
 * @return NSData representation of the most recencent Data 
 * that has been sent to the output
 */

@required
- (NSData *)data;

#pragma mark - Template methods

/**
 * This method is supposed to be overridden by subclasses
 * @return NSString representation of the writable characteristics uid
 */

@required
- (NSString *)uid;

/**
 * @return NSString representation of the receiver type
 * Subclasses should override this method and return a sensor type string
 */

@required
- (NSString *)type;

@end