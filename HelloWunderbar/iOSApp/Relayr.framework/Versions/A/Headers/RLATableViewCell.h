// Apple
@import UIKit;

@interface RLATableViewCell : UITableViewCell

@property (unsafe_unretained) IBOutlet UILabel *titleLabel;
@property (unsafe_unretained) IBOutlet UILabel *detailLabel;

#pragma mark - Utility

+ (NSString *)reuseIdentifier;

@end
