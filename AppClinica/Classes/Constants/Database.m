//
//  Titles.m
//  BancaGol
//
//  Created by Denis on 9/1/11.
//  Copyright 2011 GolMobile. All rights reserved.
//

#import "Database.h"

#define MSG_REGISTRO_SALVO @"Registro salvo"
#define MSG_REGISTRO_EXCLUIDO @"Registro excluído"
#define MSG_REGISTRO_ERRO @"Erro salvando registro"

static Database *sharedInstance = nil;

@implementation Database

// Get the shared instance and create it if necessary.
+ (Database *)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    
    return sharedInstance;
}


// We can still have a regular init method, that will get called the first time the Singleton is used.
- (id)init
{
    self = [super init];
    
    if (self) {
        // Work your initialising magic here as you normally would
    }
    
    return self;
}

-(BOOL)eraseAllData{
    
    return YES;
}



-(NSString*)insertAgenda:(Agenda*)agenda{
    
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO agenda (data_agenda,paciente_id,tratamento_id,local,observacao,status,regdate) values('%@','%@','%@','%@','%@','%@','%@')",
                     agenda.data_agenda,
                     agenda.pacienteID,
                     agenda.tratamentoID
                     ,agenda.local,
                     agenda.observacao,
                     agenda.status,
                     [Constants dateToDatabase:[NSDate date]]
                     ];
    
    
    if ([[DBHandler shared]runSQL:sql]){
        return MSG_REGISTRO_SALVO;
    }else{
        return MSG_REGISTRO_ERRO;
    }

    
    
}


