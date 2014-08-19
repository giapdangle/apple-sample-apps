// Apple
@import Foundation;

/**
 + Provides means to provide user info to the programmer
 */

@protocol RLAUserInfoAPI <NSObject, NSCoding>

#pragma mark - Getters

/**
 * @return NSString representation of the users name
 */

@required
- (NSString *)name;

@end