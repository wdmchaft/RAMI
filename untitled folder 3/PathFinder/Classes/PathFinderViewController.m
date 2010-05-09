//
//  PathFinderViewController.m
//  PathFinder
//
//  Created by Will on 4/23/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "PathFinderViewController.h"
#import "MyPoint.h"
#import "DetailVC.h"
#import "Ramp.h"

@implementation PathFinderViewController

@synthesize points;

- (void) loadD
{
	detailVC = [[DetailVC alloc] initWithNibName:@"DetailVC" bundle:nil];
	detailVC.delegate = self;
	[detailVC loadView];
	detailVC.view;
	[detailVC viewWillAppear:NO];
	
	[self runRamps];
}

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
	yvals[131] = 571;
	yvals[132] = 576;
	yvals[133] = 581;
	yvals[134] = 582;
	yvals[135] = 588;
	yvals[136] = 590;
	yvals[137] = 594;
	yvals[138] = 598;
	yvals[139] = 604;
	yvals[140] = 609;
	yvals[141] = 615;
	yvals[142] = 623;
	yvals[143] = 627;
}

- (void) runPath1
{
	NSMutableArray *arr = [[NSMutableArray alloc] init];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(527, 256)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(526, 261)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(526, 264)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(527, 266)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(527, 269)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(526, 273)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(524, 275)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(524, 277)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(522, 279)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(517, 281)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(512, 282)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(510, 284)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(507, 285)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(506, 288)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(506, 290)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(506, 294)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(505, 300)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(503, 304)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(500, 309)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(498, 313)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(494, 318)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(486, 324)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(484, 327)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(476, 328)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(467, 330)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(463, 330)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(459, 331)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(455, 331)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(451, 331)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(447, 331)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(447, 331)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(443, 332)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(429, 332)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(425, 332)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(425, 332)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(425, 332)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(421, 333)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(417, 333)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(413, 333)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(409, 334)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(409, 334)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(405, 335)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(401, 335)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(397, 335)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(393, 336)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(393, 336)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(389, 337)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(389, 337)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(385, 338)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(381, 338)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(379, 339)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(376, 340)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(373, 340)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(370, 340)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(369, 343)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(365, 346)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(363, 347)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(362, 349)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(362, 352)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(360, 353)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(358, 354)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(356, 357)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(354, 360)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(354, 362)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(352, 365)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(352, 366)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(351, 369)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(351, 371)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(351, 373)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(350, 375)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(348, 378)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(348, 380)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(347, 381)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(342, 382)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(340, 383)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(339, 384)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(337, 388)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(334, 389)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(331, 391)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(330, 394)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(330, 398)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(330, 401)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(330, 404)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(330, 406)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(328, 411)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(327, 415)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(324, 418)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(323, 421)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(322, 423)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(320, 425)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(318, 426)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(312, 432)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(307, 434)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(304, 434)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(299, 434)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(294, 434)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(288, 436)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(282, 438)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(279, 438)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(277, 441)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(275, 444)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(273, 447)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(271, 449)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(271, 451)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(268, 456)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(266, 460)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(264, 464)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(261, 468)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(260, 473)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(260, 480)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(258, 483)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(253, 488)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(249, 490)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(245, 494)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(242, 497)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(242, 501)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(242, 506)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(240, 510)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(240, 514)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(239, 521)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(235, 524)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(232, 528)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(231, 531)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(228, 534)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(226, 539)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(226, 544)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(224, 548)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(222, 552)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(222, 558)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(219, 563)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(218, 567)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(218, 571)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(216, 576)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(212, 581)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(208, 582)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(206, 588)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(202, 590)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(200, 594)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(200, 598)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(198, 604)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(195, 609)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(192, 615)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(192, 623)]];
	[arr addObject:[NSValue valueWithCGPoint:CGPointMake(192, 627)]];
	[points addObjectsFromArray:arr];
	[arr release];
}

- (void) setFirstOn:(BOOL)isOn
{
	[[ramps objectAtIndex:1] setRight:isOn];
	[[ramps objectAtIndex:2] setRight:isOn];
	[[ramps objectAtIndex:8] setRight:isOn];
}

- (void) setSecondOn:(BOOL)isOn
{
	[[ramps objectAtIndex:3] setRight:isOn];
	[[ramps objectAtIndex:4] setRight:isOn];
}

- (void) setThirdOn:(BOOL)isOn
{
	[[ramps objectAtIndex:5] setRight:isOn];
	[[ramps objectAtIndex:6] setRight:isOn];
}

- (void) setFourthOn:(BOOL)isOn
{
	[[ramps objectAtIndex:7] setRight:isOn];
}

- (void) runRamps
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
	
	ons[0] = ons[1] = ons[2] = ons[3] = NO;
	ball.center = CGPointMake(530, yvals[0]);
	ballX = 530;
}

