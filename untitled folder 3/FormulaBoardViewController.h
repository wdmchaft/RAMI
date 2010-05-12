//
//  FormulaBoardViewController.h
//  RAMI
//
//  Created by Elliot Babchick on 5/2/10.
//  Copyright 2010 Stanford University. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GenericBoardVC.h"

@interface FormulaBoardViewController : GenericBoardVC
{
	IBOutlet UIImageView* binary_read_1;
	IBOutlet UIImageView* binary_read_2;
	IBOutlet UIImageView* binary_read_3;
	IBOutlet UIImageView* binary_read_4;
	IBOutlet UIImageView* binary_switch_1;
	IBOutlet UIImageView* binary_switch_2;
	IBOutlet UIImageView* binary_switch_3;
	IBOutlet UIImageView* binary_switch_4;
	IBOutlet UIImageView* switch_1_upper;
	IBOutlet UIImageView* switch_2_upper;
	IBOutlet UIImageView* switch_3_upper;
	IBOutlet UIImageView* switch_4_upper;
	BOOL bool_1;
	BOOL bool_2;
	BOOL bool_3;
	BOOL bool_4;
	IBOutlet UIButton* touchzone_1;
	IBOutlet UIButton* touchzone_2;
	IBOutlet UIButton* touchzone_3;
	IBOutlet UIButton* touchzone_4;
	
	UIImageView *car;
	int carX;
	int yvals[144];
	int rvals[144];
	NSMutableArray *cars;
}



@property IBOutlet (retain) UIImageView* binary_read_1;
@property IBOutlet (retain) UIImageView* binary_read_2;
@property IBOutlet (retain) UIImageView* binary_read_3;
@property IBOutlet (retain) UIImageView* binary_read_4;
@property IBOutlet (retain) UIImageView* binary_switch_1;
@property IBOutlet (retain) UIImageView* binary_switch_2;
@property IBOutlet (retain) UIImageView* binary_switch_3;
@property IBOutlet (retain) UIImageView* binary_switch_4;
@property IBOutlet (retain) UIImageView* switch_1_upper;
@property IBOutlet (retain) UIImageView* switch_2_upper;
@property IBOutlet (retain) UIImageView* switch_3_upper;
@property IBOutlet (retain) UIImageView* switch_4_upper;
@property IBOutlet (retain) UIButton* touchzone_1;
@property IBOutlet (retain) UIButton* touchzone_2;
@property IBOutlet (retain) UIButton* touchzone_3;
@property IBOutlet (retain) UIButton* touchzone_4;
-(IBAction) flip:(id)sender;

@end
