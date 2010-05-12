//
//  Switch.m
//  PathFinder
//
//  Created by Will on 5/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FormulaRamp.h"


@implementation FormulaRamp

@synthesize yStart, right;

- (void) loadDictionary
{
	for(int i = 0; i < 12; i++)
	{
		float m = (517-517)/12.0;
		xOffsets[i] = 0 + m * i;
	}
	for(int i = 12; i < 36; i++)
	{
		float m = (517-358)/24.0;
		xOffsets[i] = 0 + m * (i-12);
	}
	for(int i = 36; i < 48; i++)
	{
		float m = (358-325)/12.0;
		xOffsets[i] = 159 + m * (i-36);
	}
	for(int i = 48; i < 60; i++)
	{
		float m = (325-325)/12.0;
		xOffsets[i] = 192 + m * (i-48);
	}
	for(int i = 60; i < 72; i++)
	{
		float m = (325-257)/12.0;
		xOffsets[i] = 0 + m * (i-60);
	}
	for(int i = 72; i < 84; i++)
	{
		float m = (257-228)/12.0;
		xOffsets[i] = 68 + m * (i-72);
	}
	for(int i = 84; i < 96; i++)
	{
		float m = (228-228)/12.0;
		xOffsets[i] = 97 + m * (i-84);
	}
	for(int i = 96; i < 108; i++)
	{
		float m = (228-181)/12.0;
		xOffsets[i] = 0 + m * (i-96);
	}
	for(int i = 108; i < 120; i++)
	{
		float m = (181-181)/12.0;
		xOffsets[i] = 47 + m * (i-108);
	}
	for(int i = 120; i < 132; i++)
	{
		float m = (181-157)/12.0;
		xOffsets[i] = 0 + m * (i-120);
	}
	for(int i = 132; i < 144; i++)
	{
		float m = (157-157)/12.0;
		xOffsets[i] = 24 + m * (i-132);
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
			yStart = 300;
			break;
		}
		case 2:
		{
			yStart = 411;
			break;
		}
		case 3:
		{
			yStart = 500;
			break;
		}
		case 4:
		{
			yStart = 585;
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

	return sign * value;
}

@end
