//
//  ToDoListViewController.h
//  WorkShop
//
//  Created by Mahmoud on 05/01/2023.
//


#import <UIKit/UIKit.h>
#import "CustomCell.h"
#import "AddViewController.h"
#import "protocol.h"
#import "update.h"
#import "EditViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface ToDoListViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,protocol,update>
@property NSMutableArray * tableData;
@property Item * cellData ;
@end

NS_ASSUME_NONNULL_END
