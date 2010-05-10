    //
//  GameBoardViewController.m
//  RAMI
//
//  Created by Elliot Babchick on 4/23/10.
//  Copyright 2010 Stanford University. All rights reserved.
//

#import "GameBoardViewController.h"
#import "Ramp.h"

@implementation GameBoardViewController

@synthesize binary_read_1, binary_read_2, binary_read_3, binary_read_4;
@synthesize binary_switch_1, binary_switch_2, binary_switch_3, binary_switch_4;
@synthesize switch_1_lower, switch_1_upper, switch_2_lower, switch_2_upper,
switch_3_lower, switch_3_upper,switch_4_lower, switch_4_upper;
@synthesize touchzone_1,touchzone_2,touchzone_3,touchzone_4;

- (void) makeYVals
{
	yvals[0] = 256;
	yvals[1] = 261;
	yvals[2] = 264;
	yvals[3] = 266;
	yvals[4] = 269;
	yvals[5] = 273;
	yvals[6] = 275;
	yvals[7] = 277;
	yvals[8] = 279;
	yvals[9] = 281;
	yvals[10] = 282;
	yvals[11] = 284;
	yvals[12] = 285;
	yvals[13] = 288;
	yvals[14] = 290;
	yvals[15] = 294;
	yvals[16] = 300;
	yvals[17] = 304;
	yvals[18] = 309;
	yvals[19] = 313;
	yvals[20] = 318;
	yvals[21] = 324;
	yvals[22] = 327;
	yvals[23] = 328;
	yvals[24] = 330;
	yvals[25] = 330;
	yvals[26] = 331;
	yvals[27] = 331;
	yvals[28] = 331;
	yvals[29] = 331;
	yvals[30] = 331;
	yvals[31] = 332;
	yvals[32] = 332;
	yvals[33] = 332;
	yvals[34] = 332;
	yvals[35] = 332;
	yvals[36] = 333;
	yvals[37] = 333;
	yvals[38] = 333;
	yvals[39] = 334;
	yvals[40] = 334;
	yvals[41] = 335;
	yvals[42] = 335;
	yvals[43] = 335;
	yvals[44] = 336;
	yvals[45] = 336;
	yvals[46] = 337;
	yvals[47] = 337;
	yvals[48] = 338;
	yvals[49] = 338;
	yvals[50] = 339;
	yvals[51] = 340;
	yvals[52] = 340;
	yvals[53] = 340;
	yvals[54] = 343;
	yvals[55] = 346;
	yvals[56] = 347;
	yvals[57] = 349;
	yvals[58] = 352;
	yvals[59] = 353;
	yvals[60] = 354;
	yvals[61] = 357;
	yvals[62] = 360;
	yvals[63] = 362;
	yvals[64] = 365;
	yvals[65] = 366;
	yvals[66] = 369;
	yvals[67] = 371;
	yvals[68] = 373;
	yvals[69] = 375;
	yvals[70] = 378;
	yvals[71] = 380;
	yvals[72] = 381;
	yvals[73] = 382;
	yvals[74] = 383;
	yvals[75] = 384;
	yvals[76] = 388;
	yvals[77] = 389;
	yvals[78] = 391;
	yvals[79] = 394;
	yvals[80] = 398;
	yvals[81] = 401;
	yvals[82] = 404;
	yvals[83] = 406;
	yvals[84] = 411;
	yvals[85] = 415;
	yvals[86] = 418;
	yvals[87] = 421;
	yvals[88] = 423;
	yvals[89] = 425;
	yvals[90] = 426;
	yvals[91] = 432;
	yvals[92] = 434;
	yvals[93] = 434;
	yvals[94] = 434;
	yvals[95] = 434;
	yvals[96] = 436;
	yvals[97] = 438;
	yvals[98] = 438;
	yvals[99] = 441;
	yvals[100] = 444;
	yvals[101] = 447;
	yvals[102] = 449;
	yvals[103] = 451;
	yvals[104] = 456;
	yvals[105] = 460;
	yvals[106] = 464;
	yvals[107] = 468;
	yvals[108] = 473;
	yvals[109] = 480;
	yvals[110] = 483;
	yvals[111] = 488;
	yvals[112] = 490;
	yvals[113] = 494;
	yvals[114] = 497;
	yvals[115] = 501;
	yvals[116] = 506;
	yvals[117] = 510;
	yvals[118] = 514;
	yvals[119] = 521;
	yvals[120] = 524;
	yvals[121] = 528;
	yvals[122] = 531;
	yvals[123] = 534;
	yvals[124] = 539;
	yvals[125] = 544;
	yvals[126] = 548;
	yvals[127] = 552;
	yvals[128] = 558;
	yvals[129] = 563;
	yvals[130] = 567;
	yvals[131] = 570;//
	yvals[132] = 573;
	yvals[133] = 576;
	yvals[134] = 577;///
	yvals[135] = 583;
	yvals[136] = 585;
	yvals[137] = 589;
	yvals[138] = 593;
	yvals[139] = 599;
	yvals[140] = 604;
	yvals[141] = 610;
	yvals[142] = 618;
	yvals[143] = 623;
}

