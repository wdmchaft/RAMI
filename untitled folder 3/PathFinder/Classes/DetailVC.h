//
//  DetailVC.h
//  PathFinder
//
//  Created by Will on 5/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PathFinderViewController.h"

@class MyButton;

@interface DetailVC : UIViewController
{
	PathFinderViewController *delegate;
	NSMutableArray *myPoints;
	int selectedTag;
	CGPoint mins;
	float scale;
	
	IBOutlet UIButton *doneButton;
	IBOutlet UILabel *pWidth, *pHeight;
	IBOutlet UIView *drawView;
}

@property int selectedTag;
@property (assign) PathFinderViewController *delegate;

- (void) load;
- (MyButton *) newButton:(CGPoint)pos;
- (IBAction) deleteHit;
- (IBAction) doneHit;

- (void) doneMoving:(MyButton *)sender;

@end
