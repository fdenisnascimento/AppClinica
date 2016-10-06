//
//  Constants.h
//  UOLPlacar
//
//  Created by Rafael Toshiro on 12/11/09.
//  Copyright 2009 Gol Mobile. All rights reserved.
//

#ifndef GOL_CONSTANTS
#define GOL_CONSTANTS

#define KEY_USER_INFO @"USER_INFO"
#define KEY_USE_ACTIVED @"USE_KEY"

#define KEY_USE_ACTIVED_IN_SESSION @"USE_KEY_SESSION"

#define KEY_CLIENT_INFO @"CLIENT_INFO"
#define KEY_IS_MONITORING @"ismonitorado"
#define TIME_INTERVAL 120 // TEMPO EM SEGUNDOS

#define FONTNAVBAR [UIFont fontWithName:@"Roboto-Bold" size:18]
#define FONTBOTAOINICIAL [UIFont fontWithName:@"Roboto-Medium" size:22]

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>

#define URL_HTML_ABOUT @"http://thsmobile.com.br/?page_id=1665"


/*
 
 - cores
 Search: #8f8f8f Signika Light 33px
 Lista: #5e5e5e Signika Light 40px
 Voz Masculina: Signika Regular 38px

 Titulo Navbar, Título categoria e Subcategoria :Signika Regular 42px
 
 Lista Estante Título: Signika Light 36px
 Lista Estante Preço: Signika Regular 36px
 
 */

// Desenvolvimento externo

#define IS_IPHONE5 (([[UIScreen mainScreen] bounds].size.height-568)?NO:YES)


#define fontBigDay [UIFont fontWithName:@"Archive" size:145]

#define fontMount [UIFont fontWithName:@"Prelo-Light" size:33]
#define fontChooseSign [UIFont fontWithName:@"Prelo-Light" size:15]



#define BANCA_CONTENT [[Constants libraryCacheFolder] stringByAppendingPathComponent:@"CONTENT_THS"]

#define DBFileName @"ths_app_clinica.sqlite"


#define XMLFileName @"ths_export.xml"

#define THS_CONTENT [[[Constants libraryCacheFolder] stringByAppendingPathComponent:@"CONTENT_THS"]stringByAppendingPathComponent:XMLFileName]



#define DATABASE_NAME_FILE [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:DBFileName]

#define DATABASE_NAME_FILE_ORIG [[Constants bundleFolder]  stringByAppendingPathComponent:DBFileName]

#define COPY_DATABASE_TO DATABASE_NAME_FILE

#define CACHE_TEMP_DIR [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches/tempdir"]

#define FOLDER_CONTACTCENTER [[Constants libraryCacheFolder] stringByAppendingPathComponent:@"CONTENT_CONTACTCENTER"]

#define NAME_APP @"THS Clínica"

#pragma -
#pragma ALertas

#define ALERTA_TENTE_MAIS_TARDE @"Tente mais tarde."

//#define SHOW_ALERT_CONEXAO [Constants setAlertaViewWithTitle:NAME_APP andMessage:@"Tente mais tarde." andButtonText:@"OK"]


#define SHOW_ALERT_CONEXAO [[MessageBarManager sharedInstance] showMessageWithTitle:NAME_APP description:@"Tente mais tarde." type:MessageBarMessageTypeInfo]

#define SHOW_ALERT_LOGIN_EMPTY [Constants setAlertaViewWithTitle:NAME_APP andMessage:@"Login obrigatório ." andButtonText:@"OK"]
#define SHOW_ALERT_PASS_EMPTY [Constants setAlertaViewWithTitle:NAME_APP andMessage:@"Senha obrigatória" andButtonText:@"OK"]
#define SHOW_ALERT_PHOTO_EMPTY [Constants setAlertaViewWithTitle:NAME_APP andMessage:@"insira uma foto" andButtonText:@"OK"]
#define SHOW_ALERT_ADD_USER_EMPTY [Constants setAlertaViewWithTitle:NAME_APP andMessage:@"Todos os campos são Obrigatórios" andButtonText:@"OK"]




#define PROGRESS_NOTIFICATION @"progressNotification"


#define TAG_PROGRESS  63527 

#define GOL_INTERVAL                          120
#define GOL_INTERVAL_UPDATE                    60
#define MAX_COUNTER_BOOKS                       5

// HEIGHTS

#define HEIGHT_OF_STATUS_BAR 20
#define HEIGHT_OF_TOOLBAR 44
#define HEIGHT_OF_TABLE_CELL 44
#define HEIGHT_OF_TAB_BAR 49
#define HEIGHT_OF_SEARCH_BAR 44
#define HEIGHT_OF_NAVIGATION_BAR 44
#define HEIGHT_OF_TEXTFIELD 31
#define HEIGHT_OF_PICKER 216
#define HEIGHT_OF_KEYBOARD 216
#define HEIGHT_OF_SEGMENTED_CONTROL 43
#define HEIGHT_OF_SEGMENTED_CONTROL_BAR 29
#define HEIGHT_OF_SEGMENTED_CONTROL_BEZELED 40
#define HEIGHT_OF_SWITCH 27
#define HEIGHT_OF_SLIDER 22
#define HEIGHT_OF_PROGRESS_BAR 9
#define HEIGHT_OF_PAGE_CONTROL 36
#define HEIGHT_OF_BUTTON 37

