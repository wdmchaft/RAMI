//
//  ServerComm.m
//
//  Created by Will on 8/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ServerComm.h"


@implementation ServerComm

@synthesize data;
@synthesize debugMode;
@synthesize delegate;

- (id) init
{
	return [self initWithGame:@"SkiDB"];
}

- (id) initWithUFL:(NSString *)newURL
{
	if(self = [super init])
	{
		debugMode = OFF;
		netState = 0;
		url = [newURL retain];
	}
	
	return self;
}

- (void) scriptServer:(NSString *) script
{
	if(debugMode != OFF)
	{
		NSLog(@"%@", script);
		if(debugMode != GHOST)
			return;
	}

	if(netState == 0)
	{
		netState = 1;
		
		NSURL *urlToUse = [NSURL URLWithString:url];
		if(script)
			urlToUse = [NSURL URLWithString: [NSString stringWithFormat:@"%@/%@", url, script]];

		NSURLRequest *theRequest=
		[NSURLRequest
		 requestWithURL:urlToUse
		 cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
		
		NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
		
		if(theConnection)
		{
			[receivedData setLength:0];
			receivedData=[[NSMutableData data] retain];
			[data release];
			data = nil;
		}
		else
		{
			netState = 0;
			// inform the user that the download could not be made
		}
	}
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	if(netState == 1)
	{
		netState = 2;
		[receivedData setLength:0];
	}
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)nData
{
	if(netState == 2)
	{
		netState = 3;
		[receivedData appendData:nData];
	}
}

//UUID: [UIDevice currentDevice].uniqueID

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	if(netState == 3)
	{
		[receivedData release];
		[connection release];
		netState = 0;
		
		// inform the user
		NSLog(@"Connection failed! Error - %@ %@",
			  [error localizedDescription],
			  [[error userInfo] objectForKey:NSErrorFailingURLStringKey]);
	}
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	if(netState == 3)
	{
		NSString *result = [[NSString alloc] initWithBytes:[receivedData mutableBytes] length:[receivedData length] encoding:NSUTF8StringEncoding];
		
		NSArray *serverMsg = [NSArray arrayWithArray:[result componentsSeparatedByString:@"::"]];
		
		if(debugMode != OFF)
		{
			NSLog(@"%@", serverMsg);
			if(debugMode != GHOST)
			{
				[connection release];
				[receivedData release];
				[result release];
				return;
			}
		}
		
		data = [serverMsg retain];
		
		[connection release];
		[receivedData release];
		receivedData = nil;
		netState = 0;
		[result release];
		
		[delegate dataLoaded:data];
	}
}


- (void) dealloc
{
	[url release];
	[receivedData release];
	[data release];
	[super dealloc];
}

@end
