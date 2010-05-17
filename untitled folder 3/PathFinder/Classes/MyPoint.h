//
//  Point.h
//  PathFinder
//
//  Created by Will on 4/23/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MyPoint : NSObject
{
	int x,y;
}

@property int x,y;

- (id) initWithCGPoint:(CGPoint)p;
- (CGPoint) asCGPoint;
- (void) makeFromCGPoint:(CGPoint)p;

- (NSString *)saveStr;
+ (CGPoint) pointFromSaveStr:(NSString *)str;

@end
