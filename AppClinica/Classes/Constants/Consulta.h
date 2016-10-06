//
//  Consulta.h
//  AppClinica
//
//  Created by Denis Nascimento on 7/19/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Consulta : NSObject

+(id)sharedInstance;

@property(nonatomic,retain)NSString *dataConsulta;
@property(nonatomic,retain)NSString *pacienteID;
@property(nonatomic,retain)NSString *tratamentoID;
@property(nonatomic,retain)NSString *observacao;
@property(nonatomic,retain)UIImage *image1;
@property(nonatomic,retain)UIImage *image2;
@property(nonatomic,retain)UIImage *image3;
@property(nonatomic,retain)UIImage *image4;
@property(nonatomic,retain)UIImage *image5;
@property(nonatomic,retain)UIImage *image6;


@end
