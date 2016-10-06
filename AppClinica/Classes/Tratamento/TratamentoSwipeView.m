//
//  swipeView.m
//  Portability
//
//  Created by Denis Nascimento on 6/28/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import "TratamentoSwipeView.h"

@implementation TratamentoSwipeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIImageView *bg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [bg setImage:[UIImage imageNamed:@"bg_swipe"]];
        [self addSubview:bg];
        
        
        int x = 320-60;
      
        
        
        UIButton *btnbio = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnbio setFrame:CGRectMake(x, (frame.size.height/2)-10, 28, 20)];
        //[btnbio setBackgroundImage:[UIImage imageNamed:@"ic_menssagem"] forState:UIControlStateNormal];
        [btnbio setTitle:@"X" forState:UIControlStateNormal];
        [btnbio.titleLabel setFont:[UIFont systemFontOfSize:20]];
        [btnbio addTarget:self action:@selector(clickButtonBio:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnbio];
        
      
        
    }
    return self;
}

-(void)clickButtonBio:(UIButton*)button{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(swipeExcluir::)]) {
        [self.delegate swipeExcluir:self.tag];
    }
    
}



@end
