//
//  PacienteViewController.m
//  AppClinica
//
//  Created by Denis Nascimento on 7/19/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import "AddAgendaViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface AddAgendaViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate,UIActionSheetDelegate,UITextViewDelegate>


@property(nonatomic,retain)NSArray *qtyItems;
@property(nonatomic,retain)NSArray *tratamento;
@property(nonatomic,assign)int tratamentoSelected;
@property(nonatomic,assign)int tagImageSelected;
@property(nonatomic,retain)NSDate *dateSelected;

@end

@implementation AddAgendaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.dateSelected = [NSDate date];
    [self updateView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.view addSubview:self.viewQty];
    [self.viewQty setFrame:CGRectMake(0, self.view.frame.size.height+257, 320, 257)];
    [self.scrolView setDelaysContentTouches:YES];
    [self.textData setText:[Constants dateAndTimeFormatedFromDate:[NSDate date]]];
    [self.textView.layer setCornerRadius:5];
    [self.textLocal.layer setCornerRadius:5];
    
    [self.view addSubview:self.viewDatePicker];   
    [self.viewDatePicker setFrame:CGRectMake(0, self.view.frame.size.height+257, 320, 257)];
    
}


-(void)updateView{
    
    self.tratamento = [[Database sharedInstance]getTratamentos];
    NSMutableArray *mute = [NSMutableArray array];
    [mute addObject:@"Escolha um tratamento"];
    for (NSDictionary *dic in self.tratamento) {
        [mute addObject:[dic valueForKey:@"nome"]];
    }

    self.qtyItems = (NSArray*)mute;
    
    if ([self.qtyItems count] < 1) {
       
        [[MessageBarManager sharedInstance]
         showMessageWithTitle:NAME_APP
         description:@"Precisa cadastrar os tipos de tratamentos, antes de continuar."
         type:MessageBarMessageTypeInfo];
        
        [self.slideMenuController showMenuAnimated:YES completion:nil];
        

    }
    
    [self.textName setText:[self.paciente valueForKey:@"nome"]];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnActionSalvar:(id)sender {
    
   
    if ([Constants isEmptyString:self.textData.text] || [Constants isEmptyString:self.textTratamento.text]) {
        
        [[MessageBarManager sharedInstance]
         showMessageWithTitle:NAME_APP
         description:@"Os campos Data e Tratamento, são obrigatórios"
         type:MessageBarMessageTypeInfo];
        
        return;
    }
    
    [[Agenda sharedInstance]setData_agenda:[Constants dateAndDayToDatabase:self.dateSelected]];
    [[Agenda sharedInstance]setPacienteID:[self.paciente valueForKey:@"id"]];
    [[Agenda sharedInstance]setTratamentoID:[NSString stringWithFormat:@"%d",self.tratamentoSelected]];
    [[Agenda sharedInstance]setObservacao:self.textView.text];
    [[Agenda sharedInstance]setLocal:self.textLocal.text];
    [[Agenda sharedInstance]setStatus:@"N"];
    

    [[MessageBarManager sharedInstance]
     showMessageWithTitle:NAME_APP
     description:[[Database sharedInstance]insertAgenda:[Agenda sharedInstance]]
     type:MessageBarMessageTypeInfo];

    [self.navigationController popViewControllerAnimated:YES];
  
}

-(IBAction)tapScrolView:(id)sender{
    
    [self.textData resignFirstResponder];
    [self.textView resignFirstResponder];
    [self.textLocal resignFirstResponder];
    [self.scrolView setContentOffset:CGPointMake(0,0) animated:YES];
    
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    
    [self.scrolView setContentOffset:CGPointMake(0,textView.center.y-140) animated:YES];
}

-(void)textFieldDidBeginEditing:(UITextField*)textField
{
    [self.scrolView setContentOffset:CGPointMake(0,textField.center.y-140) animated:YES];

}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    [self.scrolView setContentOffset:CGPointMake(0,0) animated:YES];
    
    
    return YES;
}

-(IBAction)ActionBack:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)openPicker:(id)sender {
    [self showAddOthers];
}

-(void)showAddOthers{

    [UIView animateWithDuration:0.5 animations:^{
        
        [self.viewQty setFrame:CGRectMake(0, self.view.frame.size.height-257, 320, 257)];
        
    } completion:^(BOOL finished) {
        
    }];
    
}

-(void)hideAddOthers{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        [self.viewQty setFrame:CGRectMake(0, self.view.frame.size.height+257, 320, 257)];
        
    } completion:^(BOOL finished) {
        
    }];
    
}

- (IBAction)btnActionOK:(id)sender {

    [self hideAddOthers];
}

#pragma mark -
#pragma mark PickerView Delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.qtyItems count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.qtyItems objectAtIndex:row];
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
  
    if (row == 0) {
        return;
    }
    
    NSDictionary *dic = [self.tratamento objectAtIndex:row-1];
    
    [self.textTratamento setText:[dic valueForKey:@"nome"]];
    self.tratamentoSelected = [[dic valueForKey:@"id"]integerValue];
    NSLog(@"row:%d",row);
    
    [self hideAddOthers];
    
}


- (IBAction)btnActionDateOK:(id)sender {
    [self  hideDatePicke];
}
-(IBAction)dateClicked:(id)sender{
    [self showDatePicke];
}


- (IBAction)updateLabelDate:(id)sender{
    
    [self.textData setText:[Constants dateAndTimeFormatedFromDate:self.datePicker.date]];
    self.dateSelected = self.datePicker.date;
}

-(void)showDatePicke{
    
    //  [self.background setHidden:NO];
    //   [self.view bringSubviewToFront:self.viewAddOthers];
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        [self.viewDatePicker setFrame:CGRectMake(0, self.view.frame.size.height-250, 320, 257)];
        
    } completion:^(BOOL finished) {
        
    }];
    
}

-(void)hideDatePicke{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        [self.viewDatePicker setFrame:CGRectMake(0, self.view.frame.size.height+257, 320, 257)];
        
    } completion:^(BOOL finished) {
        //[self.background setHidden:YES];
        
        
    }];
    
}


@end
