//
//  RAMIAppDelegate.h
//  RAMI
//
//  Created by Elliot Babchick on 4/23/10.
//  Copyright Stanford University 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RAMIAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

