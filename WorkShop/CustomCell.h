//
//  TableViewCell.h
//  WorkShop
//
//  Created by Mahmoud on 04/01/2023.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *Name;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;
@property (weak, nonatomic) IBOutlet UIImageView *progressImg;
@property (weak, nonatomic) IBOutlet UILabel *DoneLabel;
@property (weak, nonatomic) IBOutlet UIImageView *progressVerfy;
@property (weak, nonatomic) IBOutlet UIImageView *DonImg;

@end

NS_ASSUME_NONNULL_END
