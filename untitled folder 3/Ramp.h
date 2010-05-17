//
//  Switch.h
//  PathFinder
//
//  Created by Will on 5/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Ramp : NSObject
{
	int xOffsets[144];
	int yStart;
	BOOL right;
}

@property (readonly) int yStart;
@property (readwrite, assign) BOOL right;

- (void) makeForPosition:(int)position;
- (int) offsetForTime:(int)timeStep;

@end