-(NSString*)insertPaciente:(Paciente*)paciente{
    
    NSString *sql = 
        sql = [NSString stringWithFormat:@"INSERT INTO paciente (nome,profissao,nascimento,peso,altura,endereco,cep,telefone,celular,cpf,atestado_medico,fazCirurgia,descCirurgia,refeicoes,problema_coluna,hipertensao,faz_atividade_fisica,faz_dieta,queixa,abdome,coxas,laterais,costas,gluteo,bracos,redate,status) VALUES ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@',%d,%d,'%@',%d,%d,%d,%d,%d,'%@',%d,%d,%d,%d,%d,%d,'%@','%@')",
              paciente.nome,
               paciente.profissao,
               paciente.nascimento,
               paciente.peso,
               paciente.altura,
               paciente.endereco,
               paciente.cep,
               paciente.telefone,
               paciente.celular,
               paciente.cpf,
               paciente.atestadoMedico,
               paciente.fazCirurgia,
               paciente.descCirurgia,
               paciente.refeicoes,
               paciente.problemaColuna,
               paciente.hipertensao,
               paciente.fazAtividadeFisica,
               paciente.fazDieta,
               paciente.queixa,
               paciente.abdome,
               paciente.coxas,
               paciente.laterais,
               paciente.costas,
               paciente.gluteo,
               paciente.bracos,
               [Constants dateToDatabase:[NSDate date]],
               @"A"
               ];
       
    
    if ([[DBHandler shared]runSQL:sql]){
        return MSG_REGISTRO_SALVO;
    }else{
        return MSG_REGISTRO_ERRO;
    }

    
}
-(NSString*)insertConsulta:(Consulta*)consulta{
    
   int  _namephoto  =  (int)CFAbsoluteTimeGetCurrent();
    
    NSString *image1;
    NSString *image2;
    NSString *image3;
    NSString *image4;
    NSString *image5;
    NSString *image6;


    if (consulta.image1) {
        image1 = [NSString stringWithFormat:@"%d_1",_namephoto];
    }else{
        image1 = @"";
    }

    if (consulta.image2) {
        image2 = [NSString stringWithFormat:@"%d_2",_namephoto];
    }else{
        image2 = @"";
    }

    if (consulta.image3) {
        image3 = [NSString stringWithFormat:@"%d_3",_namephoto];
    }else{
        image3 = @"";
    }

    if (consulta.image4) {
        image4 = [NSString stringWithFormat:@"%d_4",_namephoto];
    }else{
        image4 = @"";
    }

    if (consulta.image5) {
        image5 = [NSString stringWithFormat:@"%d_5",_namephoto];
    }else{
        image5 = @"";
    }
    if (consulta.image6) {
        image6 = [NSString stringWithFormat:@"%d_6",_namephoto];
    }else{
        image6 = @"";
    }

    
   
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO consulta (data_consulta,paciente_id,tratamento_id,observacao,image1,image2,image3,image4,image5,image6,regdate)values ('%@','%@','%@','%@','%@','%@','%@','%@','%@','%@','%@')",
           consulta.dataConsulta,
           consulta.pacienteID,
           consulta.tratamentoID,
           consulta.observacao,
           image1,
           image2,
           image3,
           image4,
           image5,
           image6,
           [Constants dateToDatabase:[NSDate date]]
           ];
    
    
    
    if ([[DBHandler shared]runSQL:sql]){
        
        if (consulta.image1) {
            [self saveImageWithName:image1 andImage:consulta.image1];
        }
        
        if (consulta.image2) {
            [self saveImageWithName:image2 andImage:consulta.image2];
        }
        
        if (consulta.image3) {
            [self saveImageWithName:image3 andImage:consulta.image3];
        }
        
        if (consulta.image4) {
            [self saveImageWithName:image4 andImage:consulta.image4];
        }
        
        if (consulta.image5) {
            [self saveImageWithName:image5 andImage:consulta.image5];
        }
        if (consulta.image6) {
         [self saveImageWithName:image6 andImage:consulta.image6];
        }

        
        
        return MSG_REGISTRO_SALVO;
    }else{
        return MSG_REGISTRO_ERRO;
    }
    
}
-(NSString*)insertBIO:(Biometrico*)biometrico{
    
    
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO biometrico (data_bio,cintura,quadril,coxa_esquerda,coxa_direita,braco_esquerdo,braco_direito,peso,paciente_id)values('%@','%@','%@','%@','%@','%@','%@','%@','%@')",
           biometrico.dataBIO,
           biometrico.cintura,
           biometrico.quadril,
           biometrico.coxaEsquerda,
           biometrico.coxaDireito,
           biometrico.bracoEsquerdo,
           biometrico.bracoDireito,
           biometrico.peso,
           biometrico.pacienteID          
           ];
    
    
    if ([[DBHandler shared]runSQL:sql]){
        return MSG_REGISTRO_SALVO;
    }else{
        return MSG_REGISTRO_ERRO;
    }
    
}
-(NSString*)insertTratamentoWithName:(NSString*)name{
    
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO tratamento (nome)values ( '%@')",name];

    if ([[DBHandler shared]runSQL:sql]){
        return MSG_REGISTRO_SALVO;
    }else{
        return MSG_REGISTRO_ERRO;
    }

    
}



-(NSDictionary*)getPacienteWithPacienteID:(int)pacineteID{
    
    NSDictionary *tmp;
    
    NSString *sql = [NSString stringWithFormat:@"select id,nome,profissao,nascimento,peso,altura,endereco,cep,telefone,celular,cpf,atestado_medico,fazCirurgia,descCirurgia,refeicoes,problema_coluna,hipertensao,faz_atividade_fisica,faz_dieta,queixa,abdome,coxas,laterais,costas,gluteo,bracos,redate,status from paciente where id = %d ",pacineteID];
    
    sqlite3_stmt *consult = [[DBHandler shared]runSQL:sql];
    
    if( sqlite3_step(consult) == SQLITE_ROW ){
        
        tmp = [NSDictionary dictionaryWithObjectsAndKeys:
               [NSNumber numberWithInt:sqlite3_column_int(consult, 0)],@"id",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 1)],@"nome",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 2)],@"profissao",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 3)],@"nascimento",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 4)],@"peso",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 5)],@"altura",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 6)],@"endereco",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 7)],@"cep",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 8)],@"telefone",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 9)],@"celular",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 10)],@"cpf",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 11)],@"atestado_medico",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 12)],@"fazCirurgia",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 13)],@"descCirurgia",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 14)],@"refeicoes",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 15)],@"problema_coluna",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 16)],@"hipertensao",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 17)],@"faz_atividade_fisica",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 18)],@"faz_dieta",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 19)],@"queixa",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 20)],@"abdome",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 21)],@"coxas",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 22)],@"laterais",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 23)],@"costas",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 24)],@"gluteo",
               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 25)],@"bracos",
               nil];
        
    }
    
    sqlite3_finalize(consult);
    return tmp;
    
}

