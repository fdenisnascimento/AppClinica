//
//  swipeView.m
//  Portability
//
//  Created by Denis Nascimento on 6/28/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import "AgendaSwipeView.h"

@implementation AgendaSwipeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIImageView *bg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [bg setImage:[UIImage imageNamed:@"bg_swipe"]];
        [self addSubview:bg];
                
        UIButton *btnbio = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnbio setFrame:CGRectMake(160, 0, 160, frame.size.height)];
        //[btnbio setBackgroundImage:[UIImage imageNamed:@"ic_menssagem"] forState:UIControlStateNormal];
        [btnbio setBackgroundColor:[UIColor redColor]];
        [btnbio setTitle:@"Excluir" forState:UIControlStateNormal];
        [btnbio.titleLabel setFont:[UIFont systemFontOfSize:22]];
        [btnbio addTarget:self action:@selector(clickButtonExcluir:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnbio];
        
        UIButton *btnupdate = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnupdate setFrame:CGRectMake(0, 0, 160, frame.size.height)];
        //[btnbio setBackgroundImage:[UIImage imageNamed:@"ic_menssagem"] forState:UIControlStateNormal];
        [btnupdate setBackgroundColor:[UIColor greenColor]];
        [btnupdate setTitle:@"Fechar" forState:UIControlStateNormal];
        [btnupdate.titleLabel setFont:[UIFont systemFontOfSize:22]];
        [btnupdate addTarget:self action:@selector(clickButtonFechar:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnupdate];
        
      
        
    }
    return self;
}

-(void)clickButtonExcluir:(UIButton*)button{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(swipeExcluir:)]) {
        [self.delegate swipeExcluir:self.tag];
    }
    
}


-(void)clickButtonFechar:(UIButton*)button{
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(swipefechar:)]) {
        [self.delegate swipefechar:self.tag];
    }
    
}



@end
