//
//  Train.h
//  Speed
//
//  Created by Benjamín Hernández on 23/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import <Foundation/Foundation.h>

// Train: name, style, speed, max speed, switch, mac address, low battery
@interface Train : NSObject  <NSCoding>

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *style;
@property int speed;
@property int maxSpeed;
@property BOOL onOff;
@property BOOL lowBattery;
@property (strong, nonatomic) NSString *macAddress;

- (id) initWithName:(NSString*)initName style:(NSString*)initStyle speed:(int)initSpeed maxSpeed:(int)initMaxSpeed onOff:(BOOL)initOnOff lowBattery:(BOOL)initLowBattery macAddress:(NSString*) initMacAddress;

@end
