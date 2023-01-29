//
//  protocol.h
//  WorkShop
//
//  Created by Mahmoud on 04/01/2023.
//

#import <Foundation/Foundation.h>
#import "Item.h"
NS_ASSUME_NONNULL_BEGIN

@protocol protocol <NSObject>
-(void) getData:(Item*)tmp;
@end

NS_ASSUME_NONNULL_END
//Item * i =[Item new];
//i.Name =self-> _name.text;
//i.desc = self->_desc.text;
//i.state =_sstate;
//i.priority = [self->_proprity titleForSegmentAtIndex:self->_segment.selectedSegmentIndex];
//i.date = self->_date.date;
////                [_toData removeObjectAtIndex:index];
//if(_screenNum ==1)
//{
//    if([self->_segment titleForSegmentAtIndex:self->_segment.selectedSegmentIndex] == _sstate)
//    {
//        
//        [self->_toData removeObjectAtIndex:self->_index];
//        [self->_toData insertObject:i atIndex:_index];
//        
//    }
//    else if([[self->_segment titleForSegmentAtIndex:self->_segment.selectedSegmentIndex] isEqual:@"Progress"]){
//        [self->_toData removeObjectAtIndex:_index];
//        i.state =[_proprity titleForSegmentAtIndex:_proprity.selectedSegmentIndex];
//        [self->_progData addObject:i];
//    }
//    else if([[self->_segment titleForSegmentAtIndex:self->_segment.selectedSegmentIndex] isEqual:@"Done"]){
//        [self->_toData removeObjectAtIndex:_index];
//        i.state =[_proprity titleForSegmentAtIndex:_proprity.selectedSegmentIndex];
//        [self->_doneData addObject:i];
//        
//        
//        
//    }
//    
////            NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self->_toData];
////            [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"ToDo"];
////            [self->_deleget reloadData];
////            [self.navigationController popViewControllerAnimated:YES];
//}
//if(_screenNum ==2)
//{
//    if([[self->_segment titleForSegmentAtIndex:self->_segment.selectedSegmentIndex] isEqual:@"ToDo"])
//    {
//        
//        [self->_progData removeObjectAtIndex:self->_index];
//        i.state =@"ToDo";
//        [self->_toData addObject:i];
//        
//    }
//    else if([[self->_segment titleForSegmentAtIndex:self->_segment.selectedSegmentIndex] isEqual:@"Progress"]){
//        [self->_progData removeObjectAtIndex:_index];
//        [self->_progData insertObject:i atIndex:_index];
//    }
//}
//NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self->_toData];
//[[NSUserDefaults standardUserDefaults] setObject:data forKey:@"ToDo"];
//NSData* data2 = [NSKeyedArchiver archivedDataWithRootObject:self->_progData];
//[[NSUserDefaults standardUserDefaults] setObject:data2 forKey:@"progressData"];
//NSData *data3 = [NSKeyedArchiver archivedDataWithRootObject:_doneData];
//[[NSUserDefaults standardUserDefaults] setObject:data3 forKey:@"Done"];
//[self->_deleget reloadData];
