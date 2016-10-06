//
//  Biometrico.h
//  AppClinica
//
//  Created by Denis Nascimento on 7/19/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Biometrico : NSObject

+ (id)sharedInstance;

@property(nonatomic,retain)NSString *dataBIO;
@property(nonatomic,retain)NSString *cintura;
@property(nonatomic,retain)NSString *quadril;
@property(nonatomic,retain)NSString *coxaEsquerda;
@property(nonatomic,retain)NSString *coxaDireito;
@property(nonatomic,retain)NSString *bracoEsquerdo;
@property(nonatomic,retain)NSString *bracoDireito;
@property(nonatomic,retain)NSString *peso;
@property(nonatomic,retain)NSString *pacienteID;

@end
