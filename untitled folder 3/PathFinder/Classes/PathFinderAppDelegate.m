//
//  PathFinderAppDelegate.m
//  PathFinder
//
//  Created by Will on 4/23/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "PathFinderAppDelegate.h"
#import "PathFinderViewController.h"

@implementation PathFinderAppDelegate

@synthesize window;
@synthesize viewController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];

	return YES;
}

- (void) applicationWillTerminate:(UIApplication *)application
{
	[viewController save];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
