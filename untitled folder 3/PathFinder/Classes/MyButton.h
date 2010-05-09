//
//  MyButton.h
//  PathFinder
//
//  Created by Will on 5/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DetailVC;

@interface MyButton : UIButton
{
	DetailVC *delegate;
}

@property (assign) DetailVC *delegate;

- (void) deselect;

@end
