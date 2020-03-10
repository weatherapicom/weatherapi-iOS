//
//  HttpContext.h
//  A DTO that encapsulates the HTTP request and response. 
//

#import <Foundation/Foundation.h>
#import "HttpRequest.h"
#import "HttpResponse.h"
@interface HttpContext : NSObject

@property HttpRequest* request;
@property HttpResponse* response;

@end
