//
//  PacienteViewController.m
//  AppClinica
//
//  Created by Denis Nascimento on 7/19/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import "PacienteViewController.h"
#import "Paciente2ViewController.h"

@interface PacienteViewController ()

@property(nonatomic,retain)NSDate *dateSelected;

@end

@implementation PacienteViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.view addSubview:self.viewDatePicker];
    [self.viewDatePicker setFrame:CGRectMake(0, self.view.frame.size.height+257, self.view.frame.size.width, 257)];
    
    for (UIView *view in self.scrolView.subviews) {
        if ([view isKindOfClass:[UITextField class]]) {
            
            UITextField *text = (UITextField*)view;
            UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
            text.leftView = paddingView;
            text.leftViewMode = UITextFieldViewModeAlways;
            
        }
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)ActionBack:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnActioPasso2:(id)sender {
    
    
    NSArray *vality = [NSArray arrayWithObjects:self.textName,
                       self.textProfissao,
                       self.textNascimento,
                       self.textPeso,
                       self.textAltura,
                       self.textEndereco,
                       self.textCep,
                       self.textTelefone,
                       self.textCelular,self.textCPF,
                       nil];
    
    if (![Constants validityFields:vality]) {
  
        [[MessageBarManager sharedInstance]
         showMessageWithTitle:NAME_APP
         description:@"Todos os campos são obrigatórios"
         type:MessageBarMessageTypeInfo];
        
        return;

    }
    
    [[Paciente sharedInstance]setNome:self.textName.text];
    [[Paciente sharedInstance]setProfissao:self.textProfissao.text];
    [[Paciente sharedInstance]setNascimento:self.textNascimento.text];
    [[Paciente sharedInstance]setPeso:self.textPeso.text];
    [[Paciente sharedInstance]setAltura:self.textAltura.text];
    [[Paciente sharedInstance]setEndereco:self.textEndereco.text];
    [[Paciente sharedInstance]setCep:self.textCep.text];
    [[Paciente sharedInstance]setTelefone:self.textTelefone.text];
    [[Paciente sharedInstance]setCelular:self.textCelular.text];
    [[Paciente sharedInstance]setCpf:self.textCPF.text];
    

    
    Paciente2ViewController *passo2 = [Paciente2ViewController new];
    [self.navigationController pushViewController:passo2 animated:YES];
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

- (IBAction)btnActionDateOK:(id)sender {
    [self  hideDatePicke];
}
-(IBAction)dateClicked:(id)sender{
        [self hiddenKeyboard];
    [self showDatePicke];
}
- (IBAction)updateLabelDate:(id)sender{
    
    [self.textNascimento setText:[Constants dateFormatedFromDate:self.datePicker.date]];
    self.dateSelected = self.datePicker.date;
}

-(void)showDatePicke{
    
     
    [UIView animateWithDuration:0.5 animations:^{
        
        [self.viewDatePicker setFrame:CGRectMake(0, self.view.frame.size.height-250, self.view.frame.size.width, 257)];
        
    } completion:^(BOOL finished) {
        
    }];
    
}

-(void)hideDatePicke{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        [self.viewDatePicker setFrame:CGRectMake(0, self.view.frame.size.height+257, self.view.frame.size.width, 257)];
        
    } completion:^(BOOL finished) {
        //[self.background setHidden:YES];
        
        
    }];
    
}

-(IBAction)tapScrolView:(id)sender{
    
    [self hiddenKeyboard];
    
}

-(void)hiddenKeyboard{
    
    [self.textName resignFirstResponder];
    [self.textProfissao resignFirstResponder];
    [self.textPeso resignFirstResponder];
    [self.textAltura resignFirstResponder];
    [self.textCPF resignFirstResponder];
    [self.textTelefone resignFirstResponder];
    [self.textCelular resignFirstResponder];
    [self.textEndereco resignFirstResponder];
    [self.textCep resignFirstResponder];
    [self.scrolView setContentOffset:CGPointMake(0,0) animated:YES];
}

@end
