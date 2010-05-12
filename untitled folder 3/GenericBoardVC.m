    //
//  GenericBoardVC.m
//  RAMI
//
//  Created by Will on 5/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "GenericBoardVC.h"


@implementation GenericBoardVC

@synthesize mode;

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if(self = [super initWithNibName:nibNameOrNil bundle:nil])
	{
		serverComm = [[ServerComm alloc] initWithUFL:nil];
		serverComm.delegate = self;
	}
	
	return self;
}

- (NSString *) colorFromNum:(int)num
{
	num = num % 8;
	switch(num)
	{
		case 0:
			return @"red";
		case 1:
			return @"green";
		case 2:
			return @"purple";
		case 3:
			return @"blue";
		case 4:
			return @"pink";
		case 5:
			return @"orange";
		case 6:
			return @"yellow";
		case 7:
			return @"brown";
	}
	
	return nil;
}

- (void) startGame
{
	//Overridden by subclasses
}

- (void) submitHighScore:(int)ascore withName:(NSString *)name
{
	NSString *udid = [UIDevice currentDevice].uniqueIdentifier;
	[serverComm scriptServer:[NSString stringWithFormat:@"something.php?name=%@&score=%d&mode=%d&udid=%@", name, ascore, mode, udid]];
}

- (void) gameOverWithScore:(int)score
{
	NSLog(@"GAME OVER CALLED");
}

-(IBAction) dropBall
{
	//Overridden by subclasses
}

- (void) update
{
	if(mode == TIME)
	{
		timeMod++;
		if(timeMod % 6 == 0)
		{
			timeMod = 0;
			score++;
			scoreLabel.text = [NSString stringWithFormat:@"TIME: %d.%d", score/10, score % 10];
		}
	}
	else if(mode == SCORE && timeMod > 0)
	{
		timeMod--;
		if(timeMod == 0)
		{
			combo = 0;
			comboLabel.hidden = YES;
		}
	}
}

- (void) dataLoaded:(NSArray *)data
{
	
}

- (void)dealloc
{
	[serverComm release];
    [super dealloc];
}


@end
