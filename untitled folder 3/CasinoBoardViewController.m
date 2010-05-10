    //
//  CasinoBoardViewController.m
//  RAMI
//
//  Created by Elliot Babchick on 5/10/10.
//  Copyright 2010 Stanford University. All rights reserved.
//

#import "CasinoBoardViewController.h"


@implementation CasinoBoardViewController

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
				
				[binary_switch_1 setImage:[UIImage imageNamed:@"casino_switch_1.png"]];
				[switch_1_lower setImage:[UIImage imageNamed:@"casino_right_1_lower.png"]];
				[switch_1_upper setImage:[UIImage imageNamed:@"casino_right_1_upper.png"]];
				bool_1 = false;
			} else {
				[binary_switch_1 setImage:[UIImage imageNamed:@"casino_switch_0.png"]];
				[switch_1_lower setImage:[UIImage imageNamed:@"casino_left_1_lower.png"]];
				[switch_1_upper setImage:[UIImage imageNamed:@"casino_left_1_upper.png"]];
				bool_1 = true;
			}
			
			
			break;
		}
		case 1:
		{
			if (bool_2){
				
				[binary_switch_2 setImage:[UIImage imageNamed:@"casino_switch_1.png"]];
				[switch_2_lower setImage:[UIImage imageNamed:@"casino_right_2_lower.png"]];
				[switch_2_upper setImage:[UIImage imageNamed:@"casino_right_2_upper.png"]];
				bool_2 = false;
			} else {
				[binary_switch_2 setImage:[UIImage imageNamed:@"casino_switch_0.png"]];
				[switch_2_lower setImage:[UIImage imageNamed:@"casino_left_2_lower.png"]];
				[switch_2_upper setImage:[UIImage imageNamed:@"casino_left_2_upper.png"]];
				bool_2 = true;
			}
			
			NSLog(@"%@", switch_2_lower);
			NSLog(@"%@", switch_2_upper);
			break;
		}
		case 2:
		{
			if (bool_3){
				
				[binary_switch_3 setImage:[UIImage imageNamed:@"casino_switch_1.png"]];
				[switch_3_lower setImage:[UIImage imageNamed:@"casino_right_3_lower.png"]];
				[switch_3_upper setImage:[UIImage imageNamed:@"casino_right_3_upper.png"]];
				bool_3 = false;
			} else {
				[binary_switch_3 setImage:[UIImage imageNamed:@"casino_switch_0.png"]];
				[switch_3_lower setImage:[UIImage imageNamed:@"casino_left_3_lower.png"]];
				[switch_3_upper setImage:[UIImage imageNamed:@"casino_left_3_upper.png"]];
				bool_3 = true;
			}
			break;
		}
		case 3:
		{
			if (bool_4){
				
				[binary_switch_4 setImage:[UIImage imageNamed:@"casino_switch_1.png"]];
				[switch_4_lower setImage:[UIImage imageNamed:@"casino_right_4_lower.png"]];
				[switch_4_upper setImage:[UIImage imageNamed:@"casino_right_4_upper.png"]];
				bool_4 = false;
			} else {
				[binary_switch_4 setImage:[UIImage imageNamed:@"casino_switch_0.png"]];
				[switch_4_lower setImage:[UIImage imageNamed:@"casino_left_4_lower.png"]];
				[switch_4_upper setImage:[UIImage imageNamed:@"casino_left_4_upper.png"]];
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
	//switch_1_lower.frame = CGRectMake(298,198,465,128);
	//switch_1_upper.frame = CGRectMake(298,198,465,128);
	NSLog(@"%@", switch_2_lower);
	NSLog(@"%@", switch_2_upper);
	
	bool_1 = true;
	bool_2 = true;
	bool_3 = true;
	bool_4 = true;
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
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
    [super dealloc];
}


@end
