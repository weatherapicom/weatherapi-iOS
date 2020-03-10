//
//  HttpRequest.m
//
#import "HttpRequest.h"

@implementation HttpRequest

/**
 * Headers for the http request
 */
@synthesize headers;

/**
 * Query url for the http request
 */
@synthesize queryUrl;

/**
 * Parameters for the http request
 */
@synthesize parameters;

/**
 * HTTP method for the http request
 */
@synthesize httpMethod;

/**
 * Username for basic authentication
 */
@synthesize username;

/**
 * Password for basic authentication
 */
@synthesize password;

/**
 * Initializes a simple http request
 * @param   _method      The HTTP method to use. Can be GET, HEAD, PUT, POST, DELETE and PATCH
 * @param   _queryUrl    The http url to create the HTTP Request. Expect a fully qualified absolute Url
 * @param   _headers     The key-value map of all http headers to be sent
 * @param   _parameters  The form data values in a key-value map
 * @param   error       The error object to log any errors in request initialization
 * @return              Http request initialized with the given method, url and headers
 */
- (id) initWithMethod: (enum HttpMethod) _method
          andQueryUrl: (NSString*) _queryUrl
           andHeaders: (NSDictionary*) _headers
        andParameters: (NSDictionary*) _parameters
                error: (NSError*) error
{
    self = [super init];
    
    if(!self)
    {
        NSLog(@"Unable to initialize HttpRequest with error: %@", error);
    }
    else
    {
        self.httpMethod = _method;
        self.queryUrl = _queryUrl;
        self.headers = _headers;
        self.parameters = _parameters;
    }
    
    return self;
}

/**
 * Initializes a simple http request
 * @param   _method     The HTTP method to use. Can be GET, HEAD, PUT, POST, DELETE and PATCH
 * @param   _queryUrl   The http url to create the HTTP Request. Expect a fully qualified absolute Url
 * @param   _headers    The key-value map of all http headers to be sent
 * @param   _parameters  The form data values in a key-value map
 * @param   _username   Username for basic authentication
 * @param   _password   Password for basic authentication
 * @param   error       The error object to log any errors in request initialization
 * @return              Http request initialized with the given method, url and headers
 */
- (id) initWithMethod: (enum HttpMethod) _method
          andQueryUrl: (NSString*) _queryUrl
           andHeaders: (NSDictionary*) _headers
        andParameters: (NSDictionary*) _parameters
          andUserName: (NSString*) _username
          andPassword: (NSString*) _password
                error: (NSError*) error
{
    self = [super init];
    
    if(!self)
    {
        NSLog(@"Unable to initialize HttpRequest with error: %@", error);
    }
    else
    {
        self.httpMethod = _method;
        self.queryUrl = _queryUrl;
        self.headers = _headers;
        self.parameters = _parameters;
        self.username = _username;
        self.password = _password;
    }
    
    return self;
}

@end
