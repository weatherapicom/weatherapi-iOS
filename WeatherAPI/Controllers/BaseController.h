//
//  HttpRequestFactory.h
//
#ifndef BASECONTROLLER
#define BASECONTROLLER

#import "UnirestClient.h"

@interface BaseController : NSObject

@property(readwrite, retain) id<IHttpClient> clientInstance;

/**
 * Default initialization to use the UnirestClient
 */
-(id) init;

/**
 * Custom initialization to use the user specified IHttpClient
 */
-(id) initWithHttpClient: (id<IHttpClient>) client;

@end

#endif