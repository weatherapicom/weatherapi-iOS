//
//  HttpStringResponse.h
//
#ifndef HTTPSTRINGRESPONSE
#define HTTPSTRINGRESPONSE

#import "HttpResponse.h"

@interface HttpStringResponse : HttpResponse

/**
 * String body of the http response
 */
@property NSString* body;

/**
 * @param   code    The HTTP status code
 * @param   headers The HTTP headers read from response
 * @param   rawBody The raw data returned by the HTTP request
 * @param   body    The processed string body from the HTTP request
 * @param   error   The error object to log any errors in response initialization
 * @return          Http response initialized with the given code, headers and rawBody
 */
-(id) initWithStatusCode: (NSInteger) _code
              andHeaders: (NSDictionary*) _headers
              andRawBody: (NSData*) _rawBody
                 andBody: (NSString*) _body
                   error: (NSError*) error;

@end

#endif