-(NSArray*)getPacientes{
    
    NSMutableArray *result = [NSMutableArray array];
    
    NSString *sql = @"select  paciente.id,nome,profissao,nascimento,peso,altura,endereco,cep,telefone,celular,cpf,atestado_medico,fazCirurgia,descCirurgia,refeicoes,problema_coluna,hipertensao,faz_atividade_fisica,faz_dieta,queixa,abdome,coxas,laterais,costas,gluteo,bracos,redate,paciente.status,strftime('%d/%m/%Y às %H:%M', consulta.data_consulta) data_consulta,strftime('%d/%m/%Y às %H:%M', agenda.data_agenda ) as data_agenda  from paciente left join consulta on paciente.id = consulta.paciente_id  left join agenda on agenda.paciente_id = paciente.id  group by paciente.id";
    
    
    sqlite3_stmt *consult = [[DBHandler shared]runSQL:sql];
    
    while (sqlite3_step(consult)==SQLITE_ROW)
    {
        NSDictionary *tmp =  [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithInt:sqlite3_column_int(consult, 0)],@"id",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 1)],@"nome",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 2)],@"profissao",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 3)],@"nascimento",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 4)],@"peso",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 5)],@"altura",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 6)],@"endereco",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 7)],@"cep",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 8)],@"telefone",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 9)],@"celular",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 10)],@"cpf",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 11)],@"atestado_medico",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 12)],@"fazCirurgia",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 13)],@"descCirurgia",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 14)],@"refeicoes",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 15)],@"problema_coluna",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 16)],@"hipertensao",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 17)],@"faz_atividade_fisica",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 18)],@"faz_dieta",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 19)],@"queixa",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 20)],@"abdome",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 21)],@"coxas",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 22)],@"laterais",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 23)],@"costas",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 24)],@"gluteo",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 25)],@"bracos",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 28)],@"ultima_consulta",
                               [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 29)],@"proxima_consulta",
                              nil];
        
        [result addObject:tmp];
    }
    
    
    sqlite3_finalize(consult);
    return (NSArray*)result;
    
}

-(NSArray*)getTratamentos{
    
    NSMutableArray *result = [NSMutableArray array];
    
    NSString *sql = @"select id,nome from tratamento ";
    
    
    sqlite3_stmt *consult = [[DBHandler shared]runSQL:sql];
    
    while (sqlite3_step(consult)==SQLITE_ROW)
    {
        NSDictionary *tmp =  [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithInt:sqlite3_column_int(consult, 0)],@"id",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 1)],@"nome",
                           nil];
        
        [result addObject:tmp];
    }
    
    
    sqlite3_finalize(consult);
    return (NSArray*)result;
    
}

-(NSArray*)getConsultaWithPacienteID:(int)pacineteID{

    NSMutableArray *result = [NSMutableArray array];
    
    NSString *sql =@"select  consulta.id,strftime('%d/%m/%Y %H:%M', consulta.data_consulta ) as data_agenda,tratamento.nome,observacao,image1,image2,image3,image4,image5,image6 from consulta  join tratamento on tratamento.id = consulta.tratamento_id where paciente_id = {0}";
    
    sql = [sql stringByReplacingOccurrencesOfString:@"{0}" withString:[NSString stringWithFormat:@"%d",pacineteID]];
    
    
    sqlite3_stmt *consult = [[DBHandler shared]runSQL:sql];
    
    while (sqlite3_step(consult)==SQLITE_ROW)
    {
        NSDictionary *tmp =  [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithInt:sqlite3_column_int(consult, 0)],@"id",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 1)],@"data_consulta",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 2)],@"tratamento",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 3)],@"observacao",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 4)],@"image1",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 5)],@"image2",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 6)],@"image3",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 7)],@"image4",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 8)],@"image5",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 9)],@"image6",
                              nil];
        
        [result addObject:tmp];
    }
    
    
    sqlite3_finalize(consult);
    return (NSArray*)result;
    
}

