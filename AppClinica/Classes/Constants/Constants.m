//---------------------------------------------------------------------------
//
//  Constants.m
//
//
//  Created by Rafael Toshiro on 7/22/09.
//  Copyright 2009 Gol Mobile. All rights reserved.
//
//---------------------------------------------------------------------------

#import "Constants.h"
//---------------------------------------------------------------------------



static NSString *BUNDLE_FOLDER = nil;
static NSString *DOCUMENTS_FOLDER = nil;
static NSString *LIBRARY_CACHE_FOLDER = nil;

static BOOL  ISADMIN = NO;
static BOOL  ISINSERTING = NO;

static BOOL  ENABLEDPANGETURE = NO;
static int TYPE_CARD = 0;

//---------------------------------------------------------------------------
// classe Constants
//---------------------------------------------------------------------------

@implementation Constants

+(NSString*)typeCardNameWithType:(int)type{
   
    switch (type) {
        case 1:
        {
            return NSLocalizedString(@"com.thssolution.finance.label.debit", nil);
            break;
        }
        case 2:
        {
            return NSLocalizedString(@"com.thssolution.finance.label.credit", nil);
            break;
        }
        case 3:
        {
            return NSLocalizedString(@"com.thssolution.finance.label.others", nil);
            break;
        }
        default:
            break; 
    }
    return @"";
}


+ (void)setTypeCard:(int)type
{
    TYPE_CARD = type;
}

+(int)typeCard{
    
    return TYPE_CARD;
}


+(BOOL)enablePanGesture{
    
    return  ENABLEDPANGETURE;
}

+(void)setEnablePanGesture:(BOOL)enabled{
    
    ENABLEDPANGETURE = enabled;
}


//---------------------------------------------------------------------------

+ (Boolean)isIpad
{
#ifdef UI_USER_INTERFACE_IDIOM
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
#endif
    return NO;
}
//---------------------------------------------------------------------------

+ (NSString *)documentsFolder
{
    if (!DOCUMENTS_FOLDER)
        DOCUMENTS_FOLDER = [self libraryCacheFolder];// [[NSString alloc] initWithString:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]];
    return DOCUMENTS_FOLDER;
}
//---------------------------------------------------------------------------


+ (BOOL)isInserting{
    
    return  ISINSERTING;
}

+ (void)setInsertint:(BOOL)_inserting
{
    ISINSERTING = _inserting;
}

+ (void)setAdmin:(BOOL)_isAdmin
{
    ISADMIN = _isAdmin;
}

+(BOOL)isAdmin{
    
    return ISADMIN;
}

//---------------------------------------------------------------------------


+ (NSString *)libraryCacheFolder
{
    if (!LIBRARY_CACHE_FOLDER)
        LIBRARY_CACHE_FOLDER = [[NSString alloc] initWithString:[NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"]];
    return LIBRARY_CACHE_FOLDER;
}
//---------------------------------------------------------------------------

+ (NSString *)bundleFolder
{
    if (!BUNDLE_FOLDER)
        BUNDLE_FOLDER = [[NSString alloc] initWithString:[[NSBundle mainBundle] resourcePath]];
    return BUNDLE_FOLDER;
}
//---------------------------------------------------------------------------


+ (void)setAlertaViewWithTitle:(NSString*)title andMessage:(NSString*)message andButtonText:(NSString*)buttonText{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:buttonText otherButtonTitles:nil, nil];
    [alert show];
   
    
}
//---------------------------------------------------------------------------

+ (BOOL)isNumeric:(NSString*)inputString
{
    BOOL isValid = NO;
    NSCharacterSet *alphaNumbersSet = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *stringSet = [NSCharacterSet characterSetWithCharactersInString:inputString];
    isValid = [alphaNumbersSet isSupersetOfSet:stringSet];
    return isValid;
}




+ (NSArray *)arrangeCopyWithString:(NSString *)searchString
                       andAllitems:(NSArray*)allItems
                           andType:(int)type
{
    
    // type = 0 : message, 1 categoria, 2 subcatwgoria
    NSMutableArray *filteredObjects = [NSMutableArray arrayWithCapacity:[allItems count]];
    
    NSEnumerator *enumerator = [allItems objectEnumerator];
    
    id item;
    while ((item = [enumerator nextObject])) {
        
        NSString *filename;
        
        switch (type) {
            case 0:
                filename = [item valueForKey:@"categories_description"];
                break;
            case 1:
                filename = [item valueForKey:@"subcategories_description"];
                break;
            case 2:
                filename = [item valueForKey:@"messages_id"];
                break;
            case 3:
                filename = [item valueForKey:@"name"];
                break;
                
            default:
                break;
        }
        


        NSRange range;
        range = [filename rangeOfString:searchString  options: NSDiacriticInsensitiveSearch | NSCaseInsensitiveSearch];
        
        if (range.location != NSNotFound) {
            [filteredObjects addObject: item];
            
        }
    }
    
    return  filteredObjects;
    
    
   
}

+(BOOL) IsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}



