//
//  DashboardViewController.m
//  Speed
//
//  Created by Benjamín Hernández on 13/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import "DashboardViewController.h"

@interface DashboardViewController () 

@end

@implementation DashboardViewController

@synthesize frame;

-(id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Train List";
    
    // Navigation
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewTrain)];
    
    self.navigationItem.rightBarButtonItem = addButton;
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [[self tableView] setEditing:editing animated:animated];
}

- (void)refreshList
{
    [[self tableView] reloadData];
}

- (void)insertNewTrain
{
    [self performSegueWithIdentifier: @"NewItemSegue" sender: self];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[DataHandling sharedInstance] tableData] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //Create an NSString object that we can use as the reuse identifier
    static NSString *CellIdentifier = @"Cell";
    
    //Check to see if we can reuse a cell from a row that has just rolled off the screen
    TrainCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //If there are no cells to be reused, create a new cell
    if (cell == nil) {
        cell = [[TrainCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Train: name, style, speed, max speed, switch, mac address, low battery
    if ([[DataHandling sharedInstance] tableData] > 0){
        //Set the text attribute to whatever we are currently looking at in our array
        Train *train = [[DataHandling sharedInstance] getTrainAtIndex:indexPath.row];
        cell.TrainNameLabel.text = train.name;
        cell.index = indexPath.row;
        cell.OnOffSwitch.on = train.onOff;
        
        if (train.onOff) {
            cell.SpeedLabel.text = [NSString stringWithFormat:@"%.2f", train.speed];
            if ( train.speed > train.maxSpeed) {
                cell.SpeedLabel.textColor = [UIColor redColor];
            } else {
                cell.SpeedLabel.textColor = [UIColor blackColor];
            }
        } else {
            cell.SpeedLabel.text = @"0.00";
            cell.SpeedLabel.textColor = [UIColor blackColor];
        }
        
        cell.DistanceLabel.text = [NSString stringWithFormat:@"%.2f", train.distance];
        cell.LowBatteryImage.alpha = train.lowBattery ? 1 : 0;
        
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"IsMetricSystem"]){
            cell.DistanceMetricLabel.text = @"km";
            cell.SpeedMetricLabel.text = @"km";
        } else {
            cell.DistanceMetricLabel.text = @"miles";
            cell.SpeedMetricLabel.text = @"miles";
        }
        
        //Set the detail disclosure indicator
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    //Return the cell
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete){
        [[DataHandling sharedInstance] removeTrainAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"EditItemSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        EditItemViewController *editItemViewController = segue.destinationViewController;
        editItemViewController.TrainIndex = indexPath.row;
    }
}

-(BOOL)canBecomeFirstResponder{
    return YES;
}

-(BOOL)hasText{
    return YES;
}

-(void)insertText:(NSString *)text {
    NSString *input = [NSString stringToHex:text];
    if ([input isEqualToString:@"24"]){
        self.frame = [NSMutableString stringWithString:@""];
    } else if([input isEqualToString:@"a"]){
        // PARSE FRAME
        BOOL update = [[DataHandling sharedInstance] updateTrainValues:self.frame];
        if (update) {
            [self refreshList];
        }
    }else {
        [self.frame appendString:text];
    }
}

- (void)deleteBackward
{
}

@end