- (void) setFirstOn:(BOOL)isOn
{
	[[ramps objectAtIndex:1] setRight:isOn];
	if(ball.center.y <= [[ramps objectAtIndex:2] yStart])
		[[ramps objectAtIndex:2] setRight:isOn];
	if(ball.center.x >= 530)//[[ramps objectAtIndex:8] yStart])
		[[ramps objectAtIndex:8] setRight:isOn];
}

- (void) setSecondOn:(BOOL)isOn
{
	[[ramps objectAtIndex:3] setRight:isOn];
	if(ball.center.y <= [[ramps objectAtIndex:4] yStart])
		[[ramps objectAtIndex:4] setRight:isOn];
}

- (void) setThirdOn:(BOOL)isOn
{
	[[ramps objectAtIndex:5] setRight:isOn];
	if(ball.center.y <= [[ramps objectAtIndex:6] yStart])
		[[ramps objectAtIndex:6] setRight:isOn];
}

- (void) setFourthOn:(BOOL)isOn
{
	[[ramps objectAtIndex:7] setRight:isOn];
}

- (void) setupRamps
{
	[self makeYVals];
	ramps = [[NSMutableArray alloc] init];
	for(int i = 0; i < 9; i++)
	{
		Ramp *ramp = [[Ramp alloc] init];
		[ramp makeForPosition:i];
		[ramps addObject:ramp];
		[ramp release];
	}
	
	ball.center = CGPointMake(530, yvals[0]);
	ballX = 530;
}

- (void) update
{
	int y = yvals[timeStep];
	if(timeStep >= 144 || (rampIndex+1 < [ramps count] && y >= [[ramps objectAtIndex:rampIndex+1] yStart]))
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
	
	int x = ballX + [[ramps objectAtIndex:rampIndex] offsetForTime:timeStep++];
	
	ball.center = CGPointMake(x,y-12);
}

- (void) start
{
	rampIndex = 0;
	ball.center = CGPointMake(530, yvals[0]-12);
	ballX = 530;
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
	timer = [NSTimer scheduledTimerWithTimeInterval:(1/playSpeed.value) target:self
										   selector:@selector(update) userInfo:nil repeats:YES];
}

-(IBAction) updateSpeedLabel
{
	playSpeed.value = ceil(playSpeed.value);
	speedLabel.text = [NSString stringWithFormat:@"Speed: %.0f", playSpeed.value];
}

-(IBAction) flip:(id)sender
{
	switch([sender tag])
	{
		case 0:
		{
			if (bool_1)
			{
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
			[self setFirstOn:!bool_1];
						
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
			[self setSecondOn:!bool_2];
			
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
			[self setThirdOn:!bool_3];
			
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
			[self setFourthOn:!bool_4];
			
			break;
		}
	}
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self start];
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

- (void) dur
{
	ball.center = CGPointMake(530,yvals[0]-16);
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	bool_1 = true;
	bool_2 = true;
	bool_3 = true;
	bool_4 = true;
	timer = nil;
	[NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(dur) userInfo:nil repeats:NO];
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
