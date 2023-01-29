//
//  EditViewController.m
//  WorkShop
//
//  Created by Mahmoud on 04/01/2023.
//

#import "EditViewController.h"

@interface EditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *desc;
@property (weak, nonatomic) IBOutlet UISegmentedControl *proprity;
@property (weak, nonatomic) IBOutlet UIDatePicker *date;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _name.text = _nname;
    _desc.text = _ddesc;
    _temp = [Item new];
    _userDefaults = [NSUserDefaults standardUserDefaults];
    if([_pproperity isEqual:@"low"])
    {
        [_proprity setSelectedSegmentIndex:0];
        
    }
    else if([_pproperity isEqual:@"meduim"])
    {
        [_proprity setSelectedSegmentIndex:1];
        
    }
    else
    {
        [_proprity setSelectedSegmentIndex:2];
        
    }
    if([_sstate isEqual:@"ToDo"])
    {
        [_segment setSelectedSegmentIndex:0];
        
    }
    else if([_sstate isEqual:@"Progress"])
    {
        [_segment setSelectedSegmentIndex:1];
       
    }
    else
    {
        [_segment setSelectedSegmentIndex:2];
        
        _sstate = @"Done";
    }
    
    _date.date = _ddate;
    
    
     _data= [_userDefaults objectForKey:@"ToDo"];
    _toData = [NSKeyedUnarchiver unarchiveObjectWithData:_data];
    
    _data = [_userDefaults objectForKey:@"progressData"];
    _progData= [NSKeyedUnarchiver unarchiveObjectWithData:_data];
    
    _data = [_userDefaults objectForKey:@"Done"];
    _doneData = [NSKeyedUnarchiver unarchiveObjectWithData:_data];
    if(_progData==nil)
    {
        _progData =[NSMutableArray new];
    }
    if(_doneData==nil)
    {
        _doneData =[NSMutableArray new];
    }
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)update:(id)sender {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"comfirm" message:@"Are You sure :) " preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *t =(NSString*)[self->_segment titleForSegmentAtIndex:self->_segment.selectedSegmentIndex] ;

        self->_temp.Name = self->_name.text;
        _temp.date = _date.date;
        _temp.priority = [_proprity titleForSegmentAtIndex:_proprity.selectedSegmentIndex];
        _temp.state = [_segment titleForSegmentAtIndex:_segment.selectedSegmentIndex];
        _temp.desc = _desc.text;

        
        //_temp = [Item new];
        if(![_name.text isEqual:@""]){
            if(_screenNum == 1)
            {
                if([t isEqual:@"Progress"])
                {
                    [self->_toData removeObjectAtIndex:self->_index];
                    [self->_progData addObject:self->_temp];
                    
                }
                else if ([t isEqual:@"ToDo"])
                {
                    [self->_toData removeObjectAtIndex:self->_index];
                    [self->_toData insertObject:_temp atIndex:_index];
                }
                else if ([t isEqual:@"Done"])
                {
                    [self->_toData removeObjectAtIndex:self->_index];
                    [self->_doneData addObject:self->_temp];
                }
            }
            
            else if(_screenNum == 2)
            {
                
                if([t isEqual:@"ToDo"])
                {
                    [self->_progData removeObjectAtIndex:self->_index];
                    [self->_toData addObject:self->_temp];
                    
                }
                else if ([t isEqual:@"Progress"])
                {
                    [self->_progData removeObjectAtIndex:self->_index];
                    [self->_progData insertObject:_temp atIndex:_index];
                }
                else if ([t isEqual:@"Done"])
                {
                    [self->_progData removeObjectAtIndex:self->_index];
                    [self->_doneData addObject:self->_temp];
                }
            }
            
            self->_data =[NSKeyedArchiver archivedDataWithRootObject:self->_toData];
            [self->_userDefaults setObject:self->_data forKey:@"ToDo"];
            [self->_userDefaults synchronize];
            
            self->_data =[NSKeyedArchiver archivedDataWithRootObject:self->_progData];
            [self->_userDefaults setObject:self->_data forKey:@"progressData"];
            [self->_userDefaults synchronize];
            
            self->_data =[NSKeyedArchiver archivedDataWithRootObject:self->_doneData];
            [self->_userDefaults setObject:self->_data forKey:@"Done"];
            [self->_userDefaults synchronize];
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }
        
        
        else{
            UIAlertController* alert2 = [UIAlertController alertControllerWithTitle:@"Warning" message:@"plz enter true data (: :)" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok2=[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            }];
            [alert2 addAction:ok2];
            [self presentViewController:alert2 animated:YES completion:nil];
        }
    }];
    UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    
    
    [alert addAction:ok];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
}


@end