+(BOOL)isBrasil{
    
    NSLocale *locale = [NSLocale currentLocale];
    
    NSString *language = [locale displayNameForKey:NSLocaleIdentifier
                                             value:[locale localeIdentifier]];
    

    if ([[language uppercaseString] rangeOfString:@"BRASIL"].location == NSNotFound) {
        NSLog(@"string does not contain bla");
        return NO;
    } else {
        NSLog(@"string contains bla!");
       return YES;
    }
    
   // return NO;
}


+ (BOOL) isEmptyString:(NSString*)string{
    return ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]length] == 0);
}


+(BOOL)validityFields:(NSArray*)fields{
    
    BOOL ret = true;
    
    for (int i = 0; i < [fields count];i++) {
        
        UITextField *text = ((UITextField*)[fields objectAtIndex:i]);
        if (text.text.length == 0) {
            ret = false;
            break;
        }
        
    }
    return ret;
}

+ (void)setBadgeApplication:(NSInteger)total{
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:total];
}

+(NSString*)dateToDatabase:(NSDate*)date{
    
    NSString *MyString;
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"yyyy-MM-dd"];
    MyString = [dateFormatter stringFromDate:date];
    return MyString;
    
}

+(NSString*)dateAndDayToDatabase:(NSDate*)date{
    
    NSString *MyString;
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    MyString = [dateFormatter stringFromDate:date];
    return MyString;
    
}

+(NSString*)dateFromString{
    
    NSString *MyString;
	NSDate *now = [NSDate date];
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    MyString = [dateFormatter stringFromDate:now];
    return MyString;
    
}

+(NSString*)OnlyDateFromString{
    
    NSString *MyString;
	NSDate *now = [NSDate date];
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"dd/MM/yyyy"];
    MyString = [dateFormatter stringFromDate:now];
    return MyString;
    
}

+(NSString*)dateFormatedFromDate:(NSDate*)date{
    
    NSString *MyString;
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"dd/MM/yyyy"];
    MyString = [dateFormatter stringFromDate:date];
    return MyString;
    
}

+(NSString*)dateAndTimeFormatedFromDate:(NSDate*)date{
    
    NSString *MyString;
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    MyString = [dateFormatter stringFromDate:date];
    return MyString;
    
}


+(NSString*)firstDateOfMonth:(NSDate *)date {
    
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    
    NSDate * firstDateOfMonth = [self returnDateForMonth:comps.month year:comps.year day:1];
    NSDate * lastDateOfMonth = [self returnDateForMonth:comps.month+1 year:comps.year day:0];
    
    NSLog(@"date %@", date);              // date 2013-06-20
    NSLog(@"First %@", firstDateOfMonth); // firstDateOfMonth 2013-06-01
    NSLog(@"Last %@", lastDateOfMonth);   // lastDateOfMonth  2013-06-30
    return [self dateToDatabase:firstDateOfMonth];
    
}




+(NSString*)lastDateOfMonth:(NSDate *)date {
    
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    
    NSDate * firstDateOfMonth = [self returnDateForMonth:comps.month year:comps.year day:1];
    NSDate * lastDateOfMonth = [self returnDateForMonth:comps.month+1 year:comps.year day:0];
    
    NSLog(@"date %@", date);              // date 2013-06-20
    NSLog(@"First %@", firstDateOfMonth); // firstDateOfMonth 2013-06-01
    NSLog(@"Last %@", lastDateOfMonth);   // lastDateOfMonth  2013-06-30
    return [self dateToDatabase:lastDateOfMonth];
    
}

+ (NSDate *)returnDateForMonth:(NSInteger)month year:(NSInteger)year day:(NSInteger)day {
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    [components setDay:day];
    [components setMonth:month];
    [components setYear:year];
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    return [gregorian dateFromComponents:components];
}


+(NSString*)getMonthFromDateTostring:(NSDate*)date{
    
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    

    if (comps.month <10) {
        return  [NSString stringWithFormat:@"0%d",comps.month];
    }else{
        return [NSString stringWithFormat:@"%d",comps.month];
    }


}


+(NSInteger)getDayFromDate:(NSDate*)date{
    
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned unitFlags = NSDayCalendarUnit;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];

    return  comps.day+1;
  
}

