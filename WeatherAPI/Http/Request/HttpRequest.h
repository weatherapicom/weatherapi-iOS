//
//  HttpRequest.h
//
#ifndef HTTPREQUEST
#define HTTPREQUEST

#import <Foundation/Foundation.h>
#import "HttpMethod.h"

@interface HttpRequest : NSObject

/**
 * Headers for the http request
 */
@property enum HttpMethod httpMethod;

/**
 * Headers for the http request
 */
@property NSDictionary* headers;

/**
 * Query url for the http request
 */
@property NSString* queryUrl;

/**
 * Parameters for the http request
 */
@property NSDictionary* parameters;

/**
 * Username for basic authentication
 */
@property NSString* username;

/**
 * Password for basic authentication
 */
@property NSString* password;

/**
 * Initializes a simple http request
 * @param   _method     The HTTP method to use. Can be GET, HEAD, PUT, POST, DELETE and PATCH
 * @param   _queryUrl   The http url to create the HTTP Request. Expect a fully qualified absolute Url
 * @param   _headers    The key-value map of all http headers to be sent
 * @param   _parameters  The form data values in a key-value map
 * @param   error       The error object to log any errors in request initialization
 * @return              Http request initialized with the given method, url and headers
 */
- (id) initWithMethod: (enum HttpMethod) _method
          andQueryUrl: (NSString*) _queryUrl
           andHeaders: (NSDictionary*) _headers
        andParameters: (NSDictionary*) _parameters
                error: (NSError*) error;

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
                error: (NSError*) error;

@end

#endif
