//
//  UnirestClient.m
//

#import "UnirestClient.h"

@implementation UnirestClient

/**
 * The shared singleton instance
 */
+(instancetype) sharedClient
{
    __strong static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

/**
* Set timeout for requests in seconds
* @param   timeout     The timeout in seconds
*/
-(void)setTimeout: (int) timeout
{
    [UNIRest timeout:timeout];
}

/**
 * Execute a given HttpRequest to get string response back
 * @param   request     The given HttpRequest to execute
 * @param   success     The success code block to handle success
 * @param   failure     The failure code block to handle failure
 */
-(void) executeAsString: (HttpRequest*) request
                success: (OnSuccess) successBlock
                failure: (OnFailure) failureBlock
{
    UNIHTTPRequest* uniRequest = [UnirestClient convertRequest: request];
    HttpContext* context = [[HttpContext alloc]init];
    context.request = request;
    [uniRequest asStringAsync:
     ^(UNIHTTPStringResponse *stringResponse, NSError *error) {
         [UnirestClient publishResponse: stringResponse
                       context: context
                       success: successBlock
                       failure: failureBlock
                         error: error];
     }];
}

/**
 * Execute a given HttpRequest to get binary response back
 * @param   request     The given HttpRequest to execute
 * @param   success     The success code block to handle success
 * @param   failure     The failure code block to handle failure
 */
-(void) executeAsBinary: (HttpRequest*) request
                success: (OnSuccess) successBlock
                failure: (OnFailure) failureBlock
{
    UNIHTTPRequest* uniRequest = [UnirestClient convertRequest: request];
    
    [uniRequest asBinaryAsync:
     ^(UNIHTTPBinaryResponse *binaryResponse, NSError *error) {
	     HttpContext* context = [[HttpContext alloc]init];
         context.request = request;
         [UnirestClient publishResponse: binaryResponse
                       context: context
                       success: successBlock
                       failure: failureBlock
                         error: error];
     }];
}

/**
 * Publishes success or failure result as HttpResponse from a HttpRequest
 * @param   response    The http response to publish
 * @param   context     The user specified context object
 * @param   success     The success code block reference to invoke the delegate
 * @param   failure     The failure code block reference to invoke the delegate
 * @param   error       The reported errors for getting the http response
 */
+(void) publishResponse: (UNIHTTPResponse*) response
                context: (HttpContext*) context
                success: (OnSuccess) successBlock
                failure: (OnFailure) failureBlock
                  error: (NSError*) error
{
    
    context.response = [self convertResponse: response error: error];
        
    //no error reported. publish the results using async blocks
    if(error != nil)
    {
        failureBlock(context, error);
    }
    else
    {
        successBlock(context, context.response);
    }
}

/**
 * Converts a given Unirest http response into our internal http response model
 * @param   response    The given unirest http response
 * @param   error       To log errors in the conversion process
 * @return              The converted http response
 */
+(HttpResponse*) convertResponse: (UNIHTTPResponse*) response
                           error: (NSError*) error
{
    HttpResponse* httpResponse = nil;
    
    if([response isMemberOfClass: [UNIHTTPStringResponse class]])
    {
        httpResponse = [[HttpStringResponse alloc]
                        initWithStatusCode: [response code]
                        andHeaders: [response headers]
                        andRawBody: [response rawBody]
                        andBody: [(UNIHTTPStringResponse*) response body]
                        error: error];
    }
    else
    {
        httpResponse = [[HttpResponse alloc]
                        initWithStatusCode: [response code]
                        andHeaders: [response headers]
                        andRawBody: [response rawBody]
                        error: error];
    }
    
    return httpResponse;
}

/**
 * Converts a given internal http request into unirest http request model
 * @param   request     The given http request in internal format
 * @return              The converted unirest http request
 */
+(UNIHTTPRequest*) convertRequest: (HttpRequest*) request
{
    UNIHTTPRequest* uniRequest = nil;
    UNIHTTPMethod uniMethod = [self convertHttpMetod: request.httpMethod];
    NSString* url = [request queryUrl];
    
    if([request isMemberOfClass: [HttpBodyRequest class]])
    {
        uniRequest = [[UNIHTTPRequestWithBody alloc]
                      initWithBodyRequest: uniMethod
                      url: url
                      headers: [request headers]
                      body: [(HttpBodyRequest*)request body]
                      username: [request username]
                      password: [request password]];
    }
    else
    {
        uniRequest = [[UNIHTTPRequestWithBody alloc]
                      initWithMultipartRequest: uniMethod
                      url: url
                      headers: [request headers]
                      parameters: [request parameters]
                      username: [request username]
                      password: [request password]];
    }
    
    return uniRequest;
}

/**
 * Converts a given internal http method enumeration into unirest http method unirest
 * @param   method      The given http method enum in internal format
 * @return              The converted unirest http method enum
 */
+(enum UNIHTTPMethod) convertHttpMetod: (enum HttpMethod) method
{
    switch (method) {
        case HTTP_POST:
            return POST;
            
        case HTTP_PATCH:
            return PATCH;
            
        case HTTP_PUT:
            return PUT;
            
        case HTTP_DELETE:
            return DELETE;
            
        default:
            return GET;
    }
}

/**
 * Used to lift a code block as an object
 */
+(id) liftCodeBlock: instance config:(void (^)(id)) config {
    if (config) {
        config(instance);
    }
    return instance;
}

/**
 * Create a simple HTTP GET request
 */
-(HttpRequest*) get:(HttpRequestBlock) config {
    HttpRequest* request = [UnirestClient liftCodeBlock:[[HttpRequest alloc] init] config: config];
    request.httpMethod = HTTP_GET;
    return request;
}

/**
 * Create an HTTP POST request with parameters
 */
-(HttpRequest*) post:(HttpRequestBlock) config {
    HttpRequest* request = [UnirestClient liftCodeBlock:[[HttpRequest alloc] init] config: config];
    request.httpMethod = HTTP_POST;
    return request;
}

/**
 * Create an HTTP POST request with body
 */
-(HttpBodyRequest*) postBody:(HttpBodyRequestBlock) config {
    HttpBodyRequest* request = [UnirestClient liftCodeBlock:[[HttpBodyRequest alloc] init] config: config];
    request.httpMethod = HTTP_POST;
    return request;
}

/**
 * Create an HTTP PUT request with parameters
 */
-(HttpRequest*) put:(HttpRequestBlock) config {
    HttpRequest* request = [UnirestClient liftCodeBlock:[[HttpRequest alloc] init] config: config];
    request.httpMethod = HTTP_PUT;
    return request;
}

/**
 * Create an HTTP PUT request with body
 */
-(HttpBodyRequest*) putBody:(HttpBodyRequestBlock) config {
    HttpBodyRequest* request = [UnirestClient liftCodeBlock:[[HttpBodyRequest alloc] init] config: config];
    request.httpMethod = HTTP_PUT;
    return request;
}

/**
 * Create an HTTP PATCH request with parameters
 */
-(HttpRequest*) patch:(HttpRequestBlock) config {
    HttpRequest* request = [UnirestClient liftCodeBlock:[[HttpRequest alloc] init] config: config];
    request.httpMethod = HTTP_PATCH;
    return request;
}

/**
 * Create an HTTP PATCH request with body
 */
-(HttpBodyRequest*) patchBody:(HttpBodyRequestBlock) config {
    HttpBodyRequest* request = [UnirestClient liftCodeBlock:[[HttpBodyRequest alloc] init] config: config];
    request.httpMethod = HTTP_PATCH;
    return request;
}

/**
 * Create an HTTP DELETE request with parameters
 */
-(HttpRequest*) delete:(HttpRequestBlock) config {
    HttpRequest* request = [UnirestClient liftCodeBlock:[[HttpRequest alloc] init] config: config];
    request.httpMethod = HTTP_DELETE;
    return request;
}

/**
 * Create an HTTP DELETE request with body
 */
-(HttpBodyRequest*) deleteBody:(HttpBodyRequestBlock) config {
    HttpBodyRequest* request = [UnirestClient liftCodeBlock:[[HttpBodyRequest alloc] init] config: config];
    request.httpMethod = HTTP_DELETE;
    return request;
}

@end
