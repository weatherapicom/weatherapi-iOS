//
//  HttpStringResponse.m
//

#import "HttpStringResponse.h"

@implementation HttpStringResponse

/**
 * String body of the http response
 */
@synthesize body;

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
                   error: (NSError*) error
{
    self = [super initWithStatusCode:_code
                          andHeaders:_headers
                          andRawBody:_rawBody
                               error:error];
    
    if(!self)
    {
        NSLog(@"Unable to initialize HttpStringResponse with error: %@", error);
    }
    else
    {
        self.body = _body;
    }
    
    return self;}

@end

