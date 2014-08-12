// Apple
@import Foundation;

// Relayr.framework
// Classes
#import "RLADevice.h"

@interface RLAWunderbarCredentials : NSObject

#pragma mark - Properties (Readonly)

@property (nonatomic, strong, readonly) NSString *uid;
@property (nonatomic, strong, readonly) NSString *secret;
@property (nonatomic, strong, readonly) RLADevice *htu;
@property (nonatomic, strong, readonly) RLADevice *gyro;
@property (nonatomic, strong, readonly) RLADevice *light;
@property (nonatomic, strong, readonly) RLADevice *microphone;
@property (nonatomic, strong, readonly) RLADevice *bridge;
@property (nonatomic, strong, readonly) RLADevice *ir;

#pragma mark - Designated initializer

- (instancetype)initWithWunderbarUID:(NSString *)uid
                     wunderbarSecret:(NSString *)secret
                                 htu:(RLADevice *)htu
                                gyro:(RLADevice *)gyro
                               light:(RLADevice *)light
                          microphone:(RLADevice *)microphone
                              bridge:(RLADevice *)bridge
                                  ir:(RLADevice *)ir;

#pragma mark - Utility

- (RLADevice *)deviceWithModelID:(NSString *)modelID;

@end
