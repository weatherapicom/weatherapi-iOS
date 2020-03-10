//
//  HttpResponse.m
//

#import "HttpResponse.h"

@implementation HttpResponse

/**
 * HTTP Status code of the http response
 */
@synthesize statusCode;

/**
 * Headers of the http response
 */
@synthesize headers;

/**
 * Raw body of the http response
 */
@synthesize rawBody;

/**
 * @param   code    The HTTP status code
 * @param   headers The HTTP headers read from response
 * @param   rawBody The raw data returned by the HTTP request
 * @param   error   The error object to log any errors in response initialization
 * @return          Http response initialized with the given code, headers and rawBody
 */
-(id) initWithStatusCode: (NSInteger) _code
              andHeaders: (NSDictionary*) _headers
              andRawBody: (NSData*) _rawBody
                   error: (NSError*) error
{
    self = [super init];
    
    if(!self)
    {
        NSLog(@"Unable to initialize HttpResponse with error: %@", error);
    }
    else
    {
        self.statusCode = _code;
        self.headers = _headers;
        self.rawBody = _rawBody;
    }
    
    return self;
}

@end
