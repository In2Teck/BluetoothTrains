//
//  DashboardViewController.m
//  Speed
//
//  Created by Benjamín Hernández on 13/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import "DashboardViewController.h"
#import "DetailViewController.h"

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
    
    self.title = @"Home";
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    //If there are no cells to be reused, create a new cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    if ([[DataHandling sharedInstance] tableData] > 0){
        //Set the text attribute to whatever we are currently looking at in our array
        cell.textLabel.text = [[[[DataHandling sharedInstance] tableData] objectAtIndex:indexPath.row] objectAtIndex:0];
    
        //Set the detail disclosure indicator
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    //Return the cell
    return cell;
    
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
    NSString *train = [[[[DataHandling sharedInstance] tableData] objectAtIndex:path.row] objectAtIndex:0];
    
    detail.trainNumber = path.row;
    detail.trainName = train;
    
}


@end


