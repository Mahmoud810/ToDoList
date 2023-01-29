//
//  DoneViewController.h
//  WorkShop
//
//  Created by Mahmoud on 04/01/2023.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import "CustomCell.h"
#import "update.h"
NS_ASSUME_NONNULL_BEGIN

@interface DoneViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property NSMutableArray * tableDone;
@property Item * cellData ;
@property Item * tmp;
@property NSUserDefaults * userDefulat;
@end

NS_ASSUME_NONNULL_END
