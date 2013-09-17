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
@synthesize tableData;

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
	// Do any additional setup after loading the view, typically from a nib.
    tableData = [[NSArray alloc ] initWithObjects:@"Blue Train", @"Modern Train", @"MAC Train", @"Hamburg Rail", @"Sino Trail G", @"Last Train", nil];
    
    self.title = @"Train List";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
    return tableData.count;
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
    
    //Set the text attribute to whatever we are currently looking at in our array
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    
    //Set the detail disclosure indicator
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
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
    
    NSString *train = [tableData objectAtIndex:path.row];
    
    detail.trainNumber = path.row;
    detail.trainName = train;
    
}


@end


