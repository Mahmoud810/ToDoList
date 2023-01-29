//
//  AddViewController.h
//  WorkShop
//
//  Created by Mahmoud on 04/01/2023.
//

#import <UIKit/UIKit.h>
#import "Item.h"
#import "protocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface AddViewController : UIViewController

@property Item * item;
@property id<protocol> delgate;

@end

NS_ASSUME_NONNULL_END
