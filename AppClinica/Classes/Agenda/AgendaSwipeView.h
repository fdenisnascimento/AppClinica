//
//  swipeView.h
//  Portability
//
//  Created by Denis Nascimento on 6/28/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SwipeViewAgendaDelegate <NSObject>

-(void)swipeExcluir:(int)tag;
-(void)swipefechar:(int)tag;



@end

@interface AgendaSwipeView : UIView


@property(nonatomic,assign) id<SwipeViewAgendaDelegate> delegate;


@end
