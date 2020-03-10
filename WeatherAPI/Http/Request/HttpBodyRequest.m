//
//  HttpBodyRequest.m
//

#import "HttpBodyRequest.h"

@implementation HttpBodyRequest

/**
 * Body for the http request
 */
@synthesize body;

/**
 * Create a request with explicit body
 * @param   _method     The HTTP method to use. Can be PUT, POST, DELETE and PATCH
 * @param   _queryUrl   The http url to create the HTTP Request. Expect a fully qualified absolute Url
 * @param   _headers    The key-value map of all http headers to be sent
 * @param   _body       The object to be sent as body after serialization
 * @param   error       The error object to log any errors in request initialization
 * @return              Http request initialized with the given method, url, headers and request body
 */
- (id) initWithMethod: (enum HttpMethod) _method
          andQueryUrl: (NSString*) _queryUrl
           andHeaders: (NSDictionary*) _headers
              andBody: (NSData*) _body
                error: (NSError*) error
{
    if((_method == HTTP_GET) || (_method == HTTP_HEAD))
        return nil;
    
    self = [super initWithMethod: _method
                     andQueryUrl: _queryUrl
                      andHeaders: _headers
                   andParameters: nil
                           error: error];
    
    if(!self)
    {
        NSLog(@"Unable to initialize HttpRequest with error: %@", error);
    }
    else
    {
        self.body = _body;
    }
    
    return self;
}

/**
 * Create a request with explicit body
 * @param   _method     The HTTP method to use. Can be PUT, POST, DELETE and PATCH
 * @param   _queryUrl   The http url to create the HTTP Request. Expect a fully qualified absolute Url
 * @param   _headers    The key-value map of all http headers to be sent
 * @param   _body       The object to be sent as body after serialization
 * @param   _username   Username for basic authentication
 * @param   _password   Password for basic authentication
 * @param   error       The error object to log any errors in request initialization
 * @return              Http request initialized with the given method, url, headers and request body
 */
- (id) initWithMethod: (enum HttpMethod) _method
          andQueryUrl: (NSString*) _queryUrl
           andHeaders: (NSDictionary*) _headers
              andBody: (NSData*) _body
          andUserName: (NSString*) _username
          andPassword: (NSString*) _password
                error: (NSError*) error
{
    if((_method == HTTP_GET) || (_method == HTTP_HEAD))
        return nil;
    
    self = [super initWithMethod: _method
                     andQueryUrl: _queryUrl
                      andHeaders: _headers
                   andParameters: nil
                     andUserName: _username
                     andPassword: _password
                           error: error];
    
    if(!self)
    {
        NSLog(@"Unable to initialize HttpRequest with error: %@", error);
    }
    else
    {
        self.body = _body;
    }
    
    return self;
}

@end
