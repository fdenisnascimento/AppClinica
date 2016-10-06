//
//  HomeViewController.h
//  PersonalPoint
//
//  Created by Denis Nascimento on 7/17/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZDayPicker.h"

@interface PacienteDetalheViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *profissao;
@property (weak, nonatomic) IBOutlet UITextField *nascimento;
@property (weak, nonatomic) IBOutlet UITextField *peso;
@property (weak, nonatomic) IBOutlet UITextField *altura;
@property (weak, nonatomic) IBOutlet UITextField *cpf;
@property (weak, nonatomic) IBOutlet UITextField *telefone;
@property (weak, nonatomic) IBOutlet UITextField *celular;
@property (weak, nonatomic) IBOutlet UITextView *endereco;
@property (weak, nonatomic) IBOutlet UITextField *cep;

@property (weak, nonatomic) IBOutlet UITextField *descCirurgia;
@property (weak, nonatomic) IBOutlet UISwitch *exameMedico;
@property (weak, nonatomic) IBOutlet UISwitch *fexCirurgia;
@property (weak, nonatomic) IBOutlet UITextField *refeicoes;
@property (weak, nonatomic) IBOutlet UISwitch *problemaColuna;
@property (weak, nonatomic) IBOutlet UISwitch *hipertensao;
@property (weak, nonatomic) IBOutlet UISwitch *atividadeFisica;
@property (weak, nonatomic) IBOutlet UISwitch *fazDieta;
@property (weak, nonatomic) IBOutlet UITextField *queixa;
@property (weak, nonatomic) IBOutlet UISwitch *abdome;
@property (weak, nonatomic) IBOutlet UISwitch *laterais;
@property (weak, nonatomic) IBOutlet UISwitch *gluteo;
@property (weak, nonatomic) IBOutlet UISwitch *coxas;
@property (weak, nonatomic) IBOutlet UISwitch *costas;
@property (weak, nonatomic) IBOutlet UISwitch *bracos;


@property (weak, nonatomic) IBOutlet UIScrollView *scrolView;




@property (weak, nonatomic) NSDictionary *paciente;

- (IBAction)btnActionMenu:(id)sender ;

@end
