//
//  SobreViewController.h
//  THSCred
//
//  Created by Denis Nascimento on 7/10/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SobreViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)btnActionMenu:(id)sender;
@end
