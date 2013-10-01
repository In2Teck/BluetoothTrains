//
//  TimerUI.h
//  Speed
//
//  Created by Benjamín Hernández on 25/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#define timeRefreshInSeconds 2
#define timerNotification @"timerNotification"

#import <UIKit/UIKit.h>

@interface TimerUI : NSObject
{
    NSTimer *timer;
}

@property (strong, nonatomic) NSTimer *timer;

+ (TimerUI*) sharedInstance;
- (void) timerExceeded;

@end