// TIME CONSTANTS

#define SECONDS_IN_MINUTE 60
#define SECONDS_IN_HOUR 3600
#define SECONDS_IN_DAY 86400
#define SECONDS_IN_WEEK 604800
#define MINUTES_IN_HOUR 60
#define HOURS_IN_DAY 24
#define DAYS_IN_WEEK 7


////MACROS
#define width(a) a.frame.size.width
#define height(a) a.frame.size.height
#define top(a) a.frame.origin.y
#define left(a) a.frame.origin.x
#define FrameReposition(a,x,y) a.frame = CGRectMake(x, y, width(a), height(a))
#define FrameResize(a,w,h) a.frame = CGRectMake(left(a), top(a), w, h)


    //RGB color macro
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define COLOR_FUNDO_CELL [UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:1.0]


// For text, messages, etc
#define DEFAULT_FONTSIZE    15
#define DEFAULT_FONT(s)     [UIFont fontWithName:@"ArialMT" size:s]
#define DEFAULT_BOLDFONT(s) [UIFont fontWithName:@"Arial-BoldMT" size:s]
#define FONT_COLOR_NUVEM    [UIColor colorWithRed:0.000 green:0.231 blue:0.345 alpha:1.0]

// For table cells
#define CELL_FONTSIZE    16
#define CELL_FONT(s)     [UIFont fontWithName:@"Helvetica-Oblique" size:s]
#define CELL_BOLDFONT(s) [UIFont fontWithName:@"Helvetica-BoldOblique" size:s]


#if DEBUG==0
#define CMLog(format, ...) NSLog(@"%s:%@", __PRETTY_FUNCTION__,[NSString stringWithFormat:format, ## __VA_ARGS__]);
#define MARK	CMLog(@"%s", __PRETTY_FUNCTION__);
#define START_TIMER NSTimeInterval start = [NSDate timeIntervalSinceReferenceDate];
#define END_TIMER(msg) 	NSTimeInterval stop = [NSDate timeIntervalSinceReferenceDate]; CMLog([NSString stringWithFormat:@"%@ Time = %f", msg, stop-start]);

#else
#define CMLog(format, ...)
#define MARK
#define START_TIMER
#define END_TIMER(msg)
#endif

typedef enum 
{
  kLoadingTypeNormal,
  kLoadingTypeNew
}LoadingType;

typedef enum 
{
  kPlistType = 0,
  kJSONType
}DataType;

typedef enum
{
    kSexyF = 0,
    kSexyM
}Sexy;



@interface Constants : NSObject
{
}


+ (Boolean)isIpad;
+ (NSString *)bundleFolder;
+ (NSString *)documentsFolder;
+ (NSString *)libraryCacheFolder;

+ (void)setAlertaViewWithTitle:(NSString*)title andMessage:(NSString*)message andButtonText:(NSString*)buttonText;



+ (BOOL)isNumeric:(NSString*)inputString;
+ (NSArray *)arrangeCopyWithString:(NSString *)searchString
                       andAllitems:(NSArray*)allItems
                           andType:(int)type;
+ (BOOL) IsValidEmail:(NSString *)checkString;
+ (BOOL) isBrasil;
+ (BOOL) isEmptyString:(NSString*)string;
+ (BOOL)validityFields:(NSArray*)fields;
+ (void)setAdmin:(BOOL)_isAdmin;
+ (BOOL)isAdmin;
+ (BOOL)isInserting;
+ (void)setInsertint:(BOOL)_inserting;
+ (void)setBadgeApplication:(NSInteger)total;
+ (NSString*)dateFromString;
+ (NSString*)OnlyDateFromString;
+(BOOL)enablePanGesture;
+(void)setEnablePanGesture:(BOOL)enabled;
+ (void)setTypeCard:(int)type;
+ (int)typeCard;
+(NSString*)typeCardNameWithType:(int)type;
+(NSString*)dateToDatabase:(NSDate*)date;
+(NSString*)getMonthFromDateTostring:(NSDate*)date;

+(NSString*)firstDateOfMonth:(NSDate *)date;
+(NSString*)lastDateOfMonth:(NSDate *)date ;

+(NSInteger)getDayFromDate:(NSDate*)date;
+(int)getMonthFromDate:(NSDate*)date;
+(int)getYearFromDate:(NSDate*)date;
+(int)GetLastDayOfMonth:(NSDate *)date;
+(NSString*)MonthNameString:(int)monthNumber;
+(NSString*)intToString:(int)value;
+(NSString*)newDateToDatabase:(NSString*)date;
+(NSString*)dateFormatedFromDate:(NSDate*)date;
+(NSString*)exportToXML;
+(void)hideKeyboardInScrolViewWithView:(UIView*)_view;
+(NSString*)dateAndTimeFormatedFromDate:(NSDate*)date;
+(NSString*)dateAndDayToDatabase:(NSDate*)date;
@end

#endif