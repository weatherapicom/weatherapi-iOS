//
//  HttpBodyRequest.h
//
#ifndef HTTPBODYREQUEST
#define HTTPBODYREQUEST

#import "HttpRequest.h"

@interface HttpBodyRequest : HttpRequest

/**
 * Body for the http request
 */
@property NSData* body;

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
                error: (NSError*) error;

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
                error: (NSError*) error;

@end

#endif