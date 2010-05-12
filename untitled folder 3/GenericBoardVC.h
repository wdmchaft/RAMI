//
//  GenericBoardVC.h
//  RAMI
//
//  Created by Will on 5/11/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServerComm.h"

typedef enum Mode
{
	SCORE,
	TIME,
	BINARY,
	PRACTICE
} Mode;

#define kBallTags 1300

@interface GenericBoardVC : UIViewController <ServerCommDelegate>
{
	Mode mode;
	ServerComm *serverComm;
	
	IBOutlet UILabel *scoreLabel, *comboLabel;
	int score;
	int combo;
	int timeMod;
	int cups[16];
	int timeStep;
	int rampIndex;
	NSTimer *timer;
	NSMutableArray *ramps;
}

@property Mode mode;

- (void) startGame;
- (void) submitHighScore:(int)score withName:(NSString *)name;
- (void) gameOverWithScore:(int)score;
-(IBAction) dropBall;
- (void) update;

@end
