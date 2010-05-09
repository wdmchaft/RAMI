//
//  MyButton.m
//  PathFinder
//
//  Created by Will on 5/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyButton.h"
#import "DetailVC.h"

@implementation MyButton

@synthesize delegate;

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)e
{
	self.highlighted = YES;
	[delegate setSelectedTag:self.tag];
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)e
{
	UITouch *t = [touches anyObject];
	CGPoint p = [t locationInView:self.superview];
	self.center = p;
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)e
{
	NSLog(@"End");
	[delegate doneMoving:self];
}

- (void) deselect
{
	self.highlighted = NO;
}

@end
