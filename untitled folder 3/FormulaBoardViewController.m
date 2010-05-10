    //
//  FormulaBoardViewController.m
//  RAMI
//
//  Created by Elliot Babchick on 5/2/10.
//  Copyright 2010 Stanford University. All rights reserved.
//

#import "FormulaBoardViewController.h"


@implementation FormulaBoardViewController
@synthesize binary_read_1, binary_read_2, binary_read_3, binary_read_4;
@synthesize binary_switch_1, binary_switch_2, binary_switch_3, binary_switch_4;
@synthesize switch_1_upper, switch_2_upper,switch_3_upper,switch_4_upper;
@synthesize touchzone_1, touchzone_2, touchzone_3, touchzone_4;

-(IBAction) flip:(id)sender{
	switch([sender tag])
	{
		case 0:
		{
			if (bool_1){
				
				[binary_read_1 setImage:[UIImage imageNamed:@"formula_one.png"]];
				[binary_switch_1 setImage:[UIImage imageNamed:@"formula_switch_1.png"]];
				[switch_1_upper setImage:[UIImage imageNamed:@"formula_1_right.png"]];
				bool_1 = false;
			} else {
				[binary_read_1 setImage:[UIImage imageNamed:@"formula_zero.png"]];
				[binary_switch_1 setImage:[UIImage imageNamed:@"formula_switch_0.png"]];
				[switch_1_upper setImage:[UIImage imageNamed:@"formula_1_left.png"]];
				bool_1 = true;
			}
			
			
			break;
		}
		case 1:
		{
			if (bool_2){
				
				[binary_read_2 setImage:[UIImage imageNamed:@"formula_one.png"]];
				[binary_switch_2 setImage:[UIImage imageNamed:@"formula_switch_1.png"]];
				[switch_2_upper setImage:[UIImage imageNamed:@"formula_2_right.png"]];
				bool_2 = false;
			} else {
				[binary_read_2 setImage:[UIImage imageNamed:@"formula_zero.png"]];
				[binary_switch_2 setImage:[UIImage imageNamed:@"formula_switch_0.png"]];
				[switch_2_upper setImage:[UIImage imageNamed:@"formula_2_left.png"]];
				bool_2 = true;
			}
			break;
		}
		case 2:
		{
			if (bool_3){
				
				[binary_read_3 setImage:[UIImage imageNamed:@"formula_one.png"]];
				[binary_switch_3 setImage:[UIImage imageNamed:@"formula_switch_1.png"]];
				[switch_3_upper setImage:[UIImage imageNamed:@"formula_3_right.png"]];
				bool_3 = false;
			} else {
				[binary_read_3 setImage:[UIImage imageNamed:@"formula_zero.png"]];
				[binary_switch_3 setImage:[UIImage imageNamed:@"formula_switch_0.png"]];
				[switch_3_upper setImage:[UIImage imageNamed:@"formula_3_left.png"]];
				bool_3 = true;
			}
			break;
		}
		case 3:
		{
			if (bool_4){
				
				[binary_read_4 setImage:[UIImage imageNamed:@"formula_one.png"]];
				[binary_switch_4 setImage:[UIImage imageNamed:@"formula_switch_1.png"]];
				[switch_4_upper setImage:[UIImage imageNamed:@"formula_4_right.png"]];
				bool_4 = false;
			} else {
				[binary_read_4 setImage:[UIImage imageNamed:@"formula_zero.png"]];
				[binary_switch_4 setImage:[UIImage imageNamed:@"formula_switch_0.png"]];
				[switch_4_upper setImage:[UIImage imageNamed:@"formula_4_left.png"]];
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
