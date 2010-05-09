//
//  PathFinderViewController.h
//  PathFinder
//
//  Created by Will on 4/23/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailVC;

@interface PathFinderViewController : UIViewController <UITextFieldDelegate>
{
	IBOutlet UIImageView *ball;
	IBOutlet UISwitch *recording;
	IBOutlet UISlider *playSpeed, *gran, *xOff, *yOff;
	IBOutlet UILabel *granLabel, *xLabel, *yLabel;
	IBOutlet UITextField *input;
	
	DetailVC *detailVC;
	NSTimer *timer;
	int timeStep;
	
	//*****
	BOOL ons[4];
	int rampIndex;
	int yvals[144];
	NSMutableArray *ramps;
	int ballX;
	
	NSMutableArray *points;
	NSMutableArray *curPoints;
}

@property (readwrite, assign) NSMutableArray *points;

- (IBAction) clearHit;
- (IBAction) printHit;
- (IBAction) playHit;
- (IBAction) detailHit;
- (IBAction) granChanged;
- (IBAction) xChanged;
- (IBAction) yChanged;

- (void) runRamps;

- (void) save;
- (void) detailDone;

@end

