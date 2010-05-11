    //
//  CasinoBoardViewController.m
//  RAMI
//
//  Created by Elliot Babchick on 5/10/10.
//  Copyright 2010 Stanford University. All rights reserved.
//

#import "CasinoBoardViewController.h"
#import "CasinoRamp.h"

@implementation CasinoBoardViewController

@synthesize binary_switch_1, binary_switch_2, binary_switch_3, binary_switch_4;
@synthesize switch_1_lower, switch_1_upper, switch_2_lower, switch_2_upper,
switch_3_lower, switch_3_upper,switch_4_lower, switch_4_upper;
@synthesize touchzone_1, touchzone_2, touchzone_3, touchzone_4;

//536,171 - 536,253
//536,253 - 370,287
//370,287 - 349,319
//349,319 - 349,367
//349,367 - 259,404
//259,404 - 259,451
//259,451 - 217,468
//217,468 - 217,526
//217,526 - 197,556
//197,556 - 197,598

- (void) makeYVals
{
	for(int i = 0; i < 12; i++)
	{
		float m = (253-171)/12.0;
		yvals[i] = 171 + m * i;
	}
	for(int i = 12; i < 36; i++)
	{
		float m = (287-253)/24.0;
		yvals[i] = 253 + m * (i-12);
	}
	for(int i = 36; i < 45; i++)
	{
		float m = (319-287)/9.0;
		yvals[i] = 287 + m * (i-36);
	}
	for(int i = 45; i < 57; i++)
	{
		float m = (367-319)/12.0;
		yvals[i] = 319 + m * (i-45);
	}
	for(int i = 57; i < 72; i++)
	{
		float m = (404-367)/15.0;
		yvals[i] = 367 + m * (i-57);
	}
	for(int i = 72; i < 84; i++)
	{
		float m = (451-404)/12.0;
		yvals[i] = 404 + m * (i-72);
	}
	for(int i = 84; i < 96; i++)
	{
		float m = (468-451)/12.0;
		yvals[i] = 451 + m * (i-84);
	}
	for(int i = 96; i < 108; i++)
	{
		float m = (526-468)/12.0;
		yvals[i] = 468 + m * (i-96);
	}
	for(int i = 108; i < 120; i++)
	{
		float m = (556-526)/12.0;
		yvals[i] = 526 + m * (i-108);
	}
	for(int i = 120; i < 128; i++)
	{
		float m = (598-556)/8.0;
		yvals[i] = 556 + m * (i-120);
	}
}

//536,171 - 536,253
//536,253 - 370,287
//370,287 - 349,319
//349,319 - 349,367
//349,367 - 259,404
//259,404 - 259,451
//259,451 - 217,468
//217,468 - 217,526
//217,526 - 197,556
//197,556 - 197,598

- (void) setFirstOn:(BOOL)isOn
{
	[[ramps objectAtIndex:1] setRight:isOn];
}

- (void) setSecondOn:(BOOL)isOn
{
	[[ramps objectAtIndex:2] setRight:isOn];
}

- (void) setThirdOn:(BOOL)isOn
{
	[[ramps objectAtIndex:3] setRight:isOn];
}

- (void) setFourthOn:(BOOL)isOn
{
	[[ramps objectAtIndex:4] setRight:isOn];
}

- (void) setupRamps
{
	[self makeYVals];
	ramps = [[NSMutableArray alloc] init];
	for(int i = 0; i < 5; i++)
	{
		CasinoRamp *ramp = [[CasinoRamp alloc] init];
		[ramp makeForPosition:i];
		[ramps addObject:ramp];
		[ramp release];
	}
	
	ball.center = CGPointMake(536, yvals[0]);
	ballX = 536;
}

- (void) update
{
	int y = yvals[timeStep];
	if(timeStep >= 128 || (rampIndex+1 < [ramps count] && y >= [[ramps objectAtIndex:rampIndex+1] yStart]))
	{
		ballX = ball.center.x;
		rampIndex++;
	}
	if(rampIndex >= [ramps count])// || timeStep == 134)
	{
		[timer invalidate];
		timer = nil;
		return;
	}
	
	int deltaX = [[ramps objectAtIndex:rampIndex] offsetForTime:timeStep];
	int x = ballX + deltaX;
		
	ball.center = CGPointMake(x,y);
	
	NSLog(@"%d : %d : %d", timeStep, x, y);
	timeStep++;
}

- (void) start
{
	rampIndex = 0;
	ball.center = CGPointMake(536, yvals[0]);
	ballX = 536;
	timeStep = 0;
	
	[self setFirstOn:!bool_1];
	[self setSecondOn:!bool_2];
	[self setThirdOn:!bool_3];
	[self setFourthOn:!bool_4];
	
	if(!timer)
	{
		[timer invalidate];
		timer = nil;
	}
	timer = [NSTimer scheduledTimerWithTimeInterval:(1/15.0) target:self
										   selector:@selector(update) userInfo:nil repeats:YES];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	CGPoint p = [[touches anyObject] locationInView:self.view];
	if(p.x < 100 && p.y < 100)
		[self start];
	else
	{
		ball.center = p;
	}
	
}

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
			[self setFirstOn:!bool_1];
			
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
			
			[self setSecondOn:!bool_2];
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
			
			[self setThirdOn:!bool_3];
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
			[self setFourthOn:!bool_4];
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
	bool_1 = true;
	bool_2 = true;
	bool_3 = true;
	bool_4 = true;
	[self setupRamps];
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
