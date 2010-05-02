//
//  GameBoardViewController.h
//  RAMI
//
//  Created by Elliot Babchick on 4/23/10.
//  Copyright 2010 Stanford University. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface GameBoardViewController : UIViewController {
	IBOutlet UIImageView* binary_read_1;
	IBOutlet UIImageView* binary_read_2;
	IBOutlet UIImageView* binary_read_3;
	IBOutlet UIImageView* binary_read_4;
	IBOutlet UIImageView* binary_switch_1;
	IBOutlet UIImageView* binary_switch_2;
	IBOutlet UIImageView* binary_switch_3;
	IBOutlet UIImageView* binary_switch_4;
	IBOutlet UIImageView* switch_1_upper;
	IBOutlet UIImageView* switch_1_lower;
	IBOutlet UIImageView* switch_2_upper;
	IBOutlet UIImageView* switch_2_lower;	
	IBOutlet UIImageView* switch_3_upper;
	IBOutlet UIImageView* switch_3_lower;	
	IBOutlet UIImageView* switch_4_upper;
	IBOutlet UIImageView* switch_4_lower;
	BOOL bool_1;
	BOOL bool_2;
	BOOL bool_3;
	BOOL bool_4;
	IBOutlet UIButton* touchzone_1;
	IBOutlet UIButton* touchzone_2;
	IBOutlet UIButton* touchzone_3;
	IBOutlet UIButton* touchzone_4;







}



@property IBOutlet UIImageView* binary_read_1;
@property IBOutlet UIImageView* binary_read_2;
@property IBOutlet UIImageView* binary_read_3;
@property IBOutlet UIImageView* binary_read_4;
@property IBOutlet UIImageView* binary_switch_1;
@property IBOutlet UIImageView* binary_switch_2;
@property IBOutlet UIImageView* binary_switch_3;
@property IBOutlet UIImageView* binary_switch_4;
@property IBOutlet UIImageView* switch_1_upper;
@property IBOutlet UIImageView* switch_1_lower;
@property IBOutlet UIImageView* switch_2_upper;
@property IBOutlet UIImageView* switch_2_lower;	
@property IBOutlet UIImageView* switch_3_upper;
@property IBOutlet UIImageView* switch_3_lower;	
@property IBOutlet UIImageView* switch_4_upper;
@property IBOutlet UIImageView* switch_4_lower;
@property IBOutlet UIButton* touchzone_1;
@property IBOutlet UIButton* touchzone_2;
@property IBOutlet UIButton* touchzone_3;
@property IBOutlet UIButton* touchzone_4;
-(IBAction) flip:(id)sender;

@end