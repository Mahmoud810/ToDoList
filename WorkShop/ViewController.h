//
//  ViewController.h
//  WorkShop
//
//  Created by Mahmoud on 03/01/2023.
//

#import <UIKit/UIKit.h>
#import "CustomCell.h"
#import "EditViewController.h"
#import "update.h"
#import "Item.h"
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,update>
@property NSMutableArray* progressData;
@property Item * cellData ;
@property id<update> deleget;
@property NSMutableArray* progressTable;

@end

