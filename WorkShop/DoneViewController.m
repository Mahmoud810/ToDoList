//
//  DoneViewController.m
//  WorkShop
//
//  Created by Mahmoud on 04/01/2023.
//

#import "DoneViewController.h"

@interface DoneViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tView;

@end

@implementation DoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableDone = [NSMutableArray new];
    _cellData = [Item new];
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"Done"];
    _tableDone = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    _tView.delegate =self;
    _tView.dataSource=self;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Tasks";
}
- (void)viewWillAppear:(BOOL)animated{
    NSData *Data = [[NSUserDefaults standardUserDefaults] objectForKey:@"Done"];
    _tableDone = [NSKeyedUnarchiver unarchiveObjectWithData:Data];
    _tView.reloadData;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tableDone.count ;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomCell *doneCell = (CustomCell*)[tableView dequeueReusableCellWithIdentifier:@"DoneCell" forIndexPath:indexPath];
    _tmp = [_tableDone objectAtIndex:indexPath.row];
    doneCell.DoneLabel.text =_tmp.Name;
    if([_tmp.priority isEqual:@"low"])
        doneCell.DonImg.image =[UIImage imageNamed:@"alert1.png"];
    else if([_tmp.priority isEqual:@"meduim"])
        doneCell.DonImg.image =[UIImage imageNamed:@"alert2.png"];
    else
        doneCell.DonImg.image =[UIImage imageNamed:@"alert3.png"];
   
    doneCell.DonImg.layer.borderWidth = 1.0 ;
    doneCell.DonImg.layer.masksToBounds = false ;
    doneCell.DonImg.layer.cornerRadius = 40.0 ;
    doneCell.DonImg.clipsToBounds = true ;
    return doneCell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return  100.0;
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
