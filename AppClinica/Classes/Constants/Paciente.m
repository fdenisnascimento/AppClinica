//
//  CardValue.m
//  THSCred
//
//  Created by Denis Nascimento on 7/11/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import "Paciente.h"

static Paciente *sharedInstance = nil;

@implementation Paciente



// Get the shared instance and create it if necessary.
+ (Paciente *)sharedInstance {
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


-(void)clearCardValues{
    

}

-(void)printPaciente{
      
    NSLog(@"nome:%@",self.nome);
    NSLog(@"profissao:%@",self.profissao);
    NSLog(@"nascimento:%@",self.nascimento);
    NSLog(@"peso:%@",self.peso);
    NSLog(@"altura:%@",self.altura);
    NSLog(@"endereco:%@",self.endereco);
    NSLog(@"cep:%@",self.cep);
    NSLog(@"telefone:%@",self.telefone);
    NSLog(@"celular:%@",self.celular);
    NSLog(@"cpf:%@",self.cpf);
    NSLog(@"atestadoMedico:%d",self.atestadoMedico);
    NSLog(@"fazCirurgia:%d",self.fazCirurgia);
    NSLog(@"descCirurgia:%@",self.descCirurgia);
    NSLog(@"refeicoes:%d",self.refeicoes);
    NSLog(@"problemaColuna:%d",self.problemaColuna);
    NSLog(@"hipertensao:%d",self.hipertensao);
    NSLog(@"fazAtividadeFisica:%d",self.fazAtividadeFisica);
    NSLog(@"fazDieta:%d",self.fazDieta);
    NSLog(@"abdome:%d",self.abdome);
    NSLog(@"coxas:%d",self.coxas);
    NSLog(@"laterais:%d",self.laterais);
    NSLog(@"costas:%d",self.costas);
    NSLog(@"gluteo:%d",self.gluteo);
    NSLog(@"bracos:%d",self.bracos);
    NSLog(@"queixa:%@",self.queixa);

}

@end
