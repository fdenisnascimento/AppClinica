//
//  HomeViewController.m
//  PersonalPoint
//
//  Created by Denis Nascimento on 7/17/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import "HomeViewController.h"
#import "ClockCell.h"
#import "swipeView.h"
#import "PacienteViewController.h"
#import "BioViewController.h"
#import "ConsultaViewController.h"
#import "AddAgendaViewController.h"
#import "DetalheViewController.h"

#define TAG_BT_BUY 876247
#define TAG_BT_CELL 87763253

@interface HomeViewController ()<SWTableViewCellDelegate>

@property(nonatomic,retain)NSArray *items;

@end

@implementation HomeViewController

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
  
  // Enable iOS 7 back gesture
  if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
  }
  
  
[self updateView];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.tableView registerNib:[UINib nibWithNibName:@"ClockCell" bundle:nil] forCellReuseIdentifier:@"MyCustomCell"];
    
    NSDate *today = [[NSDate alloc] init];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    
    NSString *currentTime = [dateFormatter stringFromDate: today];
    self.labelTime.text = currentTime;
    
    
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    [dateFormatter1 setDateStyle:NSDateFormatterLongStyle];
   // [dateFormatter1 setTimeStyle:NSDateFormatterNoStyle];
    

    
    NSString *formattedDateString = [dateFormatter1 stringFromDate:today];
    [self.labelDate setText:formattedDateString];

        
    [NSTimer scheduledTimerWithTimeInterval:1
                                                    target:self
                                                  selector:@selector(pollTime)
                                                  userInfo:nil
                                                   repeats:YES];
    
    
}

-(void)updateView{
    
    self.items = [[Database sharedInstance]getPacientes];
    
    if ([self.items count] > 0) {
        [self.tableView reloadData]; 
    }
  

 
}


- (void) pollTime
{
    
    NSDate *today = [[NSDate alloc] init];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    
    NSString *currentTime = [dateFormatter stringFromDate: today];
    self.labelTime.text = currentTime;
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
    
    PacienteViewController *paciente = [PacienteViewController new];
    [self.navigationController pushViewController:paciente animated:YES];
    [self updateView];
}


#pragma -
#pragma Methods of TableView

- (NSArray *)rightButtons
{

  NSMutableArray *rightUtilityButtons = [NSMutableArray new];
  
  [rightUtilityButtons sw_addUtilityButtonWithColor:
   [UIColor colorWithRed:55/255.0f green:119/255.0f blue:121/255.0f alpha:1.0f]
                                               icon:[UIImage imageNamed:@"agenda.png"]];
  
  
  [rightUtilityButtons sw_addUtilityButtonWithColor:
    [UIColor colorWithRed:55/255.0f green:119/255.0f blue:121/255.0f alpha:1.0f]
                                               icon:[UIImage imageNamed:@"consulta.png"]];
  
  [rightUtilityButtons sw_addUtilityButtonWithColor:
   [UIColor colorWithRed:55/255.0f green:119/255.0f blue:121/255.0f alpha:1.0f]
                                               icon:[UIImage imageNamed:@"ic_menssagem.png"]];
  
  [rightUtilityButtons sw_addUtilityButtonWithColor:
    [UIColor greenColor]
                                               icon:[UIImage imageNamed:@"ic_telefone.png"]];
  
  
  return rightUtilityButtons;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *simpleTableIdentifier = @"MyCustomCell";
    
  ClockCell *cell = (ClockCell *)[self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];
  
  ClockCell __weak *weakCell = cell;
  cell.indexRow = indexPath.row;
  
  [cell setAppearanceWithBlock:^{
    
    weakCell.rightUtilityButtons = [self rightButtons];
    weakCell.delegate = self;
    weakCell.containingTableView = tableView;
  } force:NO];
  
  [cell setCellHeight:cell.frame.size.height];
  
   
    NSDictionary *dic = [self.items objectAtIndex:indexPath.row];
    
    [cell.labelNome setText:[dic valueForKey:@"nome"]];

    NSString *last = [Constants isEmptyString:[dic valueForKey:@"ultima_consulta"]] ? @"Paciente sem consulta" :[dic valueForKey:@"ultima_consulta"];

    
    [cell.labelLastConsulta setText:[NSString stringWithFormat:@"Última consulta: %@",last]];
    
    
    NSString *prox = [Constants isEmptyString:[dic valueForKey:@"proxima_consulta"]] ? @"Paciente sem agenda" :[dic valueForKey:@"proxima_consulta"];
    
    [cell.labelProxConsulta setText:[NSString stringWithFormat:@"Próxima consulta: %@",prox]];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 85;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    NSLog(@"CountTotal:%d",[self.items  count]);
    return [self.items  count];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
      NSDictionary *dic = [self.items objectAtIndex:indexPath.row];
    
    DetalheViewController *detalhe = [DetalheViewController new];
    [detalhe setPaciente:dic];
    [self.navigationController pushViewController:detalhe animated:YES];
    
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
  
  ClockCell *cell_ = (ClockCell *)cell;
  NSDictionary *item = [self.items objectAtIndex:cell_.indexRow];
  
  switch (index) {
    case 0:
      [self swipeAgenda:item];
      break;
    case 1:
      [self swipeConsulta:item];
      break;
    case 2:
      [self swipeMessage:item];
      break;
    case 3:
      [self swipeTelefone:item];
      break;
    default:
      break;
  }
   [cell hideUtilityButtonsAnimated:YES];
}

