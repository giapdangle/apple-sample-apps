#import "TransmitterViewController.h" // Headers
#import "SignInViewController.h"
#import "DeviceListViewController.h"

#pragma mark - Constants

static NSString *const kCellIdentifier = @"Cell";
static NSString *const kShowDeviceListSegue = @"showDeviceListView";

@interface TransmitterViewController ()

@property (strong, nonatomic) IBOutlet UITableView *transmitterList;

@end


@implementation TransmitterViewController


#pragma mark - View Management

- (void)viewWillAppear:(BOOL)animated {
    _transmitterList.hidden = YES;
    [_relayrUser queryCloudForIoTs:^(NSError *error) {
        if (!error) {
            NSLog(@"Found %lu transmitters", (unsigned long)_relayrUser.transmitters.count);
            NSLog(@"Found %lu devices", (unsigned long)_relayrUser.devices.count);
            _transmitterList.hidden = NO;
        } else {
            // Handle the error
        }
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_transmitterList reloadData]; // Reload the tableview
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if ([self.navigationController.topViewController class] == [SignInViewController class]) {
        [(SignInViewController *)self.navigationController.topViewController signOutUser]; // Log the user out if they navigate back to the sign in view
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kShowDeviceListSegue]) {
        NSLog(@"%@", sender);
        DeviceListViewController *deviceListViewController = segue.destinationViewController;
        deviceListViewController.relayrUser = _relayrUser;
        deviceListViewController.relayrTransmitter = sender;
    }
}


#pragma mark - Tableview Data Source Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRows = (_relayrUser.transmitters.count) ? _relayrUser.transmitters.count : 0;
    
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
    }
    NSString *cellTitle = @"";
    RelayrTransmitter *transmitter = [[_relayrUser.transmitters allObjects] objectAtIndex:indexPath.item];
    cellTitle = (_relayrUser.transmitters) ? transmitter.name : @"";
    cell.textLabel.text = cellTitle;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RelayrTransmitter *transmitter = [[_relayrUser.transmitters allObjects] objectAtIndex:indexPath.item];
    [self performSegueWithIdentifier:kShowDeviceListSegue sender:transmitter];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    return 1;
}

- (NSString *)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title = [NSString stringWithFormat:@"%@'s Transmitters", _relayrUser.name];

    return title;
}

@end
