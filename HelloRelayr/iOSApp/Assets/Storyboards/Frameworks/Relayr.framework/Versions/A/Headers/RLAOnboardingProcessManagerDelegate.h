// Apple
@import Foundation;

// Relayr.framework
// Classes
@class RLAOnboardingProcessManager;
@class RLAWunderbarCredentials;

/**
 * Provides means to report back the current state of
 * the wunderbar registration process to the delegate
 */

@protocol RLAOnboardingProcessManagerDelegate <NSObject>

#pragma mark - Search

/**
 * Phone is currently scanning for a wunderbar via Bluetooth
 * @param manager The active onboarding manager
 */

@required
- (void)onboardingProcessManagerWillStartSearchingWunderbar:
  (RLAOnboardingProcessManager *)manager;

/**
 * A wunderbar was discoverd
 * Though it is not clear if it is in onboarding mode or not
 * @param manager RLAOnboardingProcessManager The active onboarding manager
 */

@required
- (void)onboardingProcessManagerDidDiscoverWunderbar:
  (RLAOnboardingProcessManager *)manager;

/**
 * No wunderbar was discovered
 * @param manager RLAOnboardingProcessManager The active onboarding manager
 * @param error NSError Detailed error description @selector(localizedDescription)
 * and @selector(localizedErrorReason)
 */

@required
- (void)onboardingProcessManager:(RLAOnboardingProcessManager *)manager
  didFailDiscoveringWunderbarWithError:(NSError *)error;

#pragma mark - Status

/**
 * The manager will now invoke all necessary stepps to register the wunderbar
 * @param manager RLAOnboardingProcessManager The active onboarding manager
 */

@required
- (void)onboardingProcessManagerWillStartRegisteringWunderbar:
  (RLAOnboardingProcessManager *)manager;

/**
 * The manager will now start writing data to the local device
 * in order to set it up for the communicaton with the relayr service
 * @param manager RLAOnboardingProcessManager The active onboarding manager
 */

- (void)onboardingProcessManagerWillStartConfiguringWunderbar:
(RLAOnboardingProcessManager *)manager;

/**
 * The manager did succesfully register a wunderbar at the relayr server
 * and did setup the local device
 * The process in now done
 * @param manager RLAOnboardingProcessManager The active onboarding manager
 * @param credentials RLAWunderbarCredentials The credentials of the
 * wunderbar that were returned by the relayr server
 */

@required
- (void)onboardingProcessManager:(RLAOnboardingProcessManager *)manager
            didRegisterWunderbar:(RLAWunderbarCredentials *)credentials;

/**
 * The manager did fail registering a new wunderbar
 * @param manager RLAOnboardingProcessManager The active onboarding manager
 * @param error NSError Detailed error description @selector(localizedDescription)
 * and @selector(localizedErrorReason)
 */

@required
- (void)onboardingProcessManager:(RLAOnboardingProcessManager *)manager
  didFailRegisteringWunderbarWithError:(NSError *)error;

@end
