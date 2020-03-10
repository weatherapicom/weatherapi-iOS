//
//  HttpRequestHandler.h
//
//  Unirest inspired wrapper for generic HTTP client interface
//  Courtesy: http://unirest.io by Mashape
//
#ifndef IHTTPCLIENT
#define IHTTPCLIENT

#import "HttpRequest.h"
#import "HttpBodyRequest.h"
#import "HttpStringResponse.h"
#import "HttpContext.h"

/**
 * Completion block definition for asynchronous call for successful request execution
 */
typedef void (^OnSuccess)(HttpContext* context, HttpResponse* response);

/**
 * Completion block definition for asynchronous call for failed request execution
 */
typedef void (^OnFailure)(HttpContext* context, NSError* error);

/**
 * Code block for configuring http request
 */
typedef void (^HttpRequestBlock)(HttpRequest* httpRequest);

/**
 * Code block for configuring http request with body
 */
typedef void (^HttpBodyRequestBlock)(HttpBodyRequest* httpBodyRequest);


@protocol IHttpClient

/**
* Set timeout for requests in seconds
* @param   timeout     The timeout in seconds
*/
-(void)setTimeout: (int) timeout;

/**
 * Execute a given HttpRequest to get string response back
 * @param   request     The given HttpRequest to execute
 * @param   context     A user specified context object
 * @param   success     The success code block to handle success
 * @param   failure     The failure code block to handle failure
 */
-(void) executeAsString: (HttpRequest*) request
                success: (OnSuccess) successBlock
                failure: (OnFailure) failureBlock;

/**
 * Execute a given HttpRequest to get binary response back
 * @param   request     The given HttpRequest to execute
 * @param   context     A user specified context object
 * @param   success     The success code block to handle success
 * @param   failure     The failure code block to handle failure
 */
-(void) executeAsBinary: (HttpRequest*) request
                success: (OnSuccess) successBlock
                failure: (OnFailure) failureBlock;

/**
 * Create a simple HTTP GET request
 */
-(HttpRequest*) get:(HttpRequestBlock) config;

/**
 * Create an HTTP POST request with parameters
 */
-(HttpRequest*) post:(HttpRequestBlock) config;

/**
 * Create an HTTP POST request with body
 */
-(HttpBodyRequest*) postBody:(HttpBodyRequestBlock) config;

/**
 * Create an HTTP PUT request with parameters
 */
-(HttpRequest*) put:(HttpRequestBlock) config;

/**
 * Create an HTTP PUT request with body
 */
-(HttpBodyRequest*) putBody:(HttpBodyRequestBlock) config;

/**
 * Create an HTTP PATCH request with parameters
 */
-(HttpRequest*) patch:(HttpRequestBlock) config;

/**
 * Create an HTTP PATCH request with body
 */
-(HttpBodyRequest*) patchBody:(HttpBodyRequestBlock) config;

/**
 * Create an HTTP DELETE request with parameters
 */
-(HttpRequest*) delete:(HttpRequestBlock) config;

/**
 * Create an HTTP DELETE request with body
 */
-(HttpBodyRequest*) deleteBody:(HttpBodyRequestBlock) config;

@end

#endif