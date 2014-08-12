// Apple
@import Foundation;

// Relayr.framework
// Protocols
#import "RLAOnboardingProcessManagerAPI.h"
#import "RLAOnboardingProcessManagerDelegate.h"
// Classes
#import "RLARemoteUser.h"
#import "RLAWunderbarCredentials.h"

/**
 * Provides means to setup a new RLAOnboardingProcessManager
 */

@interface RLAOnboardingProcessManager : NSObject <RLAOnboardingProcessManagerAPI>

#pragma mark - Designated initilizer

/**
 * @param user Authenticated remote user object
 * The user must be registered and logged in in order to register a new
 * wunderbar
 * @param delegate Object conforming to <RLAOnboardingProcessManagerDelegate>
 */

- (instancetype)initWithUser:(RLARemoteUser *)user
                 andDelegate:(NSObject<RLAOnboardingProcessManagerDelegate>*)delegate;

@end

