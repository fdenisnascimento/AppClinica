//
//  HomeViewController.m
//  PersonalPoint
//
//  Created by Denis Nascimento on 7/17/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import "DetalheViewController.h"
#import "DetalheCell.h"
#import "PacienteDetalheViewController.h"
#import "BioViewController.h"
#import "ConsultaDetalheViewController.h"

#define TAG_BT_BUY 876247
#define TAG_BT_CELL 87763253

@interface DetalheViewController ()<SWTableViewCellDelegate>

@property(nonatomic,retain)NSArray *items;
@property(nonatomic,strong) NSDateFormatter *dateFormatter;
@property(nonatomic,retain)NSString* monthSelected;
@property(nonatomic,retain)NSString* daySelected;
@property(nonatomic,assign)int tipo;

@end

@implementation DetalheViewController

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
    self.tipo = 1;
    [self updateViewWithDate:1];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
   [self.tableView registerNib:[UINib nibWithNibName:@"DetalheCell" bundle:nil] forCellReuseIdentifier:@"MyCustomCell"];
   // [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.btnActionConsulta setBackgroundColor:[UIColor whiteColor]];
    
    self.tipo = 1;
}

-(IBAction)swButton:(UIButton*)sender{
    
    if (sender.tag == 1) {
        [self.btnActionConsulta setBackgroundColor:[UIColor whiteColor]];
        [self.btnActionBIO setBackgroundColor:[UIColor colorWithRed:0.199 green:0.202 blue:0.199 alpha:1.000]];
        [self updateViewWithDate:1];
        self.tipo = 1;
    }else{
        [self.btnActionBIO setBackgroundColor:[UIColor whiteColor]];
        [self.btnActionConsulta setBackgroundColor:[UIColor colorWithRed:0.199 green:0.202 blue:0.199 alpha:1.000]];
        [self updateViewWithDate:2];
        self.tipo = 2;
    }
    
}


-(void)updateViewWithDate:(int)tipo{
    
    if (tipo == 1) {
        self.items = [[Database sharedInstance]getConsultaWithPacienteID:[[self.paciente valueForKey:@"id"]integerValue]];
    }else{
        self.items = [[Database sharedInstance]getBiometricoWithPacienteID:[[self.paciente valueForKey:@"id"]integerValue]];
    }
    
    [self.tableView reloadData];
    
    [self.labelNome setText:[self.paciente valueForKey:@"nome"]];
    [self.labelTelefone setText:[self.paciente valueForKey:@"celular"]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnActionMenu:(id)sender {
    
//    if ([self.slideMenuController isMenuOpen])
//		[self.slideMenuController showContentViewControllerAnimated:YES completion:nil];
//	else
//		[self.slideMenuController showMenuAnimated:YES completion:nil];

    [self.navigationController popViewControllerAnimated:YES];
}




#pragma -
#pragma Methods of TableView

- (NSArray *)rightButtons
{
  NSMutableArray *rightUtilityButtons = [NSMutableArray new];
  //    [rightUtilityButtons sw_addUtilityButtonWithColor:
  //     [UIColor colorWithRed:1.0f green:1.0f blue:0.35f alpha:1.0]
  //                                                title:@"Adcionar ao calendário"];
  
  [rightUtilityButtons sw_addUtilityButtonWithColor:
   [UIColor colorWithRed:55/255.0f green:119/255.0f blue:121/255.0f alpha:1.0f]
                                               icon:[UIImage imageNamed:@"clock.png"]];
  
  return rightUtilityButtons;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *simpleTableIdentifier = @"MyCustomCell";
    
  DetalheCell *cell = (DetalheCell *)[self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier forIndexPath:indexPath];
  
  DetalheCell __weak *weakCell = cell;
  
  [cell setAppearanceWithBlock:^{
    
    weakCell.rightUtilityButtons = [self rightButtons];
    weakCell.delegate = self;
    weakCell.containingTableView = tableView;
  } force:NO];
  
  [cell setCellHeight:cell.frame.size.height];
  
    NSDictionary *dic = [self.items objectAtIndex:indexPath.row];
    
    if (self.tipo == 1) {
        [cell.labelNome setText:@"Consulta"];
         [cell.labelTratamento setText:[NSString stringWithFormat:@"Tratamento: %@",[dic valueForKey:@"tratamento"]]];
    }else{
        [cell.labelNome setText:@"Controle biometrico"];
         [cell.labelTratamento setText:@""];
    }
    

    [cell.labelHora setText:[NSString stringWithFormat:@"Data: %@",[dic valueForKey:@"data_consulta"]]];
   
    
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell setAccessoryType:UITableViewCellAccessoryNone];
    
    return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 82;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    NSLog(@"CountTotal:%d",[self.items  count]);
    return [self.items  count];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    NSDictionary *dic = [self.items objectAtIndex:indexPath.row];
    
     if (self.tipo == 1) {
         
         ConsultaDetalheViewController *consulta = [ConsultaDetalheViewController new];
         [consulta setPaciente:self.paciente];
         [consulta setConsulta:dic];
         [self.navigationController pushViewController:consulta animated:YES];
         
     }else{
         BioViewController *bio = [BioViewController new];
         [bio setBio:dic];
         [self.navigationController pushViewController:bio animated:YES];
     }
    
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
  
  DetalheCell *cell_ = (DetalheCell *)cell;
  
  
  switch (index) {
    case 0:
    {

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
-(void)swipeEditar:(int)tag{
  
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (IBAction)btnActionConsulta:(id)sender {

}
- (IBAction)btnActionBIO:(id)sender {

}


- (IBAction)btnActionOpenDetail:(id)sender {

    PacienteDetalheViewController *detailVC = [PacienteDetalheViewController new];
    [detailVC setPaciente:self.paciente];
    [self.navigationController pushViewController:detailVC animated:YES];
    
}



@end
