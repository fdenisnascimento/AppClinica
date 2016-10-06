//
//  AppDelegate.m
//  AppClinica
//
//  Created by Denis Nascimento on 7/19/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import "AppDelegate.h"
#import "MenuViewController.h"
#import "NVSlideMenuController.h"
#import "HomeViewController.h"


@implementation AppDelegate

+ (AppDelegate *) sharedAppDelegate {
	return (AppDelegate *) [UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self copyDatabaseIfNeeded];
    
    
    MenuViewController *menuVC = [[MenuViewController alloc] initWithStyle:UITableViewStylePlain];
	
    HomeViewController *view = [[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
    
    _navigation = [[UINavigationController alloc] initWithRootViewController:view];
    
	NVSlideMenuController *slideMenuVC = [[NVSlideMenuController alloc] initWithMenuViewController:menuVC andContentViewController:_navigation];
    
    self.window.rootViewController = slideMenuVC;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)copyDatabaseIfNeeded {
	
    
    NSFileManager *fm = [NSFileManager defaultManager];
	NSError *error;
    
    
    if ([fm copyItemAtPath:DATABASE_NAME_FILE_ORIG toPath:COPY_DATABASE_TO error:&error]){
        
        NSLog(@"Banco copiado db: %@", COPY_DATABASE_TO);
    }
    
    BOOL isDir=YES;
    
    if (![fm  fileExistsAtPath:BANCA_CONTENT isDirectory:&isDir] )
    {
        NSLog(@"Creating dir ... %@", BANCA_CONTENT);
        NSError *error = nil;
        [fm createDirectoryAtPath:BANCA_CONTENT withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) NSLog(@"Problem writing dir, ERROR: %@", [error localizedDescription]);
    }
    
}


@end
