//
//  RAMIAppDelegate.m
//  RAMI
//
//  Created by Elliot Babchick on 4/23/10.
//  Copyright Stanford University 2010. All rights reserved.
//

#import "RAMIAppDelegate.h"
#import "GameBoardViewController.h"
#import "FormulaBoardViewController.h"
#import "CasinoBoardViewController.h"

@implementation RAMIAppDelegate

@synthesize window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
    // Override point for customization after application launch
	CasinoBoardViewController* controller = [[CasinoBoardViewController alloc] initWithNibName:@"CasinoBoardViewController" bundle:nil];
	[window addSubview:controller.view];
	[window makeKeyAndVisible];
    
    return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
