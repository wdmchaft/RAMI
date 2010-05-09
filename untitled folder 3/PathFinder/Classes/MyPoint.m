//
//  Point.m
//  PathFinder
//
//  Created by Will on 4/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyPoint.h"


@implementation MyPoint

@synthesize x,y;

- (id) initWithCGPoint:(CGPoint)p
{
	if(self = [super init])
	{
		[self makeFromCGPoint:p];
	}
	return self;
}

- (CGPoint) asCGPoint
{
	return CGPointMake(x,y);
}

- (void) makeFromCGPoint:(CGPoint)p
{
	x = p.x;
	y = p.y;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"%d, %d", x, y];
}

- (NSString *)saveStr
{
	return [NSString stringWithFormat:@"%d\%d", x, y];
}

+ (CGPoint) pointFromSaveStr:(NSString *)str
{
	NSArray *path = [str pathComponents];
	return CGPointMake([[path objectAtIndex:0] intValue], [[path objectAtIndex:1] intValue]);
}

@end
