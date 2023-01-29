//
//  Item.h
//  WorkShop
//
//  Created by Mahmoud on 04/01/2023.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Item : NSObject <NSCoding>
@property NSString * Name;
@property NSString * desc;
@property NSDate * date;
@property NSString * priority;
@property NSString * state;

@end

NS_ASSUME_NONNULL_END
