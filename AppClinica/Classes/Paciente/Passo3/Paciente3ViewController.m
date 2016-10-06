//
//  PacienteViewController.m
//  AppClinica
//
//  Created by Denis Nascimento on 7/19/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import "Paciente3ViewController.h"
#import "HomeViewController.h"

@interface Paciente3ViewController ()
@property(nonatomic,retain)NSArray *qtyItems;

@end

@implementation Paciente3ViewController

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
    
    [self.view addSubview:self.viewQty];
    [self.viewQty setFrame:CGRectMake(0, self.view.frame.size.height+257, self.view.frame.size.width, 257)];
    
    self.qtyItems = [NSArray arrayWithObjects:@"Selecione um item",@"Celulite",@"Gordura localizada",@"Estrias",@"Inchaços",@"Nódulos", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnActionSalvar:(id)sender {
    
    if ([Constants isEmptyString:self.labelQueixa.text]) {
        
        [[MessageBarManager sharedInstance]
         showMessageWithTitle:NAME_APP
         description:@"Escolha uma queixa"
         type:MessageBarMessageTypeInfo];
        
        return;
        
    }
    
    [[Paciente sharedInstance]setQueixa:self.labelQueixa.text];
    [[Paciente sharedInstance]setAbdome:self.swAbdome.isOn];
    [[Paciente sharedInstance]setCoxas:self.swCoxas.isOn];
    [[Paciente sharedInstance]setLaterais:self.swLaterais.isOn];
    [[Paciente sharedInstance]setCostas:self.swCostas.isOn];
    [[Paciente sharedInstance]setGluteo:self.swGluteo.isOn];
    [[Paciente sharedInstance]setBracos:self.swBracos.isOn];

    [[MessageBarManager sharedInstance]
     showMessageWithTitle:NAME_APP
     description: [[Database sharedInstance]insertPaciente:[Paciente sharedInstance]]
     type:MessageBarMessageTypeInfo];
    
    HomeViewController *home = [HomeViewController new];
    NSArray *views = [NSArray arrayWithObjects:home, nil];
    [self.navigationController setViewControllers:views animated:YES];
    
}

-(IBAction)ActionBack:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)openPicker:(id)sender {
    [self showAddOthers];
}



-(void)showAddOthers{
    
    //  [self.background setHidden:NO];
    //   [self.view bringSubviewToFront:self.viewAddOthers];
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        [self.viewQty setFrame:CGRectMake(0, self.view.frame.size.height-257, self.view.frame.size.width, 257)];
        
    } completion:^(BOOL finished) {
        
    }];
    
}

-(void)hideAddOthers{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        [self.viewQty setFrame:CGRectMake(0, self.view.frame.size.height+257, self.view.frame.size.width, 257)];
        
    } completion:^(BOOL finished) {
        //[self.background setHidden:YES];
        
        
    }];
    
}

- (IBAction)btnActionOK:(id)sender {

    [self hideAddOthers];
}

#pragma mark -
#pragma mark PickerView Delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.qtyItems count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.qtyItems objectAtIndex:row];
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    if (row == 0) {
        return;
    }
    [self.labelQueixa setText:[self.qtyItems objectAtIndex:row]];
    NSLog(@"row:%d",row);

    [self hideAddOthers];
}



@end
