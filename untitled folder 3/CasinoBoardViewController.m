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

- (CGPoint) winPosFromNum:(int)num
{
	num = num % 8;
	int v1 = 0;
	switch(num)
	{
		case 0:
		{
			v1 = 197;
			break;
		}
		case 1:
		{
			v1 = 241;
			break;
		}
		case 2:
		{
			v1 = 287;
			break;
		}
		case 3:
		{
			v1 = 331;
			break;
		}
		case 4:
		{
			v1 = 377;
			break;
		}
		case 5:
		{
			v1 = 421;
			break;
		}
		case 6:
		{
			v1 = 467;
			break;
		}
		case 7:
		{
			v1 = 511;
			break;
		}
	}
	return CGPointMake(v1,v1 + 374);
}

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
	if(timeStep > 45) return;
	[[ramps objectAtIndex:1] setRight:isOn];
}

- (void) setSecondOn:(BOOL)isOn
{
	if(timeStep > 72) return;
	[[ramps objectAtIndex:2] setRight:isOn];
}

- (void) setThirdOn:(BOOL)isOn
{
	if(timeStep > 108) return;
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
	
	for(int i = 0; i < 16; i++)
		cups[i] = 0;
	
	ballX = 536;
	
	balls = [[NSMutableArray alloc] initWithCapacity:32];
	for(int i = 0; i < 32; i++)
	{
		[balls addObject:[NSNumber numberWithInt:i % 8]];
	}
	for(int i = 0; i < 100; i++)
	{
		[balls exchangeObjectAtIndex:arc4random() % 32 withObjectAtIndex:arc4random() % 32];
	}
}

- (void) removeLoser:(NSTimer *)atimer
{
	UIImageView *aball = [atimer userInfo];
	[aball removeFromSuperview];
}

- (void) shiftLoser:(NSTimer *)atimer
{
	UIImageView *aball = [atimer userInfo];
	[UIView beginAnimations:@"SlideOverLoser" context:nil];
	[UIView setAnimationDuration:.8];
	[UIView setAnimationBeginsFromCurrentState:YES];
	[UIView setAnimationCurve:UIViewAnimationCurveLinear];
	aball.center = CGPointMake(942, aball.center.y);
	[UIView commitAnimations];
	[NSTimer scheduledTimerWithTimeInterval:.8 target:self selector:@selector(removeLoser:) userInfo:aball repeats:NO];
}

- (void) ballDone:(UIImageView *)aball
{
	CGPoint goal = [self winPosFromNum:aball.tag-kBallTags];
	if(aball.center.x == goal.x || aball.center.x == goal.y)
	{
		int cupNum = aball.tag-kBallTags;
		if(aball.center.x == goal.y)
			cupNum += 8;
		
		if(cups[cupNum] < 2)
		{
			cups[cupNum]++;
			
			if(mode == SCORE)
			{
				timeMod = 60 * 6;
				combo++;
				score+=1000*combo;
				scoreLabel.text = [NSString stringWithFormat:@"SCORE: %d", score];
				comboLabel.hidden = NO;
				comboLabel.text = [NSString stringWithFormat:@"COMBO: %dx", combo];
			}
			
			if(cups[cupNum] == 1)
			{
				[UIView beginAnimations:@"SlideDownWinner" context:nil];
				[UIView setAnimationDuration:.4];
				[UIView setAnimationBeginsFromCurrentState:YES];
				[UIView setAnimationCurve:UIViewAnimationCurveLinear];
				aball.center = CGPointMake(aball.center.x, aball.center.y + 24);
				[UIView commitAnimations];
			}
		}
		else
			goto MISS;
	}
	else
	{
		MISS:
		[UIView beginAnimations:@"SlideDownLoser" context:nil];
		[UIView setAnimationDuration:.4];
		[UIView setAnimationBeginsFromCurrentState:YES];
		[UIView setAnimationCurve:UIViewAnimationCurveLinear];
		aball.center = CGPointMake(aball.center.x, aball.center.y + 90);
		[UIView commitAnimations];
		
		if(mode == TIME)
		{
			score += 50;
		}
		
		[NSTimer scheduledTimerWithTimeInterval:.4 target:self selector:@selector(shiftLoser:) userInfo:aball repeats:NO];
		
		if(mode == TIME)
			[balls insertObject:[NSNumber numberWithInt:aball.tag-kBallTags] atIndex:0];
		else if(mode == SCORE)
		{
			comboLabel.hidden = YES;
			combo = 0;
			timeMod = 0;
		}
	}
	
	if(mode == PRACTICE)
		[balls insertObject:[NSNumber numberWithInt:aball.tag-kBallTags] atIndex:0];
}

