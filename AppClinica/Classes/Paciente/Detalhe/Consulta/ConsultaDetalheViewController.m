//
//  PacienteViewController.m
//  AppClinica
//
//  Created by Denis Nascimento on 7/19/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import "ConsultaDetalheViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "BioViewController.h"
#import "GalleryViewController.h"

@interface ConsultaDetalheViewController ()<UITextViewDelegate>

@property(nonatomic,retain)NSArray *images;


@end

@implementation ConsultaDetalheViewController

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
    
    [self.btnActionGaleria.layer setCornerRadius:5];
}


-(void)updateView{

    
    NSMutableArray *mute = [NSMutableArray array];
    
    [self.textName setText:[self.paciente valueForKey:@"nome"]];
    [self.textTratamento setText:[self.consulta valueForKey:@"tratamento"]];
    [self.textData setText:[self.consulta valueForKey:@"data_consulta"]];
    [self.textView setText:[self.consulta valueForKey:@"observacao"]];
    
    
    if (![Constants isEmptyString:[self.consulta valueForKey:@"image1"]]) {
        [mute addObject:[self.consulta valueForKey:@"image1"]];
        [self.image1 setImage:[self getImageWithName:[self.consulta valueForKey:@"image1"]]];
    }

    if (![Constants isEmptyString:[self.consulta valueForKey:@"image2"]]) {
        [mute addObject:[self.consulta valueForKey:@"image2"]];
        [self.image2 setImage:[self getImageWithName:[self.consulta valueForKey:@"image2"]]];
    }
    if (![Constants isEmptyString:[self.consulta valueForKey:@"image3"]]) {
        [mute addObject:[self.consulta valueForKey:@"image3"]];
        [self.image3 setImage:[self getImageWithName:[self.consulta valueForKey:@"image3"]]];
    }
    if (![Constants isEmptyString:[self.consulta valueForKey:@"image4"]]) {
        [mute addObject:[self.consulta valueForKey:@"image4"]];
        [self.image4 setImage:[self getImageWithName:[self.consulta valueForKey:@"image4"]]];
    }
    if (![Constants isEmptyString:[self.consulta valueForKey:@"image5"]]) {
        [mute addObject:[self.consulta valueForKey:@"image5"]];
        [self.image5 setImage:[self getImageWithName:[self.consulta valueForKey:@"image5"]]];
    }
    if (![Constants isEmptyString:[self.consulta valueForKey:@"image6"]]) {
        [mute addObject:[self.consulta valueForKey:@"image6"]];
        [self.image6 setImage:[self getImageWithName:[self.consulta valueForKey:@"image6"]]];
    }

    self.images = (NSArray*)mute;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)btnActionGaleria:(id)sender {
    
    NSLog(@"btActionGallery");
    GalleryViewController *gallery = [[GalleryViewController alloc] initWithNibName:@"GalleryViewController" bundle:nil];
    [gallery setItems:self.images];
    [self.navigationController pushViewController:gallery animated:YES];

}

- (UIImage*)getImageWithName:(NSString*)name {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,     NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *getImagePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",name]];
    return  [UIImage imageWithContentsOfFile:getImagePath];
}


@end
