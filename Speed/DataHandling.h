//
//  DataHandling.h
//  Speed
//
//  Created by Benjamín Hernández on 18/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Train.h"

@interface DataHandling : NSObject {
    NSMutableArray *tableData;
    NSArray *paths;
    NSString *stringsPlistPath;
}

@property (strong, nonatomic) NSMutableArray *tableData;
@property (strong, nonatomic) NSArray *paths;
@property (strong, nonatomic) NSString *stringsPlistPath;

+ (DataHandling*) sharedInstance;
- (void) loadTextFile;
- (BOOL) addTrain:(Train*) train;
- (BOOL) removeTrainAtIndex:(NSUInteger) index;
- (Train*) getTrainAtIndex:(NSUInteger) index;

@end
