//
//  Titles.h
//  BancaGol
//
//  Created by Denis on 9/1/11.
//  Copyright 2011 GolMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBHandler.h"
#import "Consulta.h"
#import "Biometrico.h"
#import "Agenda.h"

@interface Database : NSObject 

+ (id)sharedInstance;

-(BOOL)eraseAllData;

-(NSString*)insertPaciente:(Paciente*)paciente;
-(NSString*)insertConsulta:(Consulta*)consulta;
-(NSString*)insertBIO:(Biometrico*)bimetrico;
-(NSString*)insertAgenda:(Agenda*)agenda;
-(NSString*)insertTratamentoWithName:(NSString*)name;

-(NSArray*)getPacientes;
-(NSArray*)getTratamentos;
-(NSArray*)getConsultaWithPacienteID:(int)pacineteID;
-(NSArray*)getBiometricoWithPacienteID:(int)pacineteID;
-(NSDictionary*)getPacienteWithPacienteID:(int)pacineteID;
-(NSArray*)getAgendaWithDate:(NSString*)date;


-(NSString*)updateAgendaWithID:(NSString*)agendaID andStatus:(NSString*)status;
-(NSString*)deleteAgendaWithID:(NSString*)agendaID;
-(NSString*)deleteTratamentoWithID:(NSString*)tratamentoID;

@end
