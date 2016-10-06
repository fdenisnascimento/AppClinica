//
//  Agenda.m
//  AppClinica
//
//  Created by Denis Nascimento on 7/22/13.
//  Copyright (c) 2013 Denis Nascimento. All rights reserved.
//

#import "Agenda.h"

static Agenda *sharedInstance = nil;

@implementation Agenda

// Get the shared instance and create it if necessary.
+ (Agenda *)sharedInstance {
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
@end
