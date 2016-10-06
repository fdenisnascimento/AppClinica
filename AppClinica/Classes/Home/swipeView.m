//
//  swipeView.m
//  Portability
//
//  Created by Denis Nascimento on 6/28/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import "swipeView.h"

@implementation swipeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIImageView *bg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [bg setImage:[UIImage imageNamed:@"bg_swipe"]];
        [self addSubview:bg];
        
        
        int x = 20;
      
        
        
        UIButton *btnagenda = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnagenda setFrame:CGRectMake(x, (frame.size.height/2)-15, 22, 30)];
        [btnagenda setBackgroundImage:[UIImage imageNamed:@"agenda"] forState:UIControlStateNormal];
       // [btnagenda setTitle:@"A" forState:UIControlStateNormal];
        [btnagenda addTarget:self action:@selector(clickButtonAgenda:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnagenda];
        
        x = x+84;
        
        UIButton *btnconsulta = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnconsulta setFrame:CGRectMake(x, (frame.size.height/2)-15, 22, 30)];
        [btnconsulta setBackgroundImage:[UIImage imageNamed:@"consulta"] forState:UIControlStateNormal];
        //[btnconsulta setTitle:@"C" forState:UIControlStateNormal];
        [btnconsulta addTarget:self action:@selector(clickButtonConsulta:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnconsulta];
        
        x = x+84;
        
        UIButton *btnmessage = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnmessage setFrame:CGRectMake(x, (frame.size.height/2)-10, 28, 20)];
        [btnmessage setBackgroundImage:[UIImage imageNamed:@"ic_menssagem"] forState:UIControlStateNormal];
        [btnmessage addTarget:self action:@selector(clickButtonMessage:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnmessage];
        
        x = x+84;
        
        UIButton *btnphone = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnphone setFrame:CGRectMake(x, (frame.size.height/2)-15, 22, 30)];
        [btnphone setBackgroundImage:[UIImage imageNamed:@"ic_telefone"] forState:UIControlStateNormal];
        [btnphone addTarget:self action:@selector(clickButtonPhone:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnphone];

        
    }
    return self;
}

-(void)clickButtonAgenda:(UIButton*)butonn{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(swipeAgenda:)]) {
        [self.delegate swipeAgenda:self.tag];
    }
    
}
-(void)clickButtonConsulta:(UIButton*)butonn{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(swipeConsulta:)]) {
        [self.delegate swipeConsulta:self.tag];
    }
    
}

-(void)clickButtonMessage:(UIButton*)butonn{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(swipeMessage:)]) {
        [self.delegate swipeMessage:self.tag];
    }
    
}

-(void)clickButtonPhone:(UIButton*)butonn{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(swipeTelefone:)]) {
        [self.delegate swipeTelefone:self.tag];
    }
    
}


@end
