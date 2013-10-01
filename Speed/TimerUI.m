//
//  TimerUI.m
//  Speed
//
//  Created by Benjamín Hernández on 25/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import "TimerUI.h"

@implementation TimerUI

@synthesize timer;

static TimerUI *sharedTimerInstance = nil;

+ (TimerUI*) sharedInstance
{
    if(!sharedTimerInstance){
        sharedTimerInstance = [[self alloc] init];
    }
    
    return sharedTimerInstance;
}

- (id) init
{
    timer = [NSTimer scheduledTimerWithTimeInterval:timeRefreshInSeconds target:self selector:@selector(timerExceeded) userInfo:nil repeats:YES];
    
    return self;
}

- (void) timerExceeded
{
    [[NSNotificationCenter defaultCenter] postNotificationName:timerNotification object:nil];
}

@end
