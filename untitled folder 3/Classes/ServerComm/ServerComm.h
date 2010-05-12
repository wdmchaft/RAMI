//
//  ServerComm.h
//
//  Created by Will on 8/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ServerCommDelegate;

enum DebugMode
{
	OFF,
	ON,
	GHOST
};

@interface ServerComm : NSObject
{
	id <ServerCommDelegate> delegate;

	enum DebugMode debugMode;
	int netState;
	NSString *url;
	NSMutableData *receivedData;
	NSArray *data;
}

@property (assign) id <ServerCommDelegate> delegate;
@property (assign) enum DebugMode debugMode;
@property (readwrite, assign) NSArray *data;

- (id)initWithUFL:(NSString *)newURL;

- (void)scriptServer:(NSString *) script;
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;
- (void)connectionDidFinishLoading:(NSURLConnection *)connection;

@end



@protocol ServerCommDelegate
- (void) dataLoaded:(NSArray *)data;
@end
