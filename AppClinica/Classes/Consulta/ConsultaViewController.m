//
//  PacienteViewController.m
//  AppClinica
//
//  Created by Denis Nascimento on 7/19/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import "ConsultaViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "BioViewController.h"

@interface ConsultaViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate,UIActionSheetDelegate,UITextViewDelegate>


@property(nonatomic,retain)NSArray *qtyItems;
@property(nonatomic,retain)NSArray *tratamento;
@property(nonatomic,assign)int tratamentoSelected;
@property(nonatomic,assign)int tagImageSelected;
@property(nonatomic,retain)NSDate *dateSelected;

@property(nonatomic,retain)UIImage *image_1;
@property(nonatomic,retain)UIImage *image_2;
@property(nonatomic,retain)UIImage *image_3;
@property(nonatomic,retain)UIImage *image_4;
@property(nonatomic,retain)UIImage *image_5;
@property(nonatomic,retain)UIImage *image_6;


@end

@implementation ConsultaViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self updateView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.view addSubview:self.viewQty];
    [self.viewQty setFrame:CGRectMake(0, self.view.frame.size.height+257, 320, 257)];
    [self.scrolView setDelaysContentTouches:YES];
    [self.textData setText:[Constants dateAndTimeFormatedFromDate:[NSDate date]]];
    [self.textView.layer setCornerRadius:5];
    [self.btnActionAddBIO.layer setCornerRadius:5];
    
    [self.view addSubview:self.viewDatePicker];   
    [self.viewDatePicker setFrame:CGRectMake(0, self.view.frame.size.height+257, 320, 257)];
        self.dateSelected = [NSDate date];
    
    
//    self.image1 = nil;
//    self.image2 = nil;
//    self.image3 = nil;
//    self.image4 = nil;
//    self.image5 = nil;
//    self.image6 = nil;
    
}


-(void)updateView{
    
    self.tratamento = [[Database sharedInstance]getTratamentos];
    NSMutableArray *mute = [NSMutableArray array];
    [mute addObject:@"Escolha um tratamento"];
   
    for (NSDictionary *dic in self.tratamento) {
        [mute addObject:[dic valueForKey:@"nome"]];
    }

    self.qtyItems = (NSArray*)mute;
    
    if ([self.qtyItems count] < 1) {
       
        [[MessageBarManager sharedInstance]
         showMessageWithTitle:NAME_APP
         description:@"Precisa cadastrar os tipos de tratamentos, antes de continuar."
         type:MessageBarMessageTypeInfo];
        
        [self.slideMenuController showMenuAnimated:YES completion:nil];
        

    }
    
    [self.textName setText:[self.paciente valueForKey:@"nome"]];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnActionSalvar:(id)sender {
    
   
    if ([Constants isEmptyString:self.textData.text] || [Constants isEmptyString:self.textTratamento.text]) {
        
        [[MessageBarManager sharedInstance]
         showMessageWithTitle:NAME_APP
         description:@"Os campos Data e Tratamento, são obrigatórios"
         type:MessageBarMessageTypeInfo];
        
        return;
    }
    
    [[Consulta sharedInstance]setDataConsulta:[Constants dateAndDayToDatabase:self.dateSelected]];
    [[Consulta sharedInstance]setPacienteID:[self.paciente valueForKey:@"id"]];
    [[Consulta sharedInstance]setTratamentoID:[NSString stringWithFormat:@"%d",self.tratamentoSelected]];
    [[Consulta sharedInstance]setObservacao:self.textView.text];
    [[Consulta sharedInstance]setImage1:self.image_1];
    [[Consulta sharedInstance]setImage2:self.image_2];
    [[Consulta sharedInstance]setImage3:self.image_3];
    [[Consulta sharedInstance]setImage4:self.image_4];
    [[Consulta sharedInstance]setImage5:self.image_5];
    [[Consulta sharedInstance]setImage6:self.image_6];
    
    
    [[MessageBarManager sharedInstance]
     showMessageWithTitle:NAME_APP
     description:[[Database sharedInstance]insertConsulta:[Consulta sharedInstance]]
     type:MessageBarMessageTypeInfo];

    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)tapScrolView:(id)sender{
    
    [self.textData resignFirstResponder];
    [self.textView resignFirstResponder];
    [self.scrolView setContentOffset:CGPointMake(0,0) animated:YES];
    
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    
    [self.scrolView setContentOffset:CGPointMake(0,textView.center.y-140) animated:YES];
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

-(IBAction)ActionBack:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)openPicker:(id)sender {
    [self showAddOthers];
}

-(void)showAddOthers{

    [UIView animateWithDuration:0.5 animations:^{
        
        [self.viewQty setFrame:CGRectMake(0, self.view.frame.size.height-257, 320, 257)];
        
    } completion:^(BOOL finished) {
        
    }];
    
}

-(void)hideAddOthers{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        [self.viewQty setFrame:CGRectMake(0, self.view.frame.size.height+257, 320, 257)];
        
    } completion:^(BOOL finished) {
        
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


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
  
    if (row == 0) {
        return;
    }
    
    NSDictionary *dic = [self.tratamento objectAtIndex:row-1];
    
    [self.textTratamento setText:[dic valueForKey:@"nome"]];
    self.tratamentoSelected = [[dic valueForKey:@"id"]integerValue];
    NSLog(@"row:%d",row);
    
    [self hideAddOthers];
    
}

-(IBAction)imagePresent:(UITapGestureRecognizer*)sender{
    
    NSLog(@"image.tag:%d",sender.view.tag);
    self.tagImageSelected = sender.view.tag;
    [self openPhoto:self.tagImageSelected];

}

- (void)openPhoto:(int)tag{
    
    NSLog(@"openPhoto");
    
    UIActionSheet *action = [[UIActionSheet alloc]initWithTitle:NAME_APP delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:nil otherButtonTitles:@"Escolher do Álbum",@"Tirar Foto", nil];
    [action showInView:self.view];
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    
    switch (buttonIndex) {
        case 0:
            [self fotoLibraryAction];
            break;
        case 1:
            [self fotoCameraAction];
            break;
        default:
            break;
    }
    
    
}

-(void)fotoLibraryAction {
    
	UIImagePickerController  *photo = [[UIImagePickerController alloc] init];
	photo.delegate = self;
//	photo.allowsEditing = YES;
	[self presentViewController:photo animated:YES completion:nil];
    
}

-(void)fotoCameraAction {
    
    
    UIImagePickerController  *photo = [[UIImagePickerController alloc] init];
	photo.delegate = self;
//	photo.allowsEditing = YES;
	
	if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        photo.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:photo animated:YES completion:nil];
	}
    
    
}

