//
//  Switch.m
//  PathFinder
//
//  Created by Will on 5/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CasinoRamp.h"


@implementation CasinoRamp

@synthesize yStart, right;

- (void) loadDictionary
{
	for(int i = 0; i < 12; i++)
	{
		float m = (536-536)/12.0;
		xOffsets[i] = 0 + m * i;
	}
	for(int i = 12; i < 36; i++)
	{
		float m = (536-370)/24.0;
		xOffsets[i] = 0 + m * (i-12);
	}
	for(int i = 36; i < 45; i++)
	{
		float m = (370-349)/9.0;
		xOffsets[i] = 166 + m * (i-36);
	}
	for(int i = 45; i < 57; i++)
	{
		float m = (349-349)/12.0;
		xOffsets[i] = 187 + m * (i-45);
	}
	for(int i = 57; i < 72; i++)
	{
		float m = (349-259)/15.0;
		xOffsets[i] = 0 + m * (i-57);
	}
	for(int i = 72; i < 84; i++)
	{
		float m = (259-259)/12.0;
		xOffsets[i] = 90 + m * (i-72);
	}
	for(int i = 84; i < 96; i++)
	{
		float m = (259-217)/12.0;
		xOffsets[i] = 0 + m * (i-84);
	}
	for(int i = 96; i < 108; i++)
	{
		float m = (217-217)/12.0;
		xOffsets[i] = 42 + m * (i-96);
	}
	for(int i = 108; i < 120; i++)
	{
		float m = (217-197)/12.0;
		xOffsets[i] = 0 + m * (i-108);
	}
	for(int i = 120; i < 128; i++)
	{
		float m = (197-197)/12.0;
		xOffsets[i] = 20 + m * (i-120);
	}
}

- (void) makeForPosition:(int)position
{
	[self loadDictionary];
	right = NO;
	switch(position)
	{
		case 0:
		{
			yStart = 0;
			break;
		}
		case 1:
		{
			yStart = 252;
			break;
		}
		case 2:
		{
			yStart = 367;
			break;
		}
		case 3:
		{
			yStart = 451;
			break;
		}
		case 4:
		{
			yStart = 526;
			break;
		}
		case 5:
		{
			yStart = 636;
			break;
		}
	}
}

- (int) offsetForTime:(int)timeStep
{
	if(timeStep >= 144) return -11339911;
	
	int sign = 1;
	if(!right) sign = -1;
	
	int value = xOffsets[timeStep];

	if(yStart == 451 && right)
		value += 6;
	if(yStart == 526 && right)
		value += 4;

	return sign * value;
}

@end