- (BOOL)swipeableTableViewCellShouldHideUtilityButtonsOnSwipe:(SWTableViewCell *)cell {
  return YES;
}


-(void)swipeAgenda:(NSDictionary*)paciente{
    
    AddAgendaViewController *addAgenda = [AddAgendaViewController new];
    [addAgenda setPaciente:paciente];
    [self.navigationController pushViewController:addAgenda animated:YES];
    
}
-(void)swipeConsulta:(NSDictionary*)paciente{
     
    ConsultaViewController *consulta = [ConsultaViewController new];
    [consulta setPaciente:paciente];
    [self.navigationController pushViewController:consulta animated:YES];
    
}
-(void)swipeMessage:(NSDictionary*)paciente{

   NSString *phone = [paciente valueForKey:@"celular"];
  
    if (![Constants isEmptyString:phone]) {
        
        phone = [phone stringByReplacingOccurrencesOfString:@"(" withString:@""];
        phone = [phone stringByReplacingOccurrencesOfString:@")" withString:@""];
        phone = [phone stringByReplacingOccurrencesOfString:@"-" withString:@""];
        phone = [phone stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"sms:%@",phone]]];
        NSLog(@"messageTo:%@",[NSString stringWithFormat:@"SMS:%@",[paciente valueForKey:@"celular"]]);
     }else{
         [[MessageBarManager sharedInstance]
          showMessageWithTitle:NAME_APP
          description: @"Paciente sem celular cadastrado"
          type:MessageBarMessageTypeInfo];
     }
    
    
}
-(void)swipeTelefone:(NSDictionary*)paciente{
    
 
    
     NSString *phone = [paciente valueForKey:@"celular"];
    
    if (![Constants isEmptyString:phone]) {
        
        phone = [phone stringByReplacingOccurrencesOfString:@"(" withString:@""];
        phone = [phone stringByReplacingOccurrencesOfString:@")" withString:@""];
        phone = [phone stringByReplacingOccurrencesOfString:@"-" withString:@""];
        phone = [phone stringByReplacingOccurrencesOfString:@" " withString:@""];
        
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phone]]];
        NSLog(@"phoneTo:%@",[NSString stringWithFormat:@"TEL:%@",[paciente valueForKey:@"celular"]] );

        
    }else{
        [[MessageBarManager sharedInstance]
         showMessageWithTitle:NAME_APP
         description: @"Paciente sem celular cadastrado"
         type:MessageBarMessageTypeInfo];
    }
    
    
}



@end
