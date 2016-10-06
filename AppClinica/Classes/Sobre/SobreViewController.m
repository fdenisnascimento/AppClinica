//
//  SobreViewController.m
//  THSCred
//
//  Created by Denis Nascimento on 7/10/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import "SobreViewController.h"
#import "NVSlideMenuController.h"

@interface SobreViewController ()

@end

@implementation SobreViewController

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
    
    [self.labelTitle setText:@"Sobre"];
    
    [self.webView setBackgroundColor:[UIColor clearColor]];
    
    [self.webView setOpaque:NO];
    
    for(UIView *view in self.webView.subviews){
        if ([view isKindOfClass:[UIImageView class]]) {
            // to transparent
            [view removeFromSuperview];
        }
        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView *sView = (UIScrollView *)view;
            //to hide Scroller bar
            sView.showsVerticalScrollIndicator = NO;
            sView.showsHorizontalScrollIndicator = NO;
            for (UIView* shadowView in [sView subviews]){
                //to remove shadow
                if ([shadowView isKindOfClass:[UIImageView class]]) {
                    [shadowView setHidden:TRUE];
                }
            }
        }
    }
    
    
    [self updateView];
    
    
}

-(void)updateView{
       [self.activity startAnimating];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:URL_HTML_ABOUT]];
    [self.webView loadRequest:request];
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [self.activity stopAnimating];
    
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
    [self.activity stopAnimating];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnActionMenu:(id)sender {
    
    if ([self.slideMenuController isMenuOpen])
		[self.slideMenuController showContentViewControllerAnimated:YES completion:nil];
	else
		[self.slideMenuController showMenuAnimated:YES completion:nil];
    
}

@end
