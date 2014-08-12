// Apple
@import Foundation;
@import CoreBluetooth;

// Relayr.framework
// Protocols
#import "RLADeviceAPI.h"

/**
 * Provides means to access and set device data that is only available for local devices
 */

@protocol RLALocalDeviceAPI <RLADeviceAPI>

#pragma mark - Getters

/**
 * @return NSNumber represenation of the RSSI, in decibels, of the device.
 */

@required
- (NSNumber *)RSSI;

/**
 * @return underlying CBPeripheral object for the local device
 */

@required
- (CBPeripheral *)peripheral;

#pragma mark - Setters

/**
 * Stores the given data for a characteristic if the characteristic exists
 * @param data NSData representation of the data to store
 * @param serviceUUID NSString representation of the service uuid
 * @param characteristicUUID NSString representation of the characterisitcs uuid
 * @param completion  (void(^)(CBPeripheral *peripheral,CBCharacteristic *characteristic NSError *error))
 * When the attempt to save the data succeeded the NSData return value is not nil
 */

- (void)setData:(NSData *)data
  forServiceWithUUID:(NSString *)serviceUUID
  forCharacteristicWithUUID:(NSString *)characteristicUUID
  completion:(void(^)(CBPeripheral*, CBCharacteristic*, NSError*))completion;;

@end