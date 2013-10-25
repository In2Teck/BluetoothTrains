//
//  DataHandling.h
//  Speed
//
//  Created by Benjamín Hernández on 18/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Train.h"
#import "Constants.h"

@interface DataHandling : NSObject {
    NSMutableArray *tableData;
    NSArray *paths;
    NSString *stringsPlistPath;
    NSMutableString *frame;
}

@property (strong, nonatomic) NSMutableArray *tableData;
@property (strong, nonatomic) NSArray *paths;
@property (strong, nonatomic) NSString *stringsPlistPath;
@property (strong, nonatomic) NSMutableString *frame;

+ (DataHandling*) sharedInstance;
- (void) loadTextFile;
- (BOOL) addTrain:(Train*) train;
- (BOOL) removeTrainAtIndex:(NSUInteger) index;
- (BOOL) replaceTrainAtIndex:(NSUInteger) index withObject:(Train*) train;
- (Train*) getTrainAtIndex:(NSUInteger) index;
- (BOOL) updateTrainValues:(NSString*)frame;
- (BOOL) validateValues:(NSString*)trainId sensor:(NSString*)sensorId dataLength:(NSString*)dataFieldLength data:(NSString*)dataField check:(NSString*)checksum;
;
- (float) calculateSpeed:(float)data sourceTrain:(Train*)train;
@end
