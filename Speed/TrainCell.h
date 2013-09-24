//
//  TrainCell.h
//  Speed
//
//  Created by Benjamín Hernández on 23/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrainCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *LowBatteryImage;
@property (weak, nonatomic) IBOutlet UILabel *SpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *TrainNameLabel;
@property (weak, nonatomic) IBOutlet UISwitch *OnOffSwitch;

@end
