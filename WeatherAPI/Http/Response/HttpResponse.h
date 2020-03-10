//
//  HttpResponse.h
//
#ifndef HTTPRESPONSE
#define HTTPRESPONSE

#import <Foundation/Foundation.h>

@interface HttpResponse : NSObject

/**
 * HTTP Status code of the http response
 */
@property NSInteger statusCode;

/**
 * Headers of the http response
 */
@property NSDictionary* headers;

/**
 * Raw body of the http response
 */
@property NSData* rawBody;

/**
 * @param   code    The HTTP status code
 * @param   headers The HTTP headers read from response
 * @param   rawBody The raw data returned by the HTTP request
 * @param   error   The error object to log any errors in response initialization
 * @return          Http response initialized with the given code, headers and rawBody
 */
-(id) initWithStatusCode: (NSInteger) code
              andHeaders: (NSDictionary*) headers
              andRawBody: (NSData*) rawBody
                   error: (NSError*) error;

@end

#endif