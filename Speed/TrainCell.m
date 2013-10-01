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

@synthesize SpeedLabel;
@synthesize TrainNameLabel;
@synthesize OnOffSwitch;
@synthesize LowBatteryImage;
@synthesize index;

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
}
@end