- (void) viewDidLoad
{
	[NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(loadD) userInfo:nil repeats:NO];
	
	points = [[NSMutableArray alloc] init];
	curPoints = [[NSMutableArray alloc] init];
	
	return;
	
	NSMutableArray *a = [[NSUserDefaults standardUserDefaults] objectForKey:@"pointsArr"];
	for(NSString *str in a)
	{
		MyPoint *p = [[MyPoint alloc] initWithCGPoint:[MyPoint pointFromSaveStr:str]];
		[points addObject:p];
		[p release];
	}
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	CGPoint p = [[touches anyObject] locationInView:self.view];
	//ball.center = p;
	
	if(p.y < 300)
	{	
		ons[0] = !ons[0];
		[self setFirstOn:ons[0]];
		NSLog(@"First Switch is: %d", ons[0]);
	}
	else if(p.y < 400)
	{
		ons[1] = !ons[1];
		[self setSecondOn:ons[1]];
		NSLog(@"Second Switch is: %d", ons[1]);
	}
	else if(p.y < 500)
	{
		ons[2] = !ons[2];
		[self setThirdOn:ons[2]];
		NSLog(@"Third Switch is: %d", ons[2]);
	}
	else if(p.y < 600)
	{
		ons[3] = !ons[3];
		[self setFourthOn:ons[3]];
		NSLog(@"Fourth Switch is: %d", ons[3]);
	}
	
	if(recording.on)
		[curPoints removeAllObjects];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	CGPoint p = [[touches anyObject] locationInView:self.view];
	p;
	//return;
	//ball.center = p;
	if(p.y > 255 && recording.on)
	{
		MyPoint *myP = [[MyPoint alloc] initWithCGPoint:p];
		[curPoints addObject:myP];
		[myP release];
	}
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	CGPoint p = [[touches anyObject] locationInView:self.view];
	
	if(p.y < 200) return;
	if(!recording.on) return;
	
	if([points count] == 0)
		[points addObjectsFromArray:curPoints];
	else
	{
		while([curPoints count] > [points count])
		{
			[curPoints removeObjectAtIndex:(arc4random() % [curPoints count])];
		}
		while([curPoints count] < [points count])
		{
			int index = arc4random() % ([curPoints count]-1);
			CGPoint p1 = [[curPoints objectAtIndex:index] asCGPoint];
			CGPoint p2 = [[curPoints objectAtIndex:index+1] asCGPoint];
			MyPoint *newP = [[MyPoint alloc] initWithCGPoint:CGPointMake((p1.x + p2.x)/2, (p1.y + p2.y)/2)];
			[curPoints insertObject:newP atIndex:index+1];
			[newP release];
		}
		
		for(int i = 0; i < [points count]; i++)
		{
			CGPoint cP = [[curPoints objectAtIndex:i] asCGPoint];
			CGPoint pP = [[points objectAtIndex:i] asCGPoint];
			CGPoint aP = CGPointMake((cP.x + pP.x)/2, (cP.y + pP.y)/2);
			[[points objectAtIndex:i] setX:aP.x];
			[[points objectAtIndex:i] setY:aP.y];
		}
	}
}

- (void) update
{
	int y = yvals[timeStep];
	if(timeStep >= 144 || (rampIndex+1 < [ramps count] && y >= [[ramps objectAtIndex:rampIndex+1] yStart]))
	{
		ballX = ball.center.x;
		rampIndex++;
	}
	if(rampIndex == [ramps count])
	{
		[timer invalidate];
		return;
	}
	
	int x = ballX + [[ramps objectAtIndex:rampIndex] offsetForTime:timeStep++];
		
	ball.center = CGPointMake(x,y);
		
	//CGPoint p = [[points objectAtIndex:timeStep] CGPointValue];//[[points objectAtIndex:timeStep] asCGPoint];	
	//NSLog(@"%.2f, %.2f", p.x, p.y);
	//p.x += xOff.value;
	//p.y += yOff.value;
	//ball.center = p;
	//timeStep+= (int)gran.value;
	
	//if(timeStep >= [points count] || (input.text && ball.center.y >= [input.text intValue]))
	//	[timer invalidate];
}

- (IBAction) clearHit
{
	[points removeAllObjects];
}

- (IBAction) printHit
{
	NSMutableString *pointsStr = [[NSMutableString alloc] initWithString:@"\n"];
	for(int i = 0; i < [points count]; i++)
	{
		MyPoint *p = [points objectAtIndex:i];
		[pointsStr appendFormat:@"CGPointMake(%d, %d);\n", (int)p.x, (int)p.y];
	}
	
	NSLog(@"%@", pointsStr);
	[pointsStr release];
}

- (IBAction) playHit
{
	//if([points count] == 0) return;
	
	rampIndex = 0;
	ball.center = CGPointMake(530, yvals[0]);
	ballX = 530;
	//[self runRamps];
	timeStep = 0;
	timer = [NSTimer scheduledTimerWithTimeInterval:((1/15.0) * (1 - playSpeed.value)) target:self
										   selector:@selector(update) userInfo:nil repeats:YES];
}

- (IBAction) detailHit
{
	[self.view addSubview:detailVC.view];
	[detailVC load];
}

- (IBAction) granChanged
{
	granLabel.text = [NSString stringWithFormat:@"Granularity: %d", (int)gran.value];
}

- (IBAction) xChanged
{
	xLabel.text = [NSString stringWithFormat:@"X: %.1f", xOff.value];
}

- (IBAction) yChanged
{
	yLabel.text = [NSString stringWithFormat:@"Y: %.1f", yOff.value];
}

- (void) save
{
	NSMutableArray *a = [[NSMutableArray alloc] init];
	for(MyPoint *p in points)
	{
		[a addObject:[p saveStr]];
	}
	[[NSUserDefaults standardUserDefaults] setObject:a forKey:@"pointsArr"];
	[a release];
}

- (void) detailDone
{
	[detailVC.view removeFromSuperview];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (BOOL)textFieldShouldReturn:(UITextField*)textField
{
	[textField resignFirstResponder];
	return YES;
}

- (void)dealloc
{
	[detailVC release];
	[points release];
	[curPoints release];
    [super dealloc];
}

@end
