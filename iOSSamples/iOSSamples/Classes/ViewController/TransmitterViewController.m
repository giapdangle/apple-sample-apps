#import "TransmitterViewController.h" // Headers
#import "SignInViewController.h"

#pragma mark - Constants
static NSString *const kCellIdentifier = @"Cell";


@interface TransmitterViewController ()

@property (strong, nonatomic) IBOutlet UITableView *transmittersAndDevices;

@end


@implementation TransmitterViewController


#pragma mark - View Management

- (void)viewWillAppear:(BOOL)animated {
    _transmittersAndDevices.hidden = YES;
    [_relayrUser queryCloudForIoTs:^(NSError *error) {
        if (!error) {
            NSLog(@"Found %lu transmitters", (unsigned long)_relayrUser.transmitters.count);
            NSLog(@"Found %lu devices", (unsigned long)_relayrUser.devices.count);
            _transmittersAndDevices.hidden = NO;
        } else {
            // Handle the error
        }
    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_transmittersAndDevices reloadData]; // Reload the tableview
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if ([self.navigationController.topViewController class] == [SignInViewController class]) {
        [(SignInViewController *)self.navigationController.topViewController signOutUser]; // Log the user out if they navigate back to the sign in view
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
    NSLog(@"%@", transmitter);
    NSLog(@"%@", transmitter.devices);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    return 1;
}

- (NSString *)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *title = @"Transmitters";

    return title;
}

@end
