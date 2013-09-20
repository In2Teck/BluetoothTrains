//
//  DataHandling.h
//  Speed
//
//  Created by Benjamín Hernández on 18/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import <Foundation/Foundation.h>

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
- (BOOL) addTrain:(NSMutableArray*) train;
- (BOOL) removeTrainAtIndex:(NSUInteger) index;

@end
