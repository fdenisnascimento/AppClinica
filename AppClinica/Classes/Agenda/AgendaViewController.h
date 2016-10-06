//
//  HomeViewController.h
//  PersonalPoint
//
//  Created by Denis Nascimento on 7/17/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZDayPicker.h"

@interface AgendaViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet MZDayPicker *dayPicker;


- (IBAction)btnActionMenu:(id)sender ;


@end
