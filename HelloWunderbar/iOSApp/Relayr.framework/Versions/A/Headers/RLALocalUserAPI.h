// Apple
@import Foundation;
@import UIKit;

/**
 * RLALocalUser is the main entry point for all bluetooth actions
 * utilizing the Relayr.framework
 */

// Relayr.framework
// Classes
@class RLADevice;

@protocol RLALocalUserAPI <NSObject>

#pragma mark - Initialization

/**
 * @return RLALocalUser object acting as an entry point
 * for retrieving wunderbar devices that are in range of the users phone
 */

+ (instancetype)user;

@end