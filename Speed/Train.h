//
//  Train.h
//  Speed
//
//  Created by Benjamín Hernández on 23/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

// Train: name, style, speed, max speed, switch, mac address, low battery
@interface Train : NSObject  <NSCoding>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *style;
@property float speed;
@property float maxSpeed;
@property float wheelDiameter;
@property BOOL onOff;
@property float distance;
@property BOOL lowBattery;
@property (strong, nonatomic) NSString *uId;

- (id) initWithName:(NSString*)initName style:(NSString*)initStyle speed:(float)initSpeed maxSpeed:(float)initMaxSpeed wheelDiameter:(float)initWheelDiameter onOff:(BOOL)initOnOff lowBattery:(BOOL)initLowBattery uId:(NSString*) initUId;
-(void) updateDistance:(float)data metricSystem:(BOOL)isMetricSystem;

@end
