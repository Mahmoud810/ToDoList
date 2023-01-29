//
//  ViewController.m
//  WorkShop
//
//  Created by Mahmoud on 03/01/2023.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tView;
@property (weak, nonatomic) IBOutlet UILabel *labelname;
@property (weak, nonatomic) IBOutlet UILabel *progLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _progressData = [NSMutableArray new];
    _tView.delegate = self;
    _tView.dataSource = self;
    NSData *pro = [[NSUserDefaults standardUserDefaults] objectForKey:@"progressData"];
    _progressData = [NSKeyedUnarchiver unarchiveObjectWithData:pro];
    // Do any additional setup after loading the view.
}- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (void)viewWillAppear:(BOOL)animated{
        NSData *pro = [[NSUserDefaults standardUserDefaults] objectForKey:@"progressData"];
    _progressData = [NSKeyedUnarchiver unarchiveObjectWithData:pro];
        [_tView reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_progressData count];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Item * tmp = [Item new];
//    tmp.Name=@"mahgjfkdghfjdsk";
    tmp = [_progressData objectAtIndex:indexPath.row];
//    _cellData =tmp;
    //[_tableData objectAtIndex:indexPath.row];
    EditViewController * edit = [self.storyboard instantiateViewControllerWithIdentifier:@"edit"];
    edit.index = indexPath.row;
    edit.nname = tmp.Name;
    edit.ddate = tmp.date;
    edit.ddesc = tmp.desc;
    edit.pproperity = tmp.priority;
    edit.sstate = @"Progress";
    edit.deleget = self;
    edit.screenNum =2;
    [self.navigationController pushViewController:edit animated:YES];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Tasks";
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomCell * cell = (CustomCell*)[tableView dequeueReusableCellWithIdentifier:@"progressCell" forIndexPath:indexPath];
    Item * tmp = [Item new];
    tmp = [_progressData objectAtIndex:indexPath.row];
    cell.progressLabel.text = tmp.Name;
    
    if([tmp.priority isEqual:@"low"])
        cell.progressImg.image =[UIImage imageNamed:@"alert1.png"];
    else if([tmp.priority isEqual:@"meduim"])
        cell.progressImg.image =[UIImage imageNamed:@"alert2.png"];
    else
        cell.progressImg.image =[UIImage imageNamed:@"alert3.png"];
   
    cell.progressImg.layer.borderWidth = 1.0 ;
    cell.progressImg.layer.masksToBounds = false ;
    cell.progressImg.layer.cornerRadius = 40.0 ;
    cell.progressImg.clipsToBounds = true ;
    
    
cell.progressVerfy.image =[UIImage imageNamed:@"verfy.png"];

cell.progressVerfy.layer.borderWidth = 1.0 ;
cell.progressVerfy.layer.masksToBounds = false ;
cell.progressVerfy.layer.cornerRadius = 40.0 ;
cell.progressVerfy.clipsToBounds = true ;

    
    return  cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}
-(void)reloadData{
    NSData *Data = [[NSUserDefaults standardUserDefaults] objectForKey:@"progressData"];
    _progressData = [NSKeyedUnarchiver unarchiveObjectWithData:Data];
    [_tView reloadData];
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"comfirm" message:@"Are You sure :) " preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [_progressData removeObjectAtIndex:indexPath.row];
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_progressData];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"progressData"];
        _tView.reloadData;
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
@end
