//
//  PacienteViewController.h
//  AppClinica
//
//  Created by Denis Nascimento on 7/19/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConsultaViewController : UIViewController
@property(nonatomic,retain)NSDictionary *paciente;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UIView *viewDatePicker;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerQty;
@property (strong, nonatomic) IBOutlet UIView *viewQty;
@property (weak, nonatomic) IBOutlet UIScrollView *scrolView;
@property (weak, nonatomic) IBOutlet UIButton *btnActionSalvar;
@property (weak, nonatomic) IBOutlet UITextField *textName;
@property (weak, nonatomic) IBOutlet UITextField *textTratamento;
@property (weak, nonatomic) IBOutlet UITextField *textData;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property (weak, nonatomic) IBOutlet UIImageView *image4;
@property (weak, nonatomic) IBOutlet UIImageView *image5;
@property (weak, nonatomic) IBOutlet UIImageView *image6;
@property (weak, nonatomic) IBOutlet UIButton *btnActionAddBIO;

-(IBAction)btnActionSalvar:(id)sender;
-(IBAction)ActionBack:(id)sender;
-(IBAction)openPicker:(id)sender;
-(IBAction)btnActionOK:(id)sender;
-(IBAction)tapScrolView:(id)sender;
-(IBAction)imagePresent:(UITapGestureRecognizer*)sender;
- (IBAction)updateLabelDate:(id)sender;
- (IBAction)dateClicked:(id)sender;
- (IBAction)btnActionAddBIO:(id)sender;



@end
