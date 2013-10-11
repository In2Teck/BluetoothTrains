//
//  TrainCell.m
//  Speed
//
//  Created by Benjamín Hernández on 23/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import "TrainCell.h"
#import "DataHandling.h"

@implementation TrainCell

@synthesize SpeedLabel, TrainNameLabel, OnOffSwitch, LowBatteryImage, DistanceLabel, index;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        OnOffSwitch = [[UISwitch alloc] init];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

- (IBAction)flipSwitchValue:(id)sender {
    Train *train = [[DataHandling sharedInstance] getTrainAtIndex:index];
    [train setOnOff:!train.onOff];
    [[DataHandling sharedInstance] replaceTrainAtIndex:index withObject:train];
    
    if (train.onOff){
        self.SpeedLabel.text = [NSString stringWithFormat:@"%.2f", train.speed];
        if ( train.speed > train.maxSpeed) {
            self.SpeedLabel.textColor = [UIColor redColor];
        } else {
            self.SpeedLabel.textColor = [UIColor blackColor];
        }
    } else {
        self.SpeedLabel.text = @"0.00";
        self.SpeedLabel.textColor = [UIColor blackColor];
    }
}

@end
