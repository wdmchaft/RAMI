    //
//  FormulaBoardViewController.m
//  RAMI
//
//  Created by Elliot Babchick on 5/2/10.
//  Copyright 2010 Stanford University. All rights reserved.
//

#import "FormulaBoardViewController.h"
#import "FormulaRamp.h"


@implementation FormulaBoardViewController
@synthesize binary_read_1, binary_read_2, binary_read_3, binary_read_4;
@synthesize binary_switch_1, binary_switch_2, binary_switch_3, binary_switch_4;
@synthesize switch_1_upper, switch_2_upper,switch_3_upper,switch_4_upper;
@synthesize touchzone_1, touchzone_2, touchzone_3, touchzone_4;

- (CGPoint) winPosFromNum:(int)num
{
	num = num % 8;
	int v1 = 0;
	switch(num)
	{
		case 0:
		{
			v1 = 157;
			break;
		}
		case 1:
		{
			v1 = 205;
			break;
		}
		case 2:
		{
			v1 = 251;
			break;
		}
		case 3:
		{
			v1 = 299;
			break;
		}
		case 4:
		{
			v1 = 351;
			break;
		}
		case 5:
		{
			v1 = 399;
			break;
		}
		case 6:
		{
			v1 = 445;
			break;
		}
		case 7:
		{
			v1 = 493;
			break;
		}
	}
	return CGPointMake(v1,v1 + 384);
}

- (void) makeYVals
{
	for(int i = 0; i < 12; i++)
	{
		float m = (300-217)/12.0;
		yvals[i] = 217 + m * i;
	}
	for(int i = 12; i < 36; i++)
	{
		float m = (328-300)/24.0;
		yvals[i] = 300 + m * (i-12);
	}
	for(int i = 36; i < 48; i++)
	{
		float m = (361-328)/12.0;
		yvals[i] = 328 + m * (i-36);
	}
	for(int i = 48; i < 60; i++)
	{
		float m = (411-361)/12.0;
		yvals[i] = 361 + m * (i-48);
	}
	for(int i = 60; i < 72; i++)
	{
		float m = (432-411)/12.0;
		yvals[i] = 411 + m * (i-60);
	}
	for(int i = 72; i < 84; i++)
	{
		float m = (466-432)/12.0;
		yvals[i] = 432 + m * (i-72);
	}
	for(int i = 84; i < 96; i++)
	{
		float m = (500-466)/12.0;
		yvals[i] = 466 + m * (i-84);
	}
	for(int i = 96; i < 108; i++)
	{
		float m = (536-500)/12.0;
		yvals[i] = 500 + m * (i-96);
	}
	for(int i = 108; i < 120; i++)
	{
		float m = (585-536)/12.0;
		yvals[i] = 536 + m * (i-108);
	}
	for(int i = 120; i < 132; i++)
	{
		float m = (623-585)/12.0;
		yvals[i] = 585 + m * (i-120);
	}
	for(int i = 132; i < 144; i++)
	{
		float m = (636-623)/12.0;
		yvals[i] = 623 + m * (i-132);
	}
}

//517,217 - 517,286
//517,286 - 358,328
//358,328 - 325,361
//325,361 - 325,397
//325,397 - 257,432
//257,432 - 228,466
//228,466 - 228,500
//228,500 - 181,536
//181,536 - 181,585
//181,585 - 157,623
//157,623 - 157,636

//286 : 23
//397 : 60
//487 : 90
//571 : 118
//636 : 143

- (void) makeRVals
{
	for(int i = 0; i <= 12; i++)
	{
		rvals[i] = 0;
	}
	for(int i = 13; i < 19; i++)
	{
		rvals[i] = rvals[i-1] + 15;
	}
	for(int i = 19; i < 32; i++)
	{
		rvals[i] = rvals[i-1];
	}
	for(int i = 32; i < 50; i++)
	{
		rvals[i] = rvals[i-1] - 5;
	}
	for(int i = 50; i < 61; i++)
	{
		rvals[i] = rvals[i-1];
	}
	for(int i = 61; i < 67; i++)
	{
		rvals[i] = rvals[i-1] + 15;
	}
	for(int i = 67; i < 85; i++)
	{
		rvals[i] = rvals[i-1] - 5;
	}
	for(int i = 85; i < 96; i++)
	{
		rvals[i] = rvals[i-1];
	}
	for(int i = 97; i < 103; i++)
	{
		rvals[i] = rvals[i-1] + 15;
	}
	for(int i = 103; i < 112; i++)
	{
		rvals[i] = rvals[i-1] - 10;
	}
	for(int i = 112; i < 121; i++)
	{
		rvals[i] = rvals[i-1];
	}
	for(int i = 121; i < 126; i++)
	{
		rvals[i] = rvals[i-1] + 8;
	}
	for(int i = 126; i < 128; i++)
	{
		rvals[i] = rvals[i-1];
	}
	for(int i = 128; i < 133; i++)
	{
		rvals[i] = rvals[i-1] - 8;
	}
	for(int i = 133; i < 144; i++)
	{
		rvals[i] = rvals[i-1];
	}
}

- (void) setFirstOn:(BOOL)isOn
{
	if(timeStep > 19) return;
	[[ramps objectAtIndex:1] setRight:isOn];
}

- (void) setSecondOn:(BOOL)isOn
{
	if(timeStep > 67) return;
	[[ramps objectAtIndex:2] setRight:isOn];
}

- (void) setThirdOn:(BOOL)isOn
{
	if(timeStep > 103) return;
	[[ramps objectAtIndex:3] setRight:isOn];
}

