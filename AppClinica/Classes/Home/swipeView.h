//
//  swipeView.h
//  Portability
//
//  Created by Denis Nascimento on 6/28/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SwipeViewDelegate <NSObject>

-(void)swipeAgenda:(int)tag;
-(void)swipeConsulta:(int)tag;
-(void)swipeMessage:(int)tag;
-(void)swipeTelefone:(int)tag;


@end

@interface swipeView : UIView


@property(nonatomic,assign) id<SwipeViewDelegate> delegate;


@end
