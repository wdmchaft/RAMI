    //
//  GameBoardViewController.m
//  RAMI
//
//  Created by Elliot Babchick on 4/23/10.
//  Copyright 2010 Stanford University. All rights reserved.
//

#import "GameBoardViewController.h"


@implementation GameBoardViewController

@synthesize binary_read_1, binary_read_2, binary_read_3, binary_read_4;
@synthesize binary_switch_1, binary_switch_2, binary_switch_3, binary_switch_4;
@synthesize switch_1_lower, switch_1_upper, switch_2_lower, switch_2_upper,
switch_3_lower, switch_3_upper,switch_4_lower, switch_4_upper;
@synthesize touchzone_1, touchzone_2, touchzone_3, touchzone_4;

-(IBAction) flip:(id)sender{
	switch([sender tag])
	{
		case 0:
		{
			if (bool_1){
				
				[binary_read_1 setImage:[UIImage imageNamed:@"candy_1.png"]];
				[binary_switch_1 setImage:[UIImage imageNamed:@"switch_1.png"]];
				[switch_1_lower setImage:[UIImage imageNamed:@"right_1_lower.png"]];
				[switch_1_upper setImage:[UIImage imageNamed:@"right_1_upper.png"]];
				bool_1 = false;
			} else {
				[binary_read_1 setImage:[UIImage imageNamed:@"candy_0.png"]];
				[binary_switch_1 setImage:[UIImage imageNamed:@"switch_0.png"]];
				[switch_1_lower setImage:[UIImage imageNamed:@"left_1_lower.png"]];
				[switch_1_upper setImage:[UIImage imageNamed:@"left_1_upper.png"]];
				bool_1 = true;
			}

						
			break;
		}
		case 1:
		{
			if (bool_2){
				
				[binary_read_2 setImage:[UIImage imageNamed:@"candy_1.png"]];
				[binary_switch_2 setImage:[UIImage imageNamed:@"switch_1.png"]];
				[switch_2_lower setImage:[UIImage imageNamed:@"right_2_lower.png"]];
				[switch_2_upper setImage:[UIImage imageNamed:@"right_2_upper.png"]];
				bool_2 = false;
			} else {
				[binary_read_2 setImage:[UIImage imageNamed:@"candy_0.png"]];
				[binary_switch_2 setImage:[UIImage imageNamed:@"switch_0.png"]];
				[switch_2_lower setImage:[UIImage imageNamed:@"left_2_lower.png"]];
				[switch_2_upper setImage:[UIImage imageNamed:@"left_2_upper.png"]];
				bool_2 = true;
			}
			break;
		}
		case 2:
		{
			if (bool_3){
				
				[binary_read_3 setImage:[UIImage imageNamed:@"candy_1.png"]];
				[binary_switch_3 setImage:[UIImage imageNamed:@"switch_1.png"]];
				[switch_3_lower setImage:[UIImage imageNamed:@"right_3_lower.png"]];
				[switch_3_upper setImage:[UIImage imageNamed:@"right_3_upper.png"]];
				bool_3 = false;
			} else {
				[binary_read_3 setImage:[UIImage imageNamed:@"candy_0.png"]];
				[binary_switch_3 setImage:[UIImage imageNamed:@"switch_0.png"]];
				[switch_3_lower setImage:[UIImage imageNamed:@"left_3_lower.png"]];
				[switch_3_upper setImage:[UIImage imageNamed:@"left_3_upper.png"]];
				bool_3 = true;
			}
			break;
		}
		case 3:
		{
			if (bool_4){
				
				[binary_read_4 setImage:[UIImage imageNamed:@"candy_1.png"]];
				[binary_switch_4 setImage:[UIImage imageNamed:@"switch_1.png"]];
				[switch_4_lower setImage:[UIImage imageNamed:@"right_4_lower.png"]];
				[switch_4_upper setImage:[UIImage imageNamed:@"right_4_upper.png"]];
				bool_4 = false;
			} else {
				[binary_read_4 setImage:[UIImage imageNamed:@"candy_0.png"]];
				[binary_switch_4 setImage:[UIImage imageNamed:@"switch_0.png"]];
				[switch_4_lower setImage:[UIImage imageNamed:@"left_4_lower.png"]];
				[switch_4_upper setImage:[UIImage imageNamed:@"left_4_upper.png"]];
				bool_4 = true;
			}
			break;
		}
	}
}


/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	bool_1 = true;
	bool_2 = true;
	bool_3 = true;
	bool_4 = true;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	
	[binary_read_4 release];
	[binary_read_3 release];
	[binary_read_2 release];
	[binary_read_1 release];
	[binary_switch_4 release];
	[binary_switch_3 release];
	[binary_switch_2 release];
	[binary_switch_1 release];
	[switch_4_upper release];
	[switch_3_upper release];
	[switch_2_upper release];
	[switch_1_upper release];
	[switch_4_lower release];
	[switch_3_lower release];
	[switch_2_lower release];
	[switch_1_lower release];
	[touchzone_1 release];
	[touchzone_2 release];
	[touchzone_3 release];
	[touchzone_4 release];
	
    [super dealloc];
}


@end
