//
//  Item.m
//  WorkShop
//
//  Created by Mahmoud on 04/01/2023.
//

#import "Item.h"

@implementation Item
//-(void)dealloc{
//    [_Name release];
//    [_desc release];
//}


- (id)initWithCoder:(NSCoder *)dcoder{
    if (self = [super init]) {
        _Name = [NSString new];
        _date = [NSDate new];
        _desc = [NSString new];
        _state = [NSString new];
        _priority = [NSString new];
        self.Name = [dcoder decodeObjectForKey:@"Name"];
        self.desc = [dcoder decodeObjectForKey:@"des"];
        self.priority = [dcoder decodeObjectForKey:@"priority"];
        self.date = [dcoder decodeObjectForKey:@"date"];
        self.state = [dcoder decodeObjectForKey:@"satate"];
    
    }
    return self;
}

- (void)encodeWithCoder:(nonnull NSCoder *)coder { 
    [coder encodeObject:_Name forKey:@"Name"];
     [coder encodeObject:_desc forKey:@"des"];
     [coder encodeObject:_priority forKey:@"priority"];
    [coder encodeObject:_date forKey:@"date"];
     [coder encodeObject:_state forKey:@"satate"];
//     [coder encodeBool:_priority forKey:@"priority"];
}


@end