- (void) setFourthOn:(BOOL)isOn
{
	if(timeStep > 132) return;
	[[ramps objectAtIndex:4] setRight:isOn];
}

- (void) setupRamps
{
	[self makeYVals];
	[self makeRVals];
	ramps = [[NSMutableArray alloc] init];
	for(int i = 0; i < 5; i++)
	{
		FormulaRamp *ramp = [[FormulaRamp alloc] init];
		[ramp makeForPosition:i];
		[ramps addObject:ramp];
		[ramp release];
	}
	
	for(int i = 0; i < 16; i++)
		cups[i] = 0;
	
	car.center = CGPointMake(517, yvals[0]);
	carX = 517;
	
	cars = [[NSMutableArray alloc] initWithCapacity:32];
	for(int i = 0; i < 32; i++)
		[cars addObject:[NSNumber numberWithInt:i%8]];
	for(int i = 0; i < 100; i++)
		[cars exchangeObjectAtIndex:(arc4random() % 32) withObjectAtIndex:(arc4random() % 32)];
}

- (void) removeLoser:(NSTimer *)atimer
{
	UIImageView *acar = [atimer userInfo];
	[acar removeFromSuperview];
}

- (void) shiftLoser:(NSTimer *)atimer
{
	UIImageView *acar = [atimer userInfo];
	[UIView beginAnimations:@"SlideOverLoser" context:nil];
	[UIView setAnimationDuration:3];
	[UIView setAnimationBeginsFromCurrentState:YES];
	[UIView setAnimationCurve:UIViewAnimationCurveLinear];
	acar.center = CGPointMake(970, acar.center.y);
	acar.alpha = -2;
	[UIView commitAnimations];
	[NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(removeLoser:) userInfo:acar repeats:NO];
}

- (void) carDone:(UIImageView *)acar
{
	CGPoint goal = [self winPosFromNum:acar.tag-kBallTags];
	if(acar.center.x == goal.x || acar.center.x == goal.y)
	{
		int cupNum = acar.tag-kBallTags;
		if(acar.center.x == goal.y)
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
				acar.center = CGPointMake(acar.center.x, acar.center.y + 24);
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
		[UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
		acar.transform = CGAffineTransformMakeRotation(-M_PI/2);
		acar.center = CGPointMake(acar.center.x, acar.center.y + 70);
		[UIView commitAnimations];
		
		if(mode == TIME)
		{
			score += 50;
		}
		
		[NSTimer scheduledTimerWithTimeInterval:.4 target:self selector:@selector(shiftLoser:) userInfo:acar repeats:NO];
		
		if(mode == TIME)
			[cars insertObject:[NSNumber numberWithInt:acar.tag-kBallTags] atIndex:0];
		else if(mode == SCORE)
		{
			comboLabel.hidden = YES;
			combo = 0;
			timeMod = 0;
		}
	}
	
	if(mode == PRACTICE)
		[cars insertObject:[NSNumber numberWithInt:acar.tag-kBallTags] atIndex:0];
}

- (void) update
{
	[super update];
	
	if(timeStep > 144 || car == nil) return;
	
	int y = yvals[timeStep];
	if(timeStep >= 144 || (rampIndex+1 < [ramps count] && y >= [[ramps objectAtIndex:rampIndex+1] yStart]))
	{
		carX = car.center.x;
		rampIndex++;
	}
	if(rampIndex >= [ramps count])// || timeStep == 134)
	{
		[self carDone:car];
		car = nil;
		[self loadCar];
		timeStep = 800;
		return;
	}
	
	int deltaX = [[ramps objectAtIndex:rampIndex] offsetForTime:timeStep];
	int x = carX + deltaX;
	
	int rot = rvals[timeStep];

	if(deltaX > 0)
		rot *= -1;		
	
	car.center = CGPointMake(x,y);
	car.transform = CGAffineTransformMakeRotation(rot * M_PI/180);
	
	timeStep++;
}

- (UIImageView *)newCar
{
	if([cars count] == 0)
	{
		[self gameOverWithScore:score];
		return nil;
	}
	
	int num = [[cars lastObject] intValue];
	[cars removeLastObject];
	UIImageView *newCar = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@ car.gif", [self colorFromNum:num]]]];
	newCar.center = CGPointMake(517, yvals[0]);
	newCar.tag = num + kBallTags;
	[self.view insertSubview:newCar aboveSubview:binary_switch_1];
	newCar.alpha = 0;
	[newCar release];
	return newCar;
}

- (void) loadCar
{
	if(car != nil) return;
	
	car = [self newCar];
	if(!car) return;
	
	rampIndex = 0;
	car.center = CGPointMake(517, yvals[0]);
	carX = 517;
	
	[UIView beginAnimations:@"ShowCar" context:nil];
	[UIView setAnimationDuration:2];
	[UIView setAnimationBeginsFromCurrentState:YES];
	[UIView setAnimationCurve:UIViewAnimationCurveLinear];
	car.alpha = 2.5;
	[UIView commitAnimations];
}

- (IBAction) dropBall
{
	if(timeStep != 800) return;
	car.center = CGPointMake(517, yvals[0]);
	carX = 517;
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
	car = nil;
	
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
	
	[self loadCar];
}

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
			[self setFirstOn:!bool_1];
			
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
			[self setSecondOn:!bool_2];
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
			[self setThirdOn:!bool_3];
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
	[cars release];
	[ramps release];
    [super dealloc];
}


@end
