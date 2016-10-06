//
//  PacienteViewController.h
//  AppClinica
//
//  Created by Denis Nascimento on 7/19/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BioViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UIView *viewDatePicker;
@property(nonatomic,retain)NSDictionary *paciente;
@property(nonatomic,retain)NSDictionary *bio;
@property (weak, nonatomic) IBOutlet UITextField *textData;
@property (weak, nonatomic) IBOutlet UITextField *textCintura;
@property (weak, nonatomic) IBOutlet UITextField *textQuadril;
@property (weak, nonatomic) IBOutlet UITextField *textCoxaEsquerda;
@property (weak, nonatomic) IBOutlet UITextField *textCoxaDireita;
@property (weak, nonatomic) IBOutlet UITextField *textBracoEsquerdo;
@property (weak, nonatomic) IBOutlet UITextField *textBracoDireito;
@property (weak, nonatomic) IBOutlet UITextField *textPeso;
@property (weak, nonatomic) IBOutlet UIButton *btnActionSave;
@property (weak, nonatomic) IBOutlet UIButton *btnActionDate;

@property(nonatomic,retain) IBOutlet UIScrollView *scrolView;




- (IBAction)btnActionPasso3:(id)sender;
- (IBAction)btnActionDateOK:(id)sender;
- (IBAction)ActionBack:(id)sender;
- (IBAction)updateLabelDate:(id)sender;
- (IBAction)dateClicked:(id)sender;
-(IBAction)tapScrolView:(id)sender;

@end
