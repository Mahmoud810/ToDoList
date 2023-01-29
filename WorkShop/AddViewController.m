//
//  AddViewController.m
//  WorkShop
//
//  Created by Mahmoud on 04/01/2023.
//

#import "AddViewController.h"

@interface AddViewController ()
@property (weak, nonatomic) IBOutlet UITextField *Name;
@property (weak, nonatomic) IBOutlet UITextField *des;
@property (weak, nonatomic) IBOutlet UISegmentedControl *prioity;
@property (weak, nonatomic) IBOutlet UIDatePicker *date;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _item = [Item new];
    
    // Do any additional setup after loading the view.
}
- (IBAction)add:(id)sender {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"comfirm" message:@"Are You sure :) " preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if(![_Name.text isEqual:@""]){
            self->_item.Name = self->_Name.text;
            self->_item.desc = self->_des.text;
            self->_item.date = self->_date.date;
            self->_item.priority = [self->_prioity titleForSegmentAtIndex:self->_prioity.selectedSegmentIndex];
            self->_item.state = @"ToDo";
            [self->_delgate getData:self->_item];
            [self.navigationController popViewControllerAnimated:YES];}
        else {
            UIAlertController* alert2 = [UIAlertController alertControllerWithTitle:@"Warning" message:@"plz enter true data (: :)" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok2=[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            }];
            [alert2 addAction:ok2];
            [self presentViewController:alert2 animated:YES completion:nil];
        }
        
    }];
    UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        self->_item.Name = self->_Name.text;
//        self->_item.desc = self->_des.text;
//        self->_item.date = self->_date.date;
//        _item.priority = [_prioity titleForSegmentAtIndex:_prioity.selectedSegmentIndex];
        
    }];
        
        
     
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
