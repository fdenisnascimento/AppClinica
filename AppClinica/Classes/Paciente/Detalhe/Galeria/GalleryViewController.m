//
//  GalleryViewController.m
//  BODigital
//
//  Created by Denis Nascimento on 6/13/13.
//  Copyright (c) 2013 Thiago Santos. All rights reserved.
//

#import "GalleryViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface GalleryViewController ()<UIScrollViewDelegate>{
    BOOL pageControlBeingUsed;
}

@end

@implementation GalleryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setHidden:YES];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  //  [self.scrollview setFrame:CGRectMake(0, 100, 320, 460)];
  //  [self.scrollview setBackgroundColor:[UIColor redColor]];
    self.scrollview .maximumZoomScale = 4.0;
    self.scrollview .minimumZoomScale = 1.0;
    self.scrollview .delegate = self;
    
    [self updateView];
}


-(void)updateView{
    
    NSMutableArray *mute = [NSMutableArray array];
    
    for (int i = 0; i < [self.items count]; i++) {
        [mute addObject:[self getImageWithName:[self.items objectAtIndex:i]]];
        
    }
    
    self.pageImages = (NSArray*)mute;
    
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
	for (int i = 0; i < [self.pageImages  count]; i++) {
		CGRect frame;
		frame.origin.x = self.scrollview.frame.size.width * i;
		frame.origin.y = 0;
		frame.size = self.scrollview.frame.size;

        UIImageView *img=[[UIImageView alloc] initWithFrame:CGRectMake(screenWidth*i,0,screenWidth ,self.scrollview.frame.size.height )];
        [img setContentMode:UIViewContentModeScaleAspectFit];
        img.image = [self.pageImages  objectAtIndex:i];
        
        
		[self.scrollview addSubview:img];

	}
	
    
	self.scrollview.contentSize = CGSizeMake(self.scrollview.frame.size.width * [self.pageImages count], self.view.frame.size.height-100);
    
	self.pagecontrol.currentPage = 0;
	self.pagecontrol.numberOfPages = [self.pageImages  count];
    //[self.scrollview setBackgroundColor:[UIColor redColor]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btActionBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -  Methods of Page Control/ScrollView

- (void)scrollViewDidScroll:(UIScrollView *)sender {
    
	if (!pageControlBeingUsed) {
		// Switch the indicator when more than 50% of the previous/next page is visible
		CGFloat pageWidth = self.scrollview.frame.size.width;
		int page = floor((self.scrollview.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
		self.pagecontrol.currentPage = page;

	}
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
	pageControlBeingUsed = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	pageControlBeingUsed = NO;
}

- (IBAction)changePage  {
	// Update the scroll view to the appropriate page
	CGRect frame;
	frame.origin.x = self.scrollview.frame.size.width * self.pagecontrol.currentPage;
	frame.origin.y = 0;
	frame.size = self.scrollview.frame.size;
	[self.scrollview scrollRectToVisible:frame animated:YES];
	
	pageControlBeingUsed = YES;
}

- (UIImage*)getImageWithName:(NSString*)name {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,     NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *getImagePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",name]];
    return  [UIImage imageWithContentsOfFile:getImagePath];
}


@end