- (void) update
{
	[super update];
	
	if(timeStep > 128 || ball == nil) return;
	
	int y = yvals[timeStep];
	if(timeStep >= 128 || (rampIndex+1 < [ramps count] && y >= [[ramps objectAtIndex:rampIndex+1] yStart]))
	{
		ballX = ball.center.x;
		rampIndex++;
	}
	if(rampIndex >= [ramps count])// || timeStep == 134)
	{
		[self ballDone:ball];
		ball = nil;
		[self loadBall];
		timeStep = 800;
		return;
	}
	
	int deltaX = [[ramps objectAtIndex:rampIndex] offsetForTime:timeStep];
	int x = ballX + deltaX;
		
	ball.center = CGPointMake(x,y);
	
	timeStep++;
}

- (UIImageView *)newBall
{
	if([balls count] == 0)
	{
		[self gameOverWithScore:score];
		return nil;
	}
	
	int num = [[balls lastObject] intValue];
	[balls removeLastObject];
	UIImageView *newBall = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@-cball.gif", [self colorFromNum:num]]]];
	newBall.center = CGPointMake(536, yvals[0]);
	newBall.tag = num + kBallTags;
	[self.view insertSubview:newBall aboveSubview:switch_2_lower];
	newBall.alpha = 0;
	[newBall release];
	return newBall;
}

- (void) loadBall
{
	if(ball != nil) return;
	
	ball = [self newBall];
	if(!ball) return;

	rampIndex = 0;
	ball.center = CGPointMake(536, yvals[0]);
	ballX = 536;
	
	[UIView beginAnimations:@"ShowBall" context:nil];
	[UIView setAnimationDuration:2];
	[UIView setAnimationBeginsFromCurrentState:YES];
	[UIView setAnimationCurve:UIViewAnimationCurveLinear];
	ball.alpha = 2.5;
	[UIView commitAnimations];
}

- (IBAction) dropBall
{
	if(timeStep != 800) return;
	ball.center = CGPointMake(536, yvals[0]);
	ballX = 536;
	timeStep = 0;
	
	[self setFirstOn:!bool_1];
	[self setSecondOn:!bool_2];
	[self setThirdOn:!bool_3];
	[self setFourthOn:!bool_4];
}

- (void) startTimer
{
	if(!timer)
	{
		[timer invalidate];
		timer = nil;
	}
	timer = [NSTimer scheduledTimerWithTimeInterval:(1/60.0) target:self
										   selector:@selector(update) userInfo:nil repeats:YES];
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
- (void) startGame
{
	bool_1 = true;
	bool_2 = true;
	bool_3 = true;
	bool_4 = true;
	timeStep = 800;
	timeMod = 0;
	score = 0;
	combo = 0;
	ball = nil;
	
	scoreLabel.hidden = YES;
	comboLabel.hidden = YES;
	
	if(mode == SCORE)
	{
		scoreLabel.hidden = NO;
		scoreLabel.text = @"SCORE: 0";
	}
	else if(mode == TIME)
	{
		scoreLabel.hidden = NO;
		scoreLabel.text = @"TIME: 0.0";
	}
	
	[self setupRamps];
	
	[self startTimer];
	
	[self loadBall];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    [super viewDidLoad];
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


- (void)dealloc
{
	for(int i = 0; i < 16; i++)
	{
		[[self.view viewWithTag:i + kBallTags] removeFromSuperview];
	}
	[balls release];
	[ramps release];
    [super dealloc];
}


@end
