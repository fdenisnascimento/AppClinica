//
//  PacienteViewController.h
//  AppClinica
//
//  Created by Denis Nascimento on 7/19/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PacienteViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UIView *viewDatePicker;
@property (weak, nonatomic) IBOutlet UITextField *textCep;
@property(nonatomic,retain) IBOutlet UIScrollView *scrolView;
@property (weak, nonatomic) IBOutlet UITextField *textName;
@property (weak, nonatomic) IBOutlet UITextField *textProfissao;
@property (weak, nonatomic) IBOutlet UITextField *textNascimento;
@property (weak, nonatomic) IBOutlet UITextField *textPeso;
@property (weak, nonatomic) IBOutlet UITextField *textAltura;
@property (weak, nonatomic) IBOutlet UITextField *textCPF;
@property (weak, nonatomic) IBOutlet UITextField *textTelefone;
@property (weak, nonatomic) IBOutlet UITextField *textCelular;
@property (weak, nonatomic) IBOutlet UITextField *textEndereco;



-(IBAction)ActionBack:(id)sender;
- (IBAction)btnActioPasso2:(id)sender;
- (IBAction)updateLabelDate:(id)sender;
- (IBAction)dateClicked:(id)sender;
-(IBAction)tapScrolView:(id)sender;

@end
