#import "DeviceListViewController.h" // Header

#pragma mark - Constants

static NSString *const kCellIdentifier = @"Cell";


@interface DeviceListViewController ()

@property (strong, nonatomic) IBOutlet UITableView *deviceList;


@end


@implementation DeviceListViewController

#pragma mark - Tableview Data Source Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRows = (_relayrTransmitter.devices.count) ? _relayrTransmitter.devices.count : 0;
    
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
    }
    NSString *cellTitle = @"";
    RelayrDevice *device = [[_relayrTransmitter.devices allObjects] objectAtIndex:indexPath.item];
    cellTitle = (_relayrTransmitter.devices) ? device.name : @"";
    cell.textLabel.text = cellTitle;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RelayrDevice *device = [[_relayrTransmitter.devices allObjects] objectAtIndex:indexPath.item];
    NSLog(@"%@", device);
    NSLog(@"%@", device.inputs);
    NSLog(@"%@", device.outputs);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    return 1;
}

- (NSString *)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title = [NSString stringWithFormat:@"%@'s Devices", _relayrUser.name];
    
    return title;
}

@end
