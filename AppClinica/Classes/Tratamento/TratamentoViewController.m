//
//  HomeViewController.m
//  PersonalPoint
//
//  Created by Denis Nascimento on 7/17/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import "TratamentoViewController.h"
#import "TratamentoCell.h"
#import "TratamentoSwipeView.h"
#import "SWTableViewCell.h"

#define TAG_BT_BUY 876247
#define TAG_BT_CELL 87763253

@interface TratamentoViewController ()<SWTableViewCellDelegate>

@property(nonatomic,retain)NSArray *items;

@end

@implementation TratamentoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setHidden:YES];

    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView registerNib:[UINib nibWithNibName:@"TratamentoCell" bundle:nil] forCellReuseIdentifier:@"MyCustomCell"];
    
    [self updateView];
}

-(void)updateView{
    
    [self.textName setText:@""];
    self.items= [[Database sharedInstance]getTratamentos];
    
    if ([self.items count] > 0) {
       [self.tableView reloadData];
    }
 
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnActionMenu:(id)sender {
    
    if ([self.slideMenuController isMenuOpen])
		[self.slideMenuController showContentViewControllerAnimated:YES completion:nil];
	else
		[self.slideMenuController showMenuAnimated:YES completion:nil];
    
}

- (IBAction)addPoint:(id)sender {

    if ([Constants isEmptyString:self.textName.text] ) {
        [[MessageBarManager sharedInstance]
         showMessageWithTitle:NAME_APP
         description:@"Digite um tratamento"
         type:MessageBarMessageTypeInfo];
        
        return;

    }
   
    [[MessageBarManager sharedInstance]
     showMessageWithTitle:NAME_APP
     description:[[Database sharedInstance]insertTratamentoWithName:self.textName.text]
     type:MessageBarMessageTypeInfo];
    
   
  [self.textName resignFirstResponder];
    [self updateView];
}


#pragma -
#pragma Methods of TableView

- (NSArray *)rightButtons
{
  NSMutableArray *rightUtilityButtons = [NSMutableArray new];
  [rightUtilityButtons sw_addUtilityButtonWithColor:[UIColor redColor] title:@"Exluir"];
  
  return rightUtilityButtons;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

  TratamentoCell *cell = (TratamentoCell *)[self.tableView dequeueReusableCellWithIdentifier:@"MyCustomCell" forIndexPath:indexPath];
  
  TratamentoCell __weak *weakCell = cell;
  cell.indexRow =indexPath.row;
  
  [cell setAppearanceWithBlock:^{
    
    weakCell.rightUtilityButtons = [self rightButtons];
    weakCell.delegate = self;
    weakCell.containingTableView = tableView;
  } force:NO];
  
  [cell setCellHeight:cell.frame.size.height];
  
    NSDictionary *dic = [self.items objectAtIndex:indexPath.row];
    [cell.labelNome setText:[dic valueForKey:@"nome"]];
    
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell setAccessoryType:UITableViewCellAccessoryNone];
    
    return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 45;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    NSLog(@"CountTotal:%d",[self.items  count]);
    return [self.items  count];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //  NSDictionary *dic = [self.items objectAtIndex:indexPath.row];
    
}

#pragma mark - SWTableViewDelegate

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index {
  switch (index) {
    case 0:
      NSLog(@"left button 0 was pressed");
      break;
    case 1:
      NSLog(@"left button 1 was pressed");
      break;
    case 2:
      NSLog(@"left button 2 was pressed");
      break;
    case 3:
      NSLog(@"left btton 3 was pressed");
    default:
      break;
  }
}

- (void)swipeableTableViewCell:(SWTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
  
 TratamentoCell *cell_ = (TratamentoCell *)cell;
  NSDictionary *item = [self.items objectAtIndex:cell_.indexRow];
  
  switch (index) {
    case 0:
    {
      [self deleteTratamento:[item valueForKey:@"id"]];
      [cell hideUtilityButtonsAnimated:YES];
      break;
    }
    default:
      break;
  }
}

- (BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell {
  return YES;
}


-(void)deleteTratamento:(NSString*)index{
  [[Database sharedInstance]deleteTratamentoWithID:index];
  [self updateView];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

@end
