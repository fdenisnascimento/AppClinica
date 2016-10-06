//
//  PacienteViewController.h
//  AppClinica
//
//  Created by Denis Nascimento on 7/19/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Paciente3ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIPickerView *pickerQty;
@property (strong, nonatomic) IBOutlet UIView *viewQty;
@property (weak, nonatomic) IBOutlet UILabel *labelQueixa;
@property (weak, nonatomic) IBOutlet UISwitch *swAbdome;
@property (weak, nonatomic) IBOutlet UISwitch *swCoxas;
@property (weak, nonatomic) IBOutlet UISwitch *swLaterais;
@property (weak, nonatomic) IBOutlet UISwitch *swCostas;
@property (weak, nonatomic) IBOutlet UISwitch *swGluteo;
@property (weak, nonatomic) IBOutlet UISwitch *swBracos;
@property (weak, nonatomic) IBOutlet UIButton *btnActionSalvar;

-(IBAction)btnActionSalvar:(id)sender;
-(IBAction)ActionBack:(id)sender;
-(IBAction)openPicker:(id)sender;
-(IBAction)btnActionOK:(id)sender;


@end
