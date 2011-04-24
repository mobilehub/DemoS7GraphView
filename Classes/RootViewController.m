//
//  RootViewController.m
//  DemoS7GraphView
//
//  Created by Rudi Farkas on 20.12.09.
//  Copyright Wolfscliff 2009. All rights reserved.
//

// It clips negative y values to 0
// It autoscales y to the max y over all plots

#import "RootViewController.h"


@implementation RootViewController

@synthesize graphView;

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	//self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.graphView = [[S7GraphView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	self.view = self.graphView;
	self.graphView.dataSource = self;
	self.view.backgroundColor = [UIColor yellowColor];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

	NSNumberFormatter *numberFormatter = [NSNumberFormatter new];
	[numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
	[numberFormatter setMinimumFractionDigits:0];
	[numberFormatter setMaximumFractionDigits:0];
	
	self.graphView.yValuesFormatter = numberFormatter;
	
	NSDateFormatter *dateFormatter = [NSDateFormatter new];
	[dateFormatter setTimeStyle:NSDateFormatterNoStyle];
	[dateFormatter setDateStyle:NSDateFormatterShortStyle];
	
	//self.graphView.xValuesFormatter = dateFormatter;
	
	[dateFormatter release];        
	[numberFormatter release];
	
	self.graphView.backgroundColor = [UIColor darkGrayColor];
	
	self.graphView.drawAxisX = YES;
	self.graphView.drawAxisY = YES;
	self.graphView.drawGridX = YES;
	self.graphView.drawGridY = YES;
	
	self.graphView.xValuesColor = [UIColor whiteColor];
	self.graphView.yValuesColor = [UIColor whiteColor];
	
	self.graphView.gridXColor = [UIColor whiteColor];
	self.graphView.gridYColor = [UIColor whiteColor];
	
	self.graphView.drawInfo = YES;
	self.graphView.info = @"Load";
	self.graphView.infoColor = [UIColor whiteColor];
	
	//When you need to update the data, make this call:
	
	[self.graphView reloadData];
	
}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[graphView release];
	graphView = nil;

    [super dealloc];
}

#pragma mark protocol S7GraphViewDataSource

- (NSUInteger)graphViewNumberOfPlots:(S7GraphView *)graphView {
	/* Return the number of plots you are going to have in the view. 1+ */
	return 1;
}

- (NSArray *)graphViewXValues:(S7GraphView *)graphView {
	/* An array of objects that will be further formatted to be displayed on the X-axis.
	 The number of elements should be equal to the number of points you have for every plot. */
	NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:101];
	for ( int i = -50 ; i <= 50 ; i ++ ) {
		[array addObject:[NSNumber numberWithInt:i]];	
	}
	return array;
}

- (NSArray *)graphView:(S7GraphView *)graphView yValuesForPlot:(NSUInteger)plotIndex {
	/* Return the values for a specific graph. Each plot is meant to have equal number of points.
	 And this amount should be equal to the amount of elements you return from graphViewXValues: method. */
	NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:101];
	switch (plotIndex) {
		default:
		case 0:
			for ( int i = -50 ; i <= 50 ; i ++ ) {
				[array addObject:[NSNumber numberWithInt:i*i]];	// y = x*x		
			}
			break;
		case 1:
			for ( int i = -50 ; i <= 50 ; i ++ ) {
				[array addObject:[NSNumber numberWithInt:i*i*i]];	// y = x*x*x				
			}
			break;
		case 3:
			for ( int i = -50; i <= 50; i++ ) {
				[array addObject:[NSNumber numberWithInt:i+1000]];
			}
	}
	
	return array;
}




@end

