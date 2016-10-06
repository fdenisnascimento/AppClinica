//
//  CardValue.h
//  THSCred
//
//  Created by Denis Nascimento on 7/11/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Paciente : NSObject

@property(nonatomic,retain)NSString *nome;
@property(nonatomic,retain)NSString *profissao;
@property(nonatomic,retain)NSString *nascimento;
@property(nonatomic,retain)NSString *peso;


@property(nonatomic,retain)NSString *altura;
@property(nonatomic,retain)NSString *endereco;
@property(nonatomic,retain)NSString *cep;
@property(nonatomic,retain)NSString *telefone;
@property(nonatomic,retain)NSString *celular;
@property(nonatomic,retain)NSString *cpf;
@property(nonatomic,assign)BOOL atestadoMedico;

@property(nonatomic,assign)BOOL fazCirurgia;
@property(nonatomic,retain)NSString *descCirurgia;

@property(nonatomic,assign)int refeicoes;
@property(nonatomic,assign)BOOL problemaColuna;
@property(nonatomic,assign)BOOL hipertensao;
@property(nonatomic,assign)BOOL fazAtividadeFisica;
@property(nonatomic,assign)BOOL fazDieta;
@property(nonatomic,retain)NSString *queixa;

@property(nonatomic,assign)BOOL abdome;
@property(nonatomic,assign)BOOL coxas;
@property(nonatomic,assign)BOOL laterais;
@property(nonatomic,assign)BOOL costas;
@property(nonatomic,assign)BOOL gluteo;
@property(nonatomic,assign)BOOL bracos;


+ (id)sharedInstance;
- (void)clearCardValues;
- (void)printPaciente;
@end
