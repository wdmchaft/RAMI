//
//  PathFinderAppDelegate.h
//  PathFinder
//
//  Created by Will on 4/23/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PathFinderViewController;

@interface PathFinderAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PathFinderViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PathFinderViewController *viewController;

@end

