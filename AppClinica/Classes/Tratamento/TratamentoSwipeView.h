//
//  swipeView.h
//  Portability
//
//  Created by Denis Nascimento on 6/28/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SwipeViewDelegate <NSObject>

-(void)swipeExcluir:(int)tag;



@end

@interface TratamentoSwipeView : UIView


@property(nonatomic,assign) id<SwipeViewDelegate> delegate;


@end