+(int)getMonthFromDate:(NSDate*)date{
    
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned unitFlags =  NSMonthCalendarUnit;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];

        return comps.month;
    
    
    
}


+(int)getYearFromDate:(NSDate*)date{
    
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned unitFlags = NSYearCalendarUnit;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    
    return  comps.year;
      
}


+(int)GetLastDayOfMonth:(NSDate *)date
{
    int last_day = 27;
    NSCalendar *cal=[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *compsMonth = [cal components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:date];
    [compsMonth setDay:last_day];
    int month = [compsMonth month];
    while(TRUE){
        [compsMonth setDay:last_day+1];
        NSDate *dateFuture = [cal dateFromComponents:compsMonth];
        NSDateComponents *futureComps = [cal components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:dateFuture];
        if(month != [futureComps month]){
            return last_day;
        }
        last_day+=1;
    }
    return last_day;
}

+(NSString*)MonthNameString:(int)monthNumber
{
    NSDateFormatter *formate = [NSDateFormatter new];
    
    NSArray *monthNames = [formate standaloneMonthSymbols];
    
    NSString *monthName = [monthNames objectAtIndex:(monthNumber - 1)];
    
    return monthName;
}

+(NSString*)intToString:(int)value{
    
    return [NSString stringWithFormat:@"%d",value];
}


+(NSString*)newDateToDatabase:(NSString*)date{
    
    NSArray * tmp = [date componentsSeparatedByString:@"/"];
    return [NSString stringWithFormat:@"%@-%@-%@",[tmp objectAtIndex:2],[tmp objectAtIndex:1],[tmp objectAtIndex:0]];
}

+(void)hideKeyboardInScrolViewWithView:(UIView*)_view{
    
    for (UIView *view in _view.subviews) {
        if ([view isKindOfClass:[UIScrollView class]]) {
            for (UIView *v in view.subviews) {
                if ([v isKindOfClass:[UITextField class]]) {
                    UIButton *bt = (UIButton*)view;
                    [bt resignFirstResponder];
                }
            }
        }
        
    }
}


+(NSString*)exportToXML{
    
    NSMutableString *strMute = [NSMutableString stringWithString:@"<?xml version=\"1.0\" encoding=\"UTF-8\"?>"];
    [strMute appendString:@"<purchases>"];
    
//    NSArray *tmp = [[Database sharedInstance]getPurchases];
//    
//    for (NSDictionary *item in tmp) {
//        
//        [strMute appendString:@"<item>"];
//                [strMute appendFormat:@"<id>%@</id>",[item valueForKey:@"id"]];
//                [strMute appendFormat:@"<price>%@</price>",[item valueForKey:@"price"]];
//                [strMute appendFormat:@"<date>%@</date>",[item valueForKey:@"regdate"]];
//                [strMute appendFormat:@"<cost_center>%@</cost_center>",[item valueForKey:@"centro"]];
//                [strMute appendFormat:@"<expense>%@</expense>",[item valueForKey:@"expense"]];
//                [strMute appendFormat:@"<card_name>%@</card_name>",[item valueForKey:@"payment"]];
//                [strMute appendFormat:@"<qty>%@</qty>",[item valueForKey:@"qty"]];
//        [strMute appendString:@"</item>"];
//    }
//    [strMute appendString:@"</purchases>"];
//    
//    if (![[NSFileManager defaultManager]fileExistsAtPath:THS_CONTENT]) {
//        [strMute writeToFile:THS_CONTENT atomically:YES encoding:NSUTF8StringEncoding error:nil];
//    }else{
//        [[NSFileManager defaultManager]removeItemAtPath:THS_CONTENT error:nil];
//        [strMute writeToFile:THS_CONTENT atomically:YES encoding:NSUTF8StringEncoding error:nil];
//    }
//    


    return strMute;
}

+(BOOL)validaCPF:(NSString *)cpf{


//    if ([self isEmptyString:cpf]) {
//        return NO;
//    }
//    
////    // Elimina possivel mascara
////    $cpf = ereg_replace('[^0-9]', '', $cpf);
////    $cpf = str_pad($cpf, 11, '0', STR_PAD_LEFT);
////    
////    // Verifica se o numero de digitos informados é igual a 11
//    if ([cpf length] != 11) {
//        return NO;
//    }
//
//    
//        for (int t = 9; t < 11; t++) {
//            
//            for (int d = 0, int c = 0; c < t; c ++) {
//                d += cpf[c] * ((t + 1) - c);
//            }
//            d = ((10 * d) % 11) % 10;
//            if (cpf[c] != d) {
//                return NO;
//            }
//        }
    
        return true;
    
}


//---------------------------------------------------------------------------

@end
//---------------------------------------------------------------------------
