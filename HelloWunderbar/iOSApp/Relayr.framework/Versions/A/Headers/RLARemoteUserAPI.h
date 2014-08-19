// Apple
@import Foundation;
@class UIViewController;

// Relayr.framework
// Classes
@class RLAUserInfo;
@class RLARemoteUser;

/**
 * RLARemoteUserAPI is the main entry point for all remote server actions
 * utilizing the Relayr.framework
 */

@protocol RLARemoteUserAPI <NSObject>

#pragma mark - Initialization & Authentication

/**
 * Retrieves a registered user object from relayr.io
 * If the user is not logged in he will be prompted to so
 * If the user in not registered he will be prompted to do so
 * and be logged in afterwards automatically
 * @param clientID An NSString representation of the OAuth client identifier
 * @param appID An NSString representation of the app id
 * @param secret NSString representation of the OAuth app secret
 * @param uri NSString representation of the OAuth redirect uri
 * @param presenting The view controller object
 * that represents the current context for presentation
 * @param completion (RLAUser user*, NSError error*)) 
 * Completion callback block which will be called
 * after the login attempt completed.
 */

@required
+ (void)authenticateUserWithClientID:(NSString *)clientID
  appID:(NSString *)appID
  appSecret:(NSString *)secret
  redirectURI:(NSString *)uri
  presentingViewController:(UIViewController *)presenting
  completionHandler:(void(^)(RLARemoteUser*, NSError*))completion;

/**
 * @return previously saved user credentials or nil if the user has
 * not yet logged in or has logged out before
 */

@required
+ (RLAUserInfo *)userInfo;

/**
 * Deletes all stored user credentials 
 */

@required
- (void)unauthenticateUser;

@end