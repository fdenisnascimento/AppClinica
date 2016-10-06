//
//  Agenda.h
//  AppClinica
//
//  Created by Denis Nascimento on 7/22/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Agenda : NSObject

+(id)sharedInstance;

@property(nonatomic,retain)NSString *data_agenda;
@property(nonatomic,retain)NSString *pacienteID;
@property(nonatomic,retain)NSString *tratamentoID;
@property(nonatomic,retain)NSString *local;
@property(nonatomic,retain)NSString *observacao;
@property(nonatomic,retain)NSString *status;

@end
