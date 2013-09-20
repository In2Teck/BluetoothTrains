//
//  DataHandling.m
//  Speed
//
//  Created by Benjamín Hernández on 18/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import "DataHandling.h"

@implementation DataHandling

@synthesize tableData;
@synthesize paths;
@synthesize stringsPlistPath;

static DataHandling *sharedDataInstance = nil;

+ (DataHandling*) sharedInstance
{
    if(!sharedDataInstance){
        sharedDataInstance = [[self alloc] init];
    }
    
    return sharedDataInstance;
}

- (id) init
{
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    stringsPlistPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"train.plist"];
    [self loadTextFile];
    
    return self;
}

-(void) dealloc{
    paths = nil;
    stringsPlistPath = nil;
    tableData = nil;
}

- (void)loadTextFile
{    
    
    tableData = [NSMutableArray arrayWithContentsOfFile:stringsPlistPath];
    
    if ([tableData count] == 0){
        tableData = [[NSMutableArray alloc] init];
    }
}

- (BOOL) addTrain:(NSMutableArray *)train
{
    [tableData addObject: train];
    [tableData writeToFile:stringsPlistPath atomically: YES];

    return YES;
}

- (BOOL) removeTrainAtIndex:(NSUInteger) index{
    @try{
        [tableData removeObjectAtIndex: index];
        [tableData writeToFile:stringsPlistPath atomically: YES];
        return YES;
    } @catch (NSException *exception) {
        return NO;
    }
}

@end