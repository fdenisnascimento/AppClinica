//
//  HomeViewController.h
//  PersonalPoint
//
//  Created by Denis Nascimento on 7/17/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MZDayPicker.h"

@interface DetalheViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *labelNome;
@property (weak, nonatomic) IBOutlet UILabel *labelTelefone;
@property (weak, nonatomic) NSDictionary *paciente;
@property (weak, nonatomic) IBOutlet UIButton *btnActionBIO;
@property (weak, nonatomic) IBOutlet UIButton *btnActionConsulta;


- (IBAction)btnActionMenu:(id)sender ;
- (IBAction)swButton:(UIButton*)sender;
- (IBAction)btnActionOpenDetail:(id)sender ;

@end
