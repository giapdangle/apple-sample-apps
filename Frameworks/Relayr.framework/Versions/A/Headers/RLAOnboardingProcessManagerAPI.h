// Apple
@import Foundation;

/**
 * Provides an entry point for triggering registration of a new wunderbar.
 * Also called "the onboarding process."
 * Also see @protocol RLAOnboardingProcessManagerDelegate
 */

@protocol RLAOnboardingProcessManagerAPI <NSObject>

#pragma mark - Registration

/**
 * Kicks off the registration process
 * During the process multiple selectors are beeing invoked
 * to provide feedback about progress
 * Also see @protocol RLAOnboardingProcessManagerDelegate
 * @param password The wunderbar master module sends data directly to the internet
 * and therefor needs access to the local wifi
 */

- (void)registerWunderbarWithWifiPassword:(NSString *)password;

#pragma mark - Persistence

/**
 * Once a wunderbar is registered the UUIDs of the registered devices
 * are beeing stored.
 * @return NSArray containing NSString* representations of UUIDs
 *  of recently registered devices
 * This is used in the OnboardingApp in order gather values from
 * a recently registered wunderbar
 */

+ (NSArray *)registeredDeviceUids;

@end