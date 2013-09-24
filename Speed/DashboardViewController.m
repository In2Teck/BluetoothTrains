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

- (void)insertNewTrain
{
    // Display UIAlertView
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Enter name" message:@"" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"Ok", nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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
        cell.SpeedLabel.text = [NSString stringWithFormat:@"%d", train.speed];
        if ( train.speed > train.maxSpeed) {
            cell.SpeedLabel.textColor = [UIColor redColor];
        }
        cell.LowBatteryImage.alpha = train.lowBattery ? 1 : 0;
        cell.OnOffSwitch.on = train.onOff;
        
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

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    //DetailViewController * DVC = [segue destinationViewController]; OR
    
    //Create a DetailViewController Object
    DetailViewController *detail = [[DetailViewController alloc] init];
    
    //Set DVC to the destinationViewController property of the segue
    detail = [segue destinationViewController];
    
    
    //Get the indexpath
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    Train *train = [[DataHandling sharedInstance] getTrainAtIndex:path.row];
    
    detail.trainNumber = path.row;
    detail.trainName = train.name;
    
}

# pragma mark UIAlertViewDelegateMethods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // Only do if the user clicks 'OK'
    if (buttonIndex == 1){
        NSString *tmpText = [alertView textFieldAtIndex:0].text;
     
        // Train: name, style, speed, max speed, switch, mac address, low battery
        Train *train = [[Train alloc] initWithName:tmpText style:@"Classic" speed:110 maxSpeed:20 onOff:NO lowBattery:NO macAddress:@"MAC"];
        [[DataHandling sharedInstance] addTrain:train];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[[[DataHandling sharedInstance] tableData] count]-1 inSection:0];
        [[self tableView] insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

@end


