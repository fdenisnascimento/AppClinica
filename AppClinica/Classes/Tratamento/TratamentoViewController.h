//
//  HomeViewController.h
//  PersonalPoint
//
//  Created by Denis Nascimento on 7/17/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TratamentoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textName;


- (IBAction)btnActionMenu:(id)sender ;
- (IBAction)addPoint:(id)sender;

@end
