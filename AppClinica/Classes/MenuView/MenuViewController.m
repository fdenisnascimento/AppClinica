//
//  MenuViewController.m
//  AllNight
//
//  Created by Thiago Santos on 03/02/13.
//  Copyright (c) 2013 Thiago Santos. All rights reserved.
//

#import "MenuViewController.h"
#import "NVSlideMenuController.h"
#import "HomeViewController.h"
#import "TratamentoViewController.h"
#import "SobreViewController.h"
#import "AgendaViewController.h"
#define NUMBER_OF_SECTIONS	1
#define NUMBER_OF_ROWS	5

@interface MenuViewController (){
    
    UIImage *thumbnail;
}

- (void)togglePanGestureEnabled:(UIBarButtonItem *)sender;
- (void)toggleSlideDirection:(UIBarButtonItem *)sender;

@end

@implementation MenuViewController

- (id)initWithStyle:(UITableViewStyle)style
{
	self = [super initWithStyle:style];
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self.navigationController.navigationBar setHidden:YES];

    
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.scrollEnabled = YES;

}

- (void)setPanGestureEnabled:(BOOL)panGestureEnabled{
   	self.slideMenuController.panGestureEnabled = panGestureEnabled;
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
	
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
	
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return NUMBER_OF_ROWS;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
	if (!cell){
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        UIView *bgColorView = [[UIView alloc] init];
        [bgColorView setBackgroundColor:[UIColor colorWithRed:53.0f/255.0f green:51.0f/255.0f blue:51.0f/255.0f alpha:1.0f]];
        [cell setSelectedBackgroundView:bgColorView];
        

        UIImageView* bgCell = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_lista_menu.png"]];
        [cell setBackgroundView:bgCell];

    }
    
	if (indexPath.row == 0) {        
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 75)];
        UIImageView* bgCell = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tapume_ths_menu.png"]];
        bgCell.frame = CGRectMake(0, 0, 195, 75);
        [headerView addSubview:bgCell];
        [cell addSubview:headerView];
    }
    

    
    if (indexPath.row == 1) {
        cell.textLabel.text = NSLocalizedString(@"Inicial", nil);
        cell.textLabel.numberOfLines = 2;
        thumbnail = [UIImage imageNamed:@"icon_transito.png"];
    }
    if (indexPath.row == 2) {
        cell.textLabel.text = NSLocalizedString(@"Agenda", nil);
        cell.textLabel.numberOfLines = 2;
        thumbnail = [UIImage imageNamed:@"icon_novo_bo.png"];
    }
    if (indexPath.row == 3) {
        cell.textLabel.text = NSLocalizedString(@"Tratamento", nil);
        thumbnail = [UIImage imageNamed:@"icon_historico.png"];
    }
    
     if (indexPath.row == 4) {
        cell.textLabel.text = NSLocalizedString(@"Sobre", nil);
        thumbnail = [UIImage imageNamed:@"icon_telefone.png"];
    }

    
          
    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:13.0f];
    
    CGSize itemSize = CGSizeMake(28, 28);
    UIGraphicsBeginImageContext(itemSize);
    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
    [thumbnail drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 75;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (self.slideMenuController){
        
        HomeViewController *home = [HomeViewController new];
        TratamentoViewController *tratamento = [TratamentoViewController new];
        SobreViewController *sobre = [SobreViewController new];
        AgendaViewController *agenda = [AgendaViewController new];

        
        if (indexPath.row == 1){
            UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:home];
            [self.slideMenuController setContentViewController:navController animated:YES completion:nil];
        }
        if (indexPath.row == 2){
            UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:agenda];
            [self.slideMenuController setContentViewController:navController animated:YES completion:nil];
        }
        if (indexPath.row == 3){
            UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:tratamento];
            [self.slideMenuController setContentViewController:navController animated:YES completion:nil];
        }
        if (indexPath.row == 4){
            UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:sobre];
            [self.slideMenuController setContentViewController:navController animated:YES completion:nil];
        }
        
         

	}else{
		[tableView deselectRowAtIndexPath:indexPath animated:YES];
	}
}

#pragma mark - Toggle pan gesture enabled

- (void)togglePanGestureEnabled:(UIBarButtonItem *)sender{
    
	self.slideMenuController.panGestureEnabled = !self.slideMenuController.panGestureEnabled;
	sender.title = self.slideMenuController.panGestureEnabled ? NSLocalizedString(@"Pan Enabled", nil) : NSLocalizedString(@"Pan Disabled", nil);
}

#pragma mark - Toggle slide direction

- (void)toggleSlideDirection:(UIBarButtonItem *)sender{
    
	if (self.slideMenuController.slideDirection == NVSlideMenuControllerSlideFromLeftToRight)
	{
		[self.slideMenuController setSlideDirection:NVSlideMenuControllerSlideFromRightToLeft animated:YES];
		sender.title = NSLocalizedString(@"R->L", nil);
	}
	else if (self.slideMenuController.slideDirection == NVSlideMenuControllerSlideFromRightToLeft)
	{
		[self.slideMenuController setSlideDirection:NVSlideMenuControllerSlideFromLeftToRight animated:YES];
		sender.title = NSLocalizedString(@"L->R", nil);
	}
}

@end
