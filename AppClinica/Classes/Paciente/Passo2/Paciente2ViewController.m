//
//  PacienteViewController.m
//  AppClinica
//
//  Created by Denis Nascimento on 7/19/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import "Paciente2ViewController.h"
#import "Paciente3ViewController.h"

@interface Paciente2ViewController ()

@end

@implementation Paciente2ViewController

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
        [self.textDescCirurgia setEnabled:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnActionPasso3:(id)sender {
    
    NSArray *vality ;
    
    if (self.swCirurgia.on) {
        vality = [NSArray arrayWithObjects:self.textDescCirurgia,self.textRefeicoesDias, nil];
    }else{
        vality = [NSArray arrayWithObjects:self.textRefeicoesDias, nil];
    }
    
    
    if (![Constants validityFields:vality]) {
        
        [[MessageBarManager sharedInstance]
         showMessageWithTitle:NAME_APP
         description:@"Todos os campos são obrigatórios"
         type:MessageBarMessageTypeInfo];
        
        return;
        
    }
    
    [[Paciente sharedInstance]setAtestadoMedico:self.swExameMedico.isOn];
    [[Paciente sharedInstance]setFazCirurgia:self.swCirurgia.isOn];
    [[Paciente sharedInstance]setDescCirurgia:self.textDescCirurgia.text];
    [[Paciente sharedInstance]setRefeicoes:[self.textRefeicoesDias.text integerValue]];
    [[Paciente sharedInstance]setProblemaColuna:self.swProblemaColuna.isOn];
    [[Paciente sharedInstance]setHipertensao:self.swHipertensao.isOn];
    [[Paciente sharedInstance]setFazAtividadeFisica:self.swAtividadeFisica.isOn];
    [[Paciente sharedInstance]setFazDieta:self.swFazDieta.isOn];
    
           
    Paciente3ViewController *passo3 = [Paciente3ViewController new];
    [self.navigationController pushViewController:passo3 animated:YES];
    
}

-(IBAction)ActionBack:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
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

-(IBAction)swEnableDescCirurgia:(id)sender{
    if (self.swCirurgia.on) {
        [self.textDescCirurgia setEnabled:YES];
    }else{
        [self.textDescCirurgia setEnabled:NO];
    }
}

@end
