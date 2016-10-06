//
//  HomeViewController.m
//  PersonalPoint
//
//  Created by Denis Nascimento on 7/17/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import "PacienteDetalheViewController.h"
#import "DetalheCell.h"
#import <QuartzCore/QuartzCore.h>

#define TAG_BT_BUY 876247
#define TAG_BT_CELL 87763253

@interface PacienteDetalheViewController ()

@property(nonatomic,retain)NSArray *items;
@property(nonatomic,strong) NSDateFormatter *dateFormatter;
@property(nonatomic,assign)int tipo;

@end

@implementation PacienteDetalheViewController

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
     
    [self updateViewWithDate:1];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view addSubview:self.scrolView];
    [self.scrolView setFrame:CGRectMake(0, IS_IPHONE5 ? 65: 130, 320,IS_IPHONE5 ? 500 :450)];
    [self.scrolView setContentSize:CGSizeMake(320, 1100)];
    
    [self.endereco.layer setCornerRadius:5];
    [self.endereco setBackgroundColor:[UIColor whiteColor]];
    
        
//    self.profissao.leftView = paddingView;
//    self.profissao.leftViewMode = UITextFieldViewModeAlways;
    
    for (UIView *view in self.scrolView.subviews) {
        if ([view isKindOfClass:[UITextField class]]) {

            UITextField *text = (UITextField*)view;
            UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 20)];
            text.leftView = paddingView;
            text.leftViewMode = UITextFieldViewModeAlways;

        }
    }

  }



-(void)updateViewWithDate:(int)tipo{
       
    NSLog(@"paciente:%@",self.paciente);
    
    [self.name setText:[self.paciente valueForKey:@"nome"]];
    [self.profissao setText:[self.paciente valueForKey:@"profissao"]];
    [self.nascimento setText:[self.paciente valueForKey:@"nascimento"]];
    [self.peso setText:[self.paciente valueForKey:@"peso"]];
    [self.altura setText:[self.paciente valueForKey:@"altura"]];
    [self.cpf setText:[self.paciente valueForKey:@"cpf"]];
    [self.telefone setText:[self.paciente valueForKey:@"telefone"]];
    [self.celular setText:[self.paciente valueForKey:@"celular"]];
    [self.endereco setText:[self.paciente valueForKey:@"endereco"]];
    [self.cep setText:[self.paciente valueForKey:@"cep"]];

    
    [self.abdome setOn:[[self.paciente valueForKey:@"abdome"]boolValue]];
    [self.coxas setOn:[[self.paciente valueForKey:@"coxas"]boolValue]];    
    [self.costas setOn:[[self.paciente valueForKey:@"costas"]boolValue]];
    [self.laterais setOn:[[self.paciente valueForKey:@"laterais"]boolValue]];
    [self.gluteo setOn:[[self.paciente valueForKey:@"gluteo"]boolValue]];
    [self.bracos setOn:[[self.paciente valueForKey:@"bracos"]boolValue]];
    
    
    [self.exameMedico setOn:[[self.paciente valueForKey:@"atestado_medico"]boolValue]];
    [self.fexCirurgia setOn:[[self.paciente valueForKey:@"fazCirurgia"]boolValue]];
    [self.problemaColuna setOn:[[self.paciente valueForKey:@"problema_coluna"]boolValue]];
    [self.hipertensao setOn:[[self.paciente valueForKey:@"hipertensao"]boolValue]];
    [self.atividadeFisica setOn:[[self.paciente valueForKey:@"faz_atividade_fisica"]boolValue]];
    [self.fazDieta setOn:[[self.paciente valueForKey:@"faz_dieta"]boolValue]];
    [self.descCirurgia setText:[self.paciente valueForKey:@"descCirurgia"]];
 
    [self.queixa setText:[self.paciente valueForKey:@"queixa"]];
    [self.refeicoes setText:[self.paciente valueForKey:@"refeicoes"]];
    
       
    

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnActionMenu:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}


@end
