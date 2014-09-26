#import <Relayr/RelayrTransmitter.h> // relayr
#import <Relayr/RelayrDevice.h>

#import "DisplayViewController.h" // Header

@interface DisplayViewController ()

@property (strong, nonatomic) IBOutlet UITableView *transmittersAndDevices;

@end

@implementation DisplayViewController

#pragma mark - View Management

- (void)viewWillAppear:(BOOL)animated
{
  _transmittersAndDevices.hidden = YES;
  
  [_relayrUser queryCloudForIoTs:^(NSError *error) {
    
    if (!error)
    {
      NSLog(@"%lu", (unsigned long)self.relayrUser.transmitters.count);
      NSLog(@"%lu", (unsigned long)self.relayrUser.devices.count);
      
      _transmittersAndDevices.hidden = NO;
      [_transmittersAndDevices reloadData]; // Dump everything in a tableview...
    }
    else
    {
      // Handle the error
    }
   
  }];
}

#pragma mark - Tableview Data Source

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section
{
  NSInteger numberOfRows;
  
  if (section == 0)
  {
    numberOfRows = (_relayrUser.transmitters.count) ? _relayrUser.transmitters.count : 0;
  }
  else if (section == 1)
  {
    numberOfRows = (_relayrUser.devices.count) ? _relayrUser.devices.count : 0;
  }
  
  return numberOfRows;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  static NSString* CellIdentifier = @"Cell";
  
  NSString* cellTitle = @"";
  
  if (indexPath.section == 0)
  {
    RelayrTransmitter* transmitter = [[_relayrUser.transmitters allObjects] objectAtIndex:indexPath.item];
    cellTitle = (_relayrUser.transmitters) ? transmitter.name : @"";
  }
  else if (indexPath.section == 1)
  {
    
    RelayrDevice* device = [[_relayrUser.devices allObjects] objectAtIndex:indexPath.item];
    cellTitle = (_relayrUser.devices) ? device.name : @"";
  }
  
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil)
  {
    cell = [[UITableViewCell alloc]
            initWithStyle:UITableViewCellStyleDefault
            reuseIdentifier:CellIdentifier];
  }
  cell.textLabel.text = cellTitle;
  
  return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
  return 2; // One for tranmitters, one for devices.
}

- (NSString*)tableView:(UITableView*)tableView titleForHeaderInSection:(NSInteger)section
{
  NSString* title;
  
  if (section == 0)
  {
    title = @"Transmitters";
  }
  else if (section == 1)
  {
    title = @"Devices";
  }
  
  return title;
}

@end
