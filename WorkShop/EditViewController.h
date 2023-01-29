//
//  EditViewController.h
//  WorkShop
//
//  Created by Mahmoud on 04/01/2023.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import "protocol.h"
#import "update.h"
NS_ASSUME_NONNULL_BEGIN

@interface EditViewController : UIViewController
@property NSString *nname;
@property NSString *ddesc;
@property NSDate *ddate;
@property NSString *sstate;
@property NSString *pproperity;
@property NSInteger index;
@property int screenNum ;
@property int selectedSegment;
@property int selectedProperty;
@property NSMutableArray *toData;
@property NSMutableArray *progData;
@property NSMutableArray *doneData;
@property NSData *data;
@property NSUserDefaults * userDefaults;
@property Item * temp;
@property id<update> deleget;
@end

NS_ASSUME_NONNULL_END
