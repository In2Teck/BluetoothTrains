//
//  DataHandling.m
//  Speed
//
//  Created by Benjamín Hernández on 18/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import "DataHandling.h"

@implementation DataHandling

@synthesize tableData, paths, stringsPlistPath;

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
    stringsPlistPath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"speed.plist"];
    [self loadTextFile];
    
    return self;
}

-(void) dealloc
{
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

- (BOOL) addTrain:(Train *)train
{
    NSData *objData = [NSKeyedArchiver archivedDataWithRootObject:train];
    [tableData addObject: objData];
    [tableData writeToFile:stringsPlistPath atomically: YES];

    return YES;
}

- (BOOL) replaceTrainAtIndex:(NSUInteger) index withObject:(Train*) train{
    NSData *objData = [NSKeyedArchiver archivedDataWithRootObject:train];
    @try{
        [tableData replaceObjectAtIndex:index withObject:objData];
        [tableData writeToFile:stringsPlistPath atomically: YES];
        return YES;
    } @catch (NSException *exception){
        return NO;
    }
}

- (BOOL) replaceTrainWithUId:(NSString*) UId withObject:(Train*) train{
    
    for (int i = 0; i < tableData.count; i++) {
        Train *sourceTrain = [self getTrainAtIndex:i];
        if ([sourceTrain.uId isEqualToString:UId]){
            [self replaceTrainAtIndex:i withObject:train];
        }
    }
    return NO;
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

- (Train*) getTrainAtIndex:(NSUInteger) index{
    
    NSData *objData = [tableData objectAtIndex:index];
    Train *train = [NSKeyedUnarchiver unarchiveObjectWithData:objData];
    return train;    
}

- (Train*) getTrainByUId:(NSString*) UId{
    
    for (int i = 0; i < tableData.count; i++) {
        Train *train = [self getTrainAtIndex:i];
        if ([train.uId isEqualToString:UId]){
            return train;
        }
    }
    return NULL;
}

- (BOOL) updateTrainValues:(NSString*)frame
{
    NSArray *array = [frame componentsSeparatedByString:@" "];
    NSString *trainId = [array objectAtIndex:0];
    NSString *sensorId = [array objectAtIndex:1];
    NSString *dataFieldLength = [array objectAtIndex:2];
    NSString *dataField = [array objectAtIndex:3];
    NSString *checksum = [array objectAtIndex:4];
    
    NSArray *values = [[NSArray alloc] initWithObjects: trainId, sensorId, dataFieldLength, dataField, checksum, nil];
    
    if ([self validateValues:values]) {
        Train *train = [self getTrainByUId:trainId];
        if (train != NULL && train.onOff) {
            if ([sensorId isEqualToString:@"1"]) {
                [train setSpeed: [self calculateSpeed: [dataField floatValue] wheelDiameter:train.wheelDiameter metricSystem:NO]];
                [train updateDistance:[dataField floatValue] metricSystem:NO];
            } else if ([sensorId isEqualToString:@"2"]) {
                if ([dataField isEqualToString:@"149"]) {
                    [train setLowBattery:YES];
                } else if ([dataField isEqualToString:@"151"]) {
                    [train setLowBattery:NO];
                }
            }
            [self replaceTrainWithUId:trainId withObject:train];
            return YES;
        }
    }
    return NO;
}

- (BOOL) validateValues:(NSArray*) array
{
    return YES;
}

- (float) calculateSpeed:(float)data wheelDiameter:(float)diameter metricSystem:(BOOL)isMetricSystem
{
    float speed = 0;
    if (isMetricSystem) {
        speed = (diameter * KPH_CONSTANT) / data;
    } else {
        speed = (diameter * MPH_CONSTANT) / data;
    }
    return [[NSString stringWithFormat:@"%.2f", speed] floatValue];
}

@end