-(NSArray*)getBiometricoWithPacienteID:(int)pacineteID{
    
    NSMutableArray *result = [NSMutableArray array];
    
    NSString *sql = @"select id,strftime('%d/%m/%Y %H:%M', biometrico.data_bio ) as data_bio,cintura,quadril,coxa_esquerda,coxa_direita,braco_esquerdo,braco_direito,peso,paciente_id from biometrico where paciente_id = {0}";
    
     sql = [sql stringByReplacingOccurrencesOfString:@"{0}" withString:[NSString stringWithFormat:@"%d",pacineteID]];
    
    
    sqlite3_stmt *consult = [[DBHandler shared]runSQL:sql];
    
    while (sqlite3_step(consult)==SQLITE_ROW)
    {
        NSDictionary *tmp =  [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithInt:sqlite3_column_int(consult, 0)],@"id",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 1)],@"data_consulta",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 2)],@"cintura",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 3)],@"quadril",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 4)],@"coxa_esquerda",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 5)],@"coxa_direita",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 6)],@"braco_esquerdo",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 7)],@"braco_direito",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 8)],@"peso",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 9)],@"paciente_id",
                              nil];
        
        [result addObject:tmp];
    }
    
    
    sqlite3_finalize(consult);
    return (NSArray*)result;
    
}

-(NSArray*)getAgendaWithDate:(NSString*)date{
    
    NSMutableArray *result = [NSMutableArray array];
    
    NSString *sql = @"select agenda.id,strftime('%H:%M',  data_agenda) as data_agenda,paciente_id,tratamento_id,local,observacao,agenda.status,regdate,paciente.nome as paciente,tratamento.nome as tratamento    from agenda    join paciente on paciente.id = agenda.paciente_id    join tratamento on tratamento.id = agenda.tratamento_id    where DATE(data_agenda) = '{0}'    group by agenda.id order by agenda.id ";
    
    sql = [sql stringByReplacingOccurrencesOfString:@"{0}" withString:date];
    
    
    sqlite3_stmt *consult = [[DBHandler shared]runSQL:sql];
    
    while (sqlite3_step(consult)==SQLITE_ROW)
    {
        NSDictionary *tmp =  [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithInt:sqlite3_column_int(consult, 0)],@"id",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 1)],@"data_agenda",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 2)],@"paciente_id",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 3)],@"tratamento_id",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 4)],@"local",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 5)],@"observacao",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 6)],@"status",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 7)],@"regdate",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 8)],@"paciente",
                              [DBHandler cStringToOBJC:(const char *)sqlite3_column_text(consult, 9)],@"tratamento",
                              nil];
        
        [result addObject:tmp];
    }
    
    
    sqlite3_finalize(consult);
    return (NSArray*)result;
    
}


-(NSString*)updateAgendaWithID:(NSString*)agendaID andStatus:(NSString*)status{
    
    NSString *sql = [NSString stringWithFormat:@"update agenda set status = '%@' where id = %@",status ,agendaID];
    
    if ([[DBHandler shared]runSQL:sql]){
        return MSG_REGISTRO_SALVO;
    }else{
        return MSG_REGISTRO_ERRO;
    }
}

-(NSString*)deleteAgendaWithID:(NSString*)agendaID{
    
    NSString *sql = [NSString stringWithFormat:@"delete from agenda  where id = %@",agendaID];
    
    if ([[DBHandler shared]runSQL:sql]){
        return MSG_REGISTRO_EXCLUIDO;
    }else{
        return MSG_REGISTRO_ERRO;
    }
    
}


-(NSString*)deleteTratamentoWithID:(NSString*)tratamentoID{
  
  NSString *sql = [NSString stringWithFormat:@"delete from tratamento  where id = %@",tratamentoID];
  
  if ([[DBHandler shared]runSQL:sql]){
    return MSG_REGISTRO_EXCLUIDO;
  }else{
    return MSG_REGISTRO_ERRO;
  }
  
}

- (void)saveImageWithName:(NSString*)name andImage:(UIImage*)image{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *savedImagePath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png",name]];
    NSData *imageData = UIImagePNGRepresentation(image);
    [imageData writeToFile:savedImagePath atomically:NO];
}

@end
