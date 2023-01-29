//
//  ToDoViewController.m
//  WorkShop
//
//  Created by Mahmoud on 03/01/2023.
//

#import "ToDoListViewController.h"

@interface ToDoListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tView;

@end

@implementation ToDoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableData = [NSMutableArray new];
    _cellData = [Item new];
    _tView.delegate = self;
    _tView.dataSource = self;
    NSData *Data = [[NSUserDefaults standardUserDefaults] objectForKey:@"ToDo"];
    _tableData = [NSKeyedUnarchiver unarchiveObjectWithData:Data];
    
    // Do any additional setup after loading the view.
}

- (IBAction)addButton:(id)sender {
    AddViewController * add = [self.storyboard instantiateViewControllerWithIdentifier:@"addScreen"];
    add.delgate =self;
    [self.navigationController pushViewController:add animated:YES];
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   return 100;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tableData.count;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"comfirm" message:@"Are You sure :) " preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok=[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [_tableData removeObjectAtIndex:indexPath.row];
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_tableData];
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"ToDo"];
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

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CustomCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
        _cellData =[_tableData objectAtIndex:indexPath.row];
        cell.Name.text =_cellData.Name;
        
        if([_cellData.priority isEqual:@"low"])
            cell.image.image =[UIImage imageNamed:@"alert1.png"];
        else if([_cellData.priority isEqual:@"meduim"])
            cell.image.image =[UIImage imageNamed:@"alert2.png"];
        else
            cell.image.image =[UIImage imageNamed:@"alert3.png"];
        
        cell.image.layer.borderWidth = 1.0 ;
        cell.image.layer.masksToBounds = false ;
        cell.image.layer.cornerRadius = 40.0 ;
        cell.image.clipsToBounds = true ;
    
        return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Tasks";
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _cellData = [_tableData objectAtIndex:indexPath.row];
    EditViewController * edit = [self.storyboard instantiateViewControllerWithIdentifier:@"edit"];
    
    edit.nname = _cellData.Name;
    edit.ddate = _cellData.date;
    edit.ddesc = _cellData.desc;
    edit.pproperity = _cellData.priority;
    edit.sstate = _cellData.state;
    edit.index = indexPath.row;
    edit.screenNum =1;
    edit.deleget = self;
    [self.navigationController pushViewController:edit animated:YES];
}
- (void)viewWillAppear:(BOOL)animated{
    NSData *Data = [[NSUserDefaults standardUserDefaults] objectForKey:@"ToDo"];
    _tableData = [NSKeyedUnarchiver unarchiveObjectWithData:Data];
    [_tView reloadData];
}
-(void)getData:(Item*)tmp{
    if(_tableData ==nil )
    {
        
        _tableData = [NSMutableArray new];
    }
    [_tableData addObject:tmp];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_tableData];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"ToDo"];
    [_tView reloadData];
}
-(void)reloadData{
    NSData *Data = [[NSUserDefaults standardUserDefaults] objectForKey:@"ToDo"];
    _tableData = [NSKeyedUnarchiver unarchiveObjectWithData:Data];
    [_tView reloadData];
}



@end