#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *img_temp;
    img_temp = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    
    switch (self.tagImageSelected) {
        case 1:
            [self.image1 setImage:img_temp];
            self.image_1 = img_temp;
            break;
        case 2:
            [self.image2 setImage:img_temp];
            self.image_2 = img_temp;
            break;
        case 3:
            [self.image3 setImage:img_temp];
            self.image_3 = img_temp;
            break;
        case 4:
            [self.image4 setImage:img_temp];
            self.image_4 = img_temp;
            break;
        case 5:
            [self.image5 setImage:img_temp];
            self.image_5 = img_temp;
            break;
        case 6:
            [self.image6 setImage:img_temp];
            self.image_6 = img_temp;
            break;


        default:
            break;
    }
    
    
	[self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)btnActionDateOK:(id)sender {
    [self  hideDatePicke];
}
-(IBAction)dateClicked:(id)sender{
    [self showDatePicke];
}

- (IBAction)btnActionAddBIO:(id)sender {
    
    BioViewController *bioVC = [BioViewController new];
    [bioVC setPaciente:self.paciente];
    [self.navigationController pushViewController:bioVC animated:YES];
    
    
}
- (IBAction)updateLabelDate:(id)sender{
    
    [self.textData setText:[Constants dateAndTimeFormatedFromDate:self.datePicker.date]];
    self.dateSelected = self.datePicker.date;
}

-(void)showDatePicke{
    
    //  [self.background setHidden:NO];
    //   [self.view bringSubviewToFront:self.viewAddOthers];
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        [self.viewDatePicker setFrame:CGRectMake(0, self.view.frame.size.height-250, 320, 257)];
        
    } completion:^(BOOL finished) {
        
    }];
    
}

-(void)hideDatePicke{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        [self.viewDatePicker setFrame:CGRectMake(0, self.view.frame.size.height+257, 320, 257)];
        
    } completion:^(BOOL finished) {
        //[self.background setHidden:YES];
        
        
    }];
    
}


@end
