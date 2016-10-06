//
//  PacienteViewController.m
//  AppClinica
//
//  Created by Denis Nascimento on 7/19/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import "BioViewController.h"


@interface BioViewController ()
@property(nonatomic,retain)NSDate *dateSelected;
@end

@implementation BioViewController

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
    [self.textData setText:[Constants dateAndTimeFormatedFromDate:[NSDate date]]];
    [self.view addSubview:self.viewDatePicker];
    [self.viewDatePicker setFrame:CGRectMake(0, self.view.frame.size.height+257, 320, 257)];
    self.dateSelected = [NSDate date];
    
    [self updateView];
}


-(void)updateView{
    
    if (self.bio) {
        
        [self.textCintura setText:[self.bio valueForKey:@"cintura"]];
        [self.textQuadril setText:[self.bio valueForKey:@"quadril"]];
        [self.textCoxaEsquerda setText:[self.bio valueForKey:@"coxa_esquerda"]];
        [self.textCoxaDireita setText:[self.bio valueForKey:@"coxa_direita"]];
        [self.textBracoEsquerdo setText:[self.bio valueForKey:@"braco_esquerdo"]];
        [self.textBracoDireito setText:[self.bio valueForKey:@"braco_direito"]];
        [self.textPeso setText:[self.bio valueForKey:@"peso"]];
        
        [self.btnActionDate setEnabled:NO];
        [self.btnActionSave setHidden:YES];
        
        for (UIView *view in self.scrolView.subviews) {
            if ([view isKindOfClass:[UITextField class]]) {
                
                UITextField *text = (UITextField*)view;
                [text setEnabled:NO];
                
                
            }
        }
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnActionPasso3:(id)sender {
    
    NSArray *vality = [NSArray arrayWithObjects:self.textData,self.textCintura,self.textQuadril,self.textCoxaEsquerda,self.textCoxaDireita,self.textBracoEsquerdo,self.textBracoDireito,self.textPeso, nil];
    
    
    if (![Constants validityFields:vality]) {
        
        [[MessageBarManager sharedInstance]
         showMessageWithTitle:NAME_APP
         description:@"Todos os campos são obrigatórios"
         type:MessageBarMessageTypeInfo];
        
        return;
        
    }
    
    
    [[Biometrico sharedInstance]setDataBIO:[Constants dateAndDayToDatabase:self.dateSelected]];
    [[Biometrico sharedInstance]setCintura:self.textCintura.text];
    [[Biometrico sharedInstance]setQuadril:self.textQuadril.text];
    [[Biometrico sharedInstance]setCoxaEsquerda:self.textCoxaEsquerda.text];
    [[Biometrico sharedInstance]setCoxaDireito:self.textCoxaDireita.text];
    [[Biometrico sharedInstance]setBracoEsquerdo:self.textBracoEsquerdo.text];
    [[Biometrico sharedInstance]setBracoDireito:self.textBracoDireito.text];
    [[Biometrico sharedInstance]setPeso:self.textPeso.text];
    [[Biometrico sharedInstance]setPacienteID:[self.paciente valueForKey:@"id"]];
    
    [[MessageBarManager sharedInstance]
     showMessageWithTitle:NAME_APP
     description:[[Database sharedInstance]insertBIO:[Biometrico sharedInstance]]
     type:MessageBarMessageTypeInfo];
    
    [self.navigationController popViewControllerAnimated:YES];
    
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


- (IBAction)btnActionDateOK:(id)sender {
    [self  hideAddOthers];
}
-(IBAction)dateClicked:(id)sender{
    [self showAddOthers];
}

- (IBAction)updateLabelDate:(id)sender{
    
    [self.textData setText:[Constants dateAndTimeFormatedFromDate:self.datePicker.date]];
    self.dateSelected = self.datePicker.date;
}

-(void)showAddOthers{
    
    //  [self.background setHidden:NO];
    //   [self.view bringSubviewToFront:self.viewAddOthers];
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        [self.viewDatePicker setFrame:CGRectMake(0, self.view.frame.size.height-257, 320, 257)];
        
    } completion:^(BOOL finished) {
        
    }];
    
}

-(void)hideAddOthers{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        [self.viewDatePicker setFrame:CGRectMake(0, self.view.frame.size.height+257, 320, 257)];
        
    } completion:^(BOOL finished) {
        //[self.background setHidden:YES];
        
        
    }];
    
}


-(IBAction)tapScrolView:(id)sender{
    
    [self hiddenKeyboard];
    
}

-(void)hiddenKeyboard{
    
    
    for (UIView *view in self.scrolView.subviews) {
        if ([view isKindOfClass:[UITextField class]]) {
            
            UITextField *text = (UITextField*)view;

            [text resignFirstResponder];

            
        }
    }
    [self.scrolView setContentOffset:CGPointMake(0,0) animated:YES];
}

@end
