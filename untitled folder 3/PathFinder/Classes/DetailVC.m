    //
//  DetailVC.m
//  PathFinder
//
//  Created by Will on 5/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "DetailVC.h"

#import "MyPoint.h"
#import "MyButton.h"

@implementation DetailVC
@synthesize delegate, selectedTag;

#define kPointSize 10

- (void) viewWillAppear:(BOOL)animated
{
	myPoints = [[NSMutableArray alloc] init];
}

- (void) load
{
	selectedTag = -1;
	
	while([[drawView subviews] count] > 0)
	{
		[[[drawView subviews] objectAtIndex:0] removeFromSuperview];
	}
	
	[myPoints removeAllObjects];
	[myPoints addObjectsFromArray:delegate.points];
	
	mins = CGPointMake(10000,10000);
	CGPoint maxs = CGPointMake(-1000,-1000);
	
	for(MyPoint *p in myPoints)
	{
		if(p.x < mins.x) mins.x = p.x;
		if(p.x > maxs.x) maxs.x = p.x;
		if(p.y < mins.y) mins.y = p.y;
		if(p.y > maxs.y) maxs.y = p.y;
	}
	
	CGPoint size = CGPointMake(maxs.x - mins.x, maxs.y - mins.y);
	pWidth.text = [NSString stringWithFormat:@"%d", (int)size.x];
	pHeight.text = [NSString stringWithFormat:@"%d", (int)size.y];
	
	float scaleX = drawView.frame.size.width/size.x;
	float scaleY = drawView.frame.size.height/size.y;
	scale = MIN(scaleX, scaleY);
	
	int count = 1;
	for(MyPoint *p in myPoints)
	{
		p.x -= mins.x;
		p.y -= mins.y;
		p.x *= scale;
		p.y *= scale;
		
		MyButton *b = [self newButton:[p asCGPoint]];
		b.tag = count++;
		[drawView addSubview:b];
	}
}

- (MyButton *) newButton:(CGPoint)pos
{
	MyButton *b = [[[MyButton alloc] init] autorelease];
	b.delegate = self;
	[b setImage:[UIImage imageNamed:@"unselected.png"] forState:UIControlStateNormal];
	[b setImage:[UIImage imageNamed:@"selected.png"] forState:UIControlStateHighlighted];
	b.frame = CGRectMake(pos.x-kPointSize/2,pos.y-kPointSize/2, kPointSize, kPointSize);
	return b;
}

- (IBAction) deleteHit
{
	if(selectedTag == -1) return;

	[[self.view viewWithTag:selectedTag] setHidden:YES];
	//[myPoints removeObjectAtIndex:selectedTag-1];
	//[[self.view viewWithTag:selectedTag] removeFromSuperview];
	
	selectedTag = -1;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	if(selectedTag == -1) return;
	
	[((MyButton *)[self.view viewWithTag:selectedTag]) deselect];
	selectedTag = -1;
}

- (void) doneMoving:(MyButton *)sender
{
	[[myPoints objectAtIndex:(sender.tag-1)] setX:sender.center.x];
	[[myPoints objectAtIndex:(sender.tag-1)] setY:sender.center.y];
}

- (IBAction) doneHit
{
	for(MyPoint *p in myPoints)
	{
		p.x /= scale;
		p.y /= scale;
		p.x += mins.x;
		p.y += mins.y;
	}
	
	[delegate.points removeAllObjects];
	[delegate.points addObjectsFromArray:myPoints];
	
	for(int i = [myPoints count]; i > 0; i--)
	{
		if([self.view viewWithTag:i].hidden)
			[delegate.points removeObjectAtIndex:i-1];
	}
		
	[delegate detailDone];
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
	[myPoints release];
    [super dealloc];
}


@end
