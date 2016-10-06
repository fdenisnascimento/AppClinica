//
//  PacienteViewController.h
//  AppClinica
//
//  Created by Denis Nascimento on 7/19/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConsultaDetalheViewController : UIViewController
@property(nonatomic,retain)NSDictionary *paciente;
@property(nonatomic,retain)NSDictionary *consulta;

@property (weak, nonatomic) IBOutlet UIScrollView *scrolView;
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
@property (weak, nonatomic) IBOutlet UIButton *btnActionGaleria;



-(IBAction)ActionBack:(id)sender;
- (IBAction)btnActionGaleria:(id)sender;
-(IBAction)tapScrolView:(id)sender;




@end
