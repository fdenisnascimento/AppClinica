//
//  GalleryViewController.h
//  BODigital
//
//  Created by Denis Nascimento on 6/13/13.
//  Copyright (c) 2013 Thiago Santos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GalleryViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UIPageControl *pagecontrol;
@property (nonatomic, strong) NSArray *pageImages;
@property (nonatomic, strong) NSMutableArray *pageViews;
@property (nonatomic, strong) NSArray *items;

- (void)loadVisiblePages;
- (void)loadPage:(NSInteger)page;
- (void)purgePage:(NSInteger)page;

- (IBAction)changePage ;
- (IBAction)btActionBack:(id)sender;

@end
