//
//  PacienteViewController.h
//  AppClinica
//
//  Created by Denis Nascimento on 7/19/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Paciente2ViewController : UIViewController

@property(nonatomic,retain) IBOutlet UIScrollView *scrolView;
@property (weak, nonatomic) IBOutlet UITextField *textDescCirurgia;
@property (weak, nonatomic) IBOutlet UITextField *textRefeicoesDias;


@property (weak, nonatomic) IBOutlet UISwitch *swExameMedico;
@property (weak, nonatomic) IBOutlet UISwitch *swCirurgia;

@property (weak, nonatomic) IBOutlet UISwitch *swProblemaColuna;
@property (weak, nonatomic) IBOutlet UISwitch *swHipertensao;
@property (weak, nonatomic) IBOutlet UISwitch *swAtividadeFisica;
@property (weak, nonatomic) IBOutlet UISwitch *swFazDieta;



- (IBAction)btnActionPasso3:(id)sender;
-(IBAction)swEnableDescCirurgia:(id)sender;
-(IBAction)ActionBack:(id)sender;

@end
