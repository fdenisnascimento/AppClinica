//
//  HomeViewController.m
//  PersonalPoint
//
//  Created by Denis Nascimento on 7/17/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import "AgendaViewController.h"
#import "AgendaCell.h"
#import "AgendaSwipeView.m"

#define TAG_BT_BUY 876247
#define TAG_BT_CELL 87763253

@interface AgendaViewController ()<SwipeViewAgendaDelegate,MZDayPickerDataSource,MZDayPickerDelegate,UIAlertViewDelegate,SWTableViewCellDelegate>

@property(nonatomic,retain)NSArray *items;
@property(nonatomic,strong) NSDateFormatter *dateFormatter;
@property(nonatomic,retain)NSString* monthSelected;
@property(nonatomic,retain)NSString* daySelected;
@property(nonatomic,retain)NSString* agendaID;

@end

@implementation AgendaViewController

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
    [self updateViewWithDate:[Constants dateToDatabase:[NSDate date]]];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    [self.tableView registerNib:[UINib nibWithNibName:@"AgendaCell" bundle:nil] forCellReuseIdentifier:@"MyCustomCell"];
    
    self.dayPicker.delegate = self;
    self.dayPicker.dataSource = self;
    
    self.dayPicker.dayNameLabelFontSize = 12.0f;
    self.dayPicker.dayLabelFontSize = 18.0f;
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"EE"];
    
    NSDate * now = [NSDate date];
    
    NSLog(@"Did Last Day %@",[Constants MonthNameString:7]);
    
    [self.dayPicker setStartDate:[NSDate
                                  dateFromDay:1
                                  month:[Constants getMonthFromDate:now]
                                  year:[Constants getYearFromDate:now]]
                         endDate:[NSDate
                                  dateFromDay:[Constants GetLastDayOfMonth:now]
                                  month:[Constants getMonthFromDate:now]
                                  year:[Constants getYearFromDate:now]]];
    
    [self.dayPicker setCurrentDate:[NSDate dateFromDay:[Constants getDayFromDate:now] month:[Constants getMonthFromDate:now] year:[Constants getYearFromDate:now]] animated:NO];


    

}

- (NSString *)dayPicker:(MZDayPicker *)dayPicker titleForCellDayNameLabelInDay:(MZDay *)day
{

    return [self.dateFormatter stringFromDate:day.date];
}


- (void)dayPicker:(MZDayPicker *)dayPicker didSelectDay:(MZDay *)day
{
    [self updateViewWithDate:[Constants dateToDatabase:day.date]];
 
}

- (void)dayPicker:(MZDayPicker *)dayPicker willSelectDay:(MZDay *)day
{
    [self updateViewWithDate:[Constants dateToDatabase:day.date]];
 
    
}

-(void)updateViewWithDate:(NSString*)date{
    
    self.items = [[Database sharedInstance]getAgendaWithDate:date];
    [self.tableView reloadData];
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




#pragma -
#pragma Methods of TableView

- (NSArray *)rightButtons
{
  NSMutableArray *rightUtilityButtons = [NSMutableArray new];
  //    [rightUtilityButtons sw_addUtilityButtonWithColor:
  //     [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:1.0]
  //                                                title:@"Adcionar ao calendário"];
  
//  [rightUtilityButtons sw_addUtilityButtonWithColor:
//   [UIColor colorWithRed:55/255.0f green:119/255.0f blue:121/255.0f alpha:1.0f]
//                                               icon:[UIImage imageNamed:@"clock.png"]];
  
  return rightUtilityButtons;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *simpleTableIdentifier = @"MyCustomCell";
  
  AgendaCell *cell = (AgendaCell *)[self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];
  
  AgendaCell __weak *weakCell = cell;
  
  [cell setAppearanceWithBlock:^{
    
    weakCell.rightUtilityButtons = [self rightButtons];
    weakCell.delegate = self;
    weakCell.containingTableView = tableView;
  } force:NO];
  
  [cell setCellHeight:cell.frame.size.height];
  
  
  
    NSDictionary *dic = [self.items objectAtIndex:indexPath.row];
    
    if (![[dic valueForKey:@"status"] isEqualToString:@"N"]) {
        [cell.imageStatus setHidden:NO];
    }else{
        [cell.imageStatus setHidden:YES];
    }
    
    [cell.labelNome setText:[dic valueForKey:@"paciente"]];
    [cell.labelHora setText:[NSString stringWithFormat:@"Agendado para às: %@",[dic valueForKey:@"data_agenda"]]];
    [cell.labelLocal setText:[NSString stringWithFormat:@"Local: %@",[dic valueForKey:@"local"]]];
    [cell.labelTratamento setText:[NSString stringWithFormat:@"Tratamento: %@",[dic valueForKey:@"tratamento"]]];
    
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell setAccessoryType:UITableViewCellAccessoryNone];
    
    return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 111;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    NSLog(@"CountTotal:%d",[self.items  count]);
    return [self.items  count];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //  NSDictionary *dic = [self.items objectAtIndex:indexPath.row];
    
}

#pragma mark -
#pragma mark Table view delegate

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
  
  AgendaCell *cell_ = (AgendaCell *)cell;
  
  
  switch (index) {
    case 0:
    {
//      [self :cell_.indexRow];
  //    [cell hideUtilityButtonsAnimated:YES];
      break;
    }
    default:
      break;
  }
}

- (BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell {
  return YES;
}


-(void)swipeExcluir:(int)tag{
  
    NSDictionary *dic = [self.items objectAtIndex:tag-TAG_BT_CELL];
    self.agendaID = [dic valueForKey:@"id"];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:NAME_APP
                                                   message:@"Excluir esse agendamento?"
                                                  delegate:self
                                         cancelButtonTitle:@"Não"
                                         otherButtonTitles:@"Sim", nil];
    [alert setTag:21];
    [alert show];
    
}
-(void)swipefechar:(int)tag{
    
    NSDictionary *dic = [self.items objectAtIndex:tag-TAG_BT_CELL];
    self.agendaID = [dic valueForKey:@"id"];

   UIAlertView *alert = [[UIAlertView alloc]initWithTitle:NAME_APP
                               message:@"Fechar esse agendamento?"
                              delegate:self
                     cancelButtonTitle:@"Não"
                    otherButtonTitles:@"Sim", nil];
    [alert setTag:2];
    [alert show];

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    switch (buttonIndex) {
        case 1:
            if (alertView.tag == 1) {
                [[Database sharedInstance]deleteAgendaWithID:self.agendaID];
            }else{
                [[Database sharedInstance]updateAgendaWithID:self.agendaID andStatus:@"C"];
            }
            
            break;
            
        default:
            break;
    }
    
    [self updateViewWithDate:[Constants dateToDatabase:[NSDate date]]];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

@end
