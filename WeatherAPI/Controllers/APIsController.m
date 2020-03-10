//
//  WeatherAPI
//
//  This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ).
//
#import "APIsController.h"

@implementation APIsController

/**
* Current weather or realtime weather API method allows a user to get up to date current weather information in json and xml. The data is returned as a Current Object.Current object contains current or realtime weather information for a given city.
* @param    q    Required parameter: Pass US Zipcode, UK Postcode, Canada Postalcode, IP address, Latitude/Longitude (decimal degree) or city name. Visit [request parameter section](https://www.weatherapi.com/docs/#intro-request) to learn more.
* @param    lang    Optional parameter: Returns 'condition:text' field in API in the desired language. Visit [request parameter section](https://www.weatherapi.com/docs/#intro-request) to check 'lang-code'.
* @return	Returns the void response from the API call */
- (void) getRealtimeWeatherAsyncWithQ:(NSString*) q
                lang:(NSString*) lang
                completionBlock:(CompletedGetRealtimeWeather) onCompleted
{
    //the base uri for api requests
    NSString* _baseUri = [NSString stringWithString: (NSString*) Configuration_BaseUri];

    //prepare query string for API call
    NSMutableString* _queryBuilder = [NSMutableString stringWithString: _baseUri]; 
    [_queryBuilder appendString: @"/current.json"];

    //process optional query parameters
    [APIHelper appendUrl: _queryBuilder withQueryParameters: @{
                    @"q": q,
                    @"lang": (nil != lang) ? lang : [NSNull null],
                    @"key": Configuration_Key
                }];

    //validate and preprocess url
    NSString* _queryUrl = [APIHelper cleanUrl: _queryBuilder];

    //preparing request headers
    NSMutableDictionary* _headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"APIMATIC 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: _headers];


    //prepare the request and fetch response  
    HttpRequest* _request = [[self clientInstance] get: ^(HttpRequest* _request) 
    { 
        [_request setQueryUrl: _queryUrl]; //set request url        
        [_request setHeaders: _headers]; //set request headers

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: _request
     success: ^(id _context, HttpResponse *_response) {
         //Error handling using HTTP status codes
         NSError* _statusError = nil;

         //Error handling using HTTP status codes 
         if (_response.statusCode == 400)
             _statusError = [[APIError alloc] initWithReason: @"Error code 1003: Parameter 'q' not provided.Error code 1005: API request url is invalid.Error code 1006: No location found matching parameter 'q'Error code 9999: Internal application error."
                                               andContext:_context];
         else if (_response.statusCode == 401)
             _statusError = [[APIError alloc] initWithReason: @"Error code 1002: API key not provided.Error code 2006: API key provided is invalid"
                                               andContext:_context];
         else if (_response.statusCode == 403)
             _statusError = [[APIError alloc] initWithReason: @"Error code 2007: API key has exceeded calls per month quota.<br />Error code 2008: API key has been disabled."
                                               andContext:_context];
         else if((_response.statusCode < 200) || (_response.statusCode > 208)) //[200,208] = HTTP OK
             _statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                  andContext:_context];

         if(_statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, _context, nil, _statusError);
         }
         else
         {
             //return _response to API caller
             NSString* _strResult = [(HttpStringResponse*)_response body];
             CurrentJsonResponse* _result = (CurrentJsonResponse*) [APIHelper jsonDeserialize: _strResult
                toClass: CurrentJsonResponse.class];

 
             //announce completion with success
             onCompleted(YES, _context, _result, nil);
         }
     } failure:^(id _context, NSError *_error) {
 
         //announce completion with failure
         onCompleted(NO, _context, nil, _error);
     }];
}

/**
* Forecast weather API method returns upto next 10 day weather forecast and weather alert as json. The data is returned as a Forecast Object.<br />Forecast object contains astronomy data, day weather forecast and hourly interval weather information for a given city.
* @param    q    Required parameter: Pass US Zipcode, UK Postcode, Canada Postalcode, IP address, Latitude/Longitude (decimal degree) or city name. Visit [request parameter section](https://www.weatherapi.com/docs/#intro-request) to learn more.
* @param    days    Required parameter: Number of days of weather forecast. Value ranges from 1 to 10
* @param    dt    Optional parameter: Date should be between today and next 10 day in yyyy-MM-dd format
* @param    unixdt    Optional parameter: Please either pass 'dt' or 'unixdt' and not both in same request.<br />unixdt should be between today and next 10 day in Unix format
* @param    hour    Optional parameter: Must be in 24 hour. For example 5 pm should be hour=17, 6 am as hour=6
* @param    lang    Optional parameter: Returns 'condition:text' field in API in the desired language. Visit [request parameter section](https://www.weatherapi.com/docs/#intro-request) to check 'lang-code'.
* @return	Returns the void response from the API call */
- (void) getForecastWeatherAsyncWithQ:(NSString*) q
                days:(int) days
                dt:(NSDate*) dt
                unixdt:(NSNumber*) unixdt
                hour:(NSNumber*) hour
                lang:(NSString*) lang
                completionBlock:(CompletedGetForecastWeather) onCompleted
{
    //the base uri for api requests
    NSString* _baseUri = [NSString stringWithString: (NSString*) Configuration_BaseUri];

    //prepare query string for API call
    NSMutableString* _queryBuilder = [NSMutableString stringWithString: _baseUri]; 
    [_queryBuilder appendString: @"/forecast.json"];

    //process optional query parameters
    [APIHelper appendUrl: _queryBuilder withQueryParameters: @{
                    @"q": q,
                    @"days": [NSNumber numberWithInteger: days],
                    @"dt": (nil != dt) ? dt : [NSNull null],
                    @"unixdt": (nil != unixdt) ? unixdt : [NSNull null],
                    @"hour": (nil != hour) ? hour : [NSNull null],
                    @"lang": (nil != lang) ? lang : [NSNull null],
                    @"key": Configuration_Key
                }];

    //validate and preprocess url
    NSString* _queryUrl = [APIHelper cleanUrl: _queryBuilder];

    //preparing request headers
    NSMutableDictionary* _headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"APIMATIC 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: _headers];


    //prepare the request and fetch response  
    HttpRequest* _request = [[self clientInstance] get: ^(HttpRequest* _request) 
    { 
        [_request setQueryUrl: _queryUrl]; //set request url        
        [_request setHeaders: _headers]; //set request headers

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: _request
     success: ^(id _context, HttpResponse *_response) {
         //Error handling using HTTP status codes
         NSError* _statusError = nil;

         //Error handling using HTTP status codes 
         if (_response.statusCode == 400)
             _statusError = [[APIError alloc] initWithReason: @"Error code 1003: Parameter 'q' not provided.Error code 1005: API request url is invalid.Error code 1006: No location found matching parameter 'q'Error code 9999: Internal application error."
                                               andContext:_context];
         else if (_response.statusCode == 401)
             _statusError = [[APIError alloc] initWithReason: @"Error code 1002: API key not provided.Error code 2006: API key provided is invalid"
                                               andContext:_context];
         else if (_response.statusCode == 403)
             _statusError = [[APIError alloc] initWithReason: @"Error code 2007: API key has exceeded calls per month quota.<br />Error code 2008: API key has been disabled."
                                               andContext:_context];
         else if((_response.statusCode < 200) || (_response.statusCode > 208)) //[200,208] = HTTP OK
             _statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                  andContext:_context];

         if(_statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, _context, nil, _statusError);
         }
         else
         {
             //return _response to API caller
             NSString* _strResult = [(HttpStringResponse*)_response body];
             ForecastJsonResponse* _result = (ForecastJsonResponse*) [APIHelper jsonDeserialize: _strResult
                toClass: ForecastJsonResponse.class];

 
             //announce completion with success
             onCompleted(YES, _context, _result, nil);
         }
     } failure:^(id _context, NSError *_error) {
 
         //announce completion with failure
         onCompleted(NO, _context, nil, _error);
     }];
}

/**
* History weather API method returns historical weather for a date on or after 1st Jan, 2015 as json. The data is returned as a Forecast Object.
* @param    q    Required parameter: Pass US Zipcode, UK Postcode, Canada Postalcode, IP address, Latitude/Longitude (decimal degree) or city name. Visit [request parameter section](https://www.weatherapi.com/docs/#intro-request) to learn more.
* @param    dt    Required parameter: Date on or after 1st Jan, 2015 in yyyy-MM-dd format
* @param    unixdt    Optional parameter: Please either pass 'dt' or 'unixdt' and not both in same request.<br />unixdt should be on or after 1st Jan, 2015 in Unix format
* @param    endDt    Optional parameter: Date on or after 1st Jan, 2015 in yyyy-MM-dd format'end_dt' should be greater than 'dt' parameter and difference should not be more than 30 days between the two dates.
* @param    unixendDt    Optional parameter: Date on or after 1st Jan, 2015 in Unix Timestamp format<br />unixend_dt has same restriction as 'end_dt' parameter. Please either pass 'end_dt' or 'unixend_dt' and not both in same request. e.g.: unixend_dt=1490227200
* @param    hour    Optional parameter: Must be in 24 hour. For example 5 pm should be hour=17, 6 am as hour=6
* @param    lang    Optional parameter: Returns 'condition:text' field in API in the desired language. Visit [request parameter section](https://www.weatherapi.com/docs/#intro-request) to check 'lang-code'.
* @return	Returns the void response from the API call */
- (void) getHistoryWeatherAsyncWithQ:(NSString*) q
                dt:(NSDate*) dt
                unixdt:(NSNumber*) unixdt
                endDt:(NSDate*) endDt
                unixendDt:(NSNumber*) unixendDt
                hour:(NSNumber*) hour
                lang:(NSString*) lang
                completionBlock:(CompletedGetHistoryWeather) onCompleted
{
    //the base uri for api requests
    NSString* _baseUri = [NSString stringWithString: (NSString*) Configuration_BaseUri];

    //prepare query string for API call
    NSMutableString* _queryBuilder = [NSMutableString stringWithString: _baseUri]; 
    [_queryBuilder appendString: @"/history.json"];

    //process optional query parameters
    [APIHelper appendUrl: _queryBuilder withQueryParameters: @{
                    @"q": q,
                    @"dt": [NSDate NSDateFromNSString: dt],
                    @"unixdt": (nil != unixdt) ? unixdt : [NSNull null],
                    @"end_dt": (nil != endDt) ? endDt : [NSNull null],
                    @"unixend_dt": (nil != unixendDt) ? unixendDt : [NSNull null],
                    @"hour": (nil != hour) ? hour : [NSNull null],
                    @"lang": (nil != lang) ? lang : [NSNull null],
                    @"key": Configuration_Key
                }];

    //validate and preprocess url
    NSString* _queryUrl = [APIHelper cleanUrl: _queryBuilder];

    //preparing request headers
    NSMutableDictionary* _headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"APIMATIC 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: _headers];


    //prepare the request and fetch response  
    HttpRequest* _request = [[self clientInstance] get: ^(HttpRequest* _request) 
    { 
        [_request setQueryUrl: _queryUrl]; //set request url        
        [_request setHeaders: _headers]; //set request headers

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: _request
     success: ^(id _context, HttpResponse *_response) {
         //Error handling using HTTP status codes
         NSError* _statusError = nil;

         //Error handling using HTTP status codes 
         if (_response.statusCode == 400)
             _statusError = [[APIError alloc] initWithReason: @"Error code 1003: Parameter 'q' not provided.Error code 1005: API request url is invalid.Error code 1006: No location found matching parameter 'q'Error code 9999: Internal application error."
                                               andContext:_context];
         else if (_response.statusCode == 401)
             _statusError = [[APIError alloc] initWithReason: @"Error code 1002: API key not provided.Error code 2006: API key provided is invalid"
                                               andContext:_context];
         else if (_response.statusCode == 403)
             _statusError = [[APIError alloc] initWithReason: @"Error code 2007: API key has exceeded calls per month quota.<br />Error code 2008: API key has been disabled."
                                               andContext:_context];
         else if((_response.statusCode < 200) || (_response.statusCode > 208)) //[200,208] = HTTP OK
             _statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                  andContext:_context];

         if(_statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, _context, nil, _statusError);
         }
         else
         {
             //return _response to API caller
             NSString* _strResult = [(HttpStringResponse*)_response body];
             HistoryJsonResponse* _result = (HistoryJsonResponse*) [APIHelper jsonDeserialize: _strResult
                toClass: HistoryJsonResponse.class];

 
             //announce completion with success
             onCompleted(YES, _context, _result, nil);
         }
     } failure:^(id _context, NSError *_error) {
 
         //announce completion with failure
         onCompleted(NO, _context, nil, _error);
     }];
}

/**
* WeatherAPI.com Search or Autocomplete API returns matching cities and towns as an array of Location object.
* @param    q    Required parameter: Pass US Zipcode, UK Postcode, Canada Postalcode, IP address, Latitude/Longitude (decimal degree) or city name. Visit [request parameter section](https://www.weatherapi.com/docs/#intro-request) to learn more.
* @return	Returns the void response from the API call */
- (void) searchAutocompleteWeatherAsyncWithQ:(NSString*) q
                completionBlock:(CompletedGetSearchAutocompleteWeather) onCompleted
{
    //the base uri for api requests
    NSString* _baseUri = [NSString stringWithString: (NSString*) Configuration_BaseUri];

    //prepare query string for API call
    NSMutableString* _queryBuilder = [NSMutableString stringWithString: _baseUri]; 
    [_queryBuilder appendString: @"/search.json"];

    //process optional query parameters
    [APIHelper appendUrl: _queryBuilder withQueryParameters: @{
                    @"q": q,
                    @"key": Configuration_Key
                }];

    //validate and preprocess url
    NSString* _queryUrl = [APIHelper cleanUrl: _queryBuilder];

    //preparing request headers
    NSMutableDictionary* _headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"APIMATIC 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: _headers];


    //prepare the request and fetch response  
    HttpRequest* _request = [[self clientInstance] get: ^(HttpRequest* _request) 
    { 
        [_request setQueryUrl: _queryUrl]; //set request url        
        [_request setHeaders: _headers]; //set request headers

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: _request
     success: ^(id _context, HttpResponse *_response) {
         //Error handling using HTTP status codes
         NSError* _statusError = nil;

         //Error handling using HTTP status codes 
         if (_response.statusCode == 400)
             _statusError = [[APIError alloc] initWithReason: @"Error code 1003: Parameter 'q' not provided.Error code 1005: API request url is invalid.Error code 1006: No location found matching parameter 'q'Error code 9999: Internal application error."
                                               andContext:_context];
         else if (_response.statusCode == 401)
             _statusError = [[APIError alloc] initWithReason: @"Error code 1002: API key not provided.Error code 2006: API key provided is invalid"
                                               andContext:_context];
         else if (_response.statusCode == 403)
             _statusError = [[APIError alloc] initWithReason: @"Error code 2007: API key has exceeded calls per month quota.<br />Error code 2008: API key has been disabled."
                                               andContext:_context];
         else if((_response.statusCode < 200) || (_response.statusCode > 208)) //[200,208] = HTTP OK
             _statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                  andContext:_context];

         if(_statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, _context, nil, _statusError);
         }
         else
         {
             //return _response to API caller
             NSString* _strResult = [(HttpStringResponse*)_response body];
             NSArray<SearchJsonResponse> * _result = (NSArray<SearchJsonResponse>*) [SearchJsonResponse arrayOfModelsFromDictionaries:
                [APIHelper jsonDeserializeArray: _strResult] error: nil];

 
             //announce completion with success
             onCompleted(YES, _context, _result, nil);
         }
     } failure:^(id _context, NSError *_error) {
 
         //announce completion with failure
         onCompleted(NO, _context, nil, _error);
     }];
}

/**
* IP Lookup API method allows a user to get up to date information for an IP address.
* @param    q    Required parameter: Pass IP address.
* @return	Returns the void response from the API call */
- (void) getIpLookupAsyncWithQ:(NSString*) q
                completionBlock:(CompletedGetIpLookup) onCompleted
{
    //the base uri for api requests
    NSString* _baseUri = [NSString stringWithString: (NSString*) Configuration_BaseUri];

    //prepare query string for API call
    NSMutableString* _queryBuilder = [NSMutableString stringWithString: _baseUri]; 
    [_queryBuilder appendString: @"/ip.json"];

    //process optional query parameters
    [APIHelper appendUrl: _queryBuilder withQueryParameters: @{
                    @"q": q,
                    @"key": Configuration_Key
                }];

    //validate and preprocess url
    NSString* _queryUrl = [APIHelper cleanUrl: _queryBuilder];

    //preparing request headers
    NSMutableDictionary* _headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"APIMATIC 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: _headers];


    //prepare the request and fetch response  
    HttpRequest* _request = [[self clientInstance] get: ^(HttpRequest* _request) 
    { 
        [_request setQueryUrl: _queryUrl]; //set request url        
        [_request setHeaders: _headers]; //set request headers

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: _request
     success: ^(id _context, HttpResponse *_response) {
         //Error handling using HTTP status codes
         NSError* _statusError = nil;

         //Error handling using HTTP status codes 
         if (_response.statusCode == 400)
             _statusError = [[APIError alloc] initWithReason: @"Error code 1003: Parameter 'q' not provided.Error code 1005: API request url is invalid.Error code 1006: No location found matching parameter 'q'Error code 9999: Internal application error."
                                               andContext:_context];
         else if (_response.statusCode == 401)
             _statusError = [[APIError alloc] initWithReason: @"Error code 1002: API key not provided.Error code 2006: API key provided is invalid"
                                               andContext:_context];
         else if (_response.statusCode == 403)
             _statusError = [[APIError alloc] initWithReason: @"Error code 2007: API key has exceeded calls per month quota.<br />Error code 2008: API key has been disabled."
                                               andContext:_context];
         else if((_response.statusCode < 200) || (_response.statusCode > 208)) //[200,208] = HTTP OK
             _statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                  andContext:_context];

         if(_statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, _context, nil, _statusError);
         }
         else
         {
             //return _response to API caller
             NSString* _strResult = [(HttpStringResponse*)_response body];
             IpJsonResponse* _result = (IpJsonResponse*) [APIHelper jsonDeserialize: _strResult
                toClass: IpJsonResponse.class];

 
             //announce completion with success
             onCompleted(YES, _context, _result, nil);
         }
     } failure:^(id _context, NSError *_error) {
 
         //announce completion with failure
         onCompleted(NO, _context, nil, _error);
     }];
}

/**
* Return Location Object
* @param    q    Required parameter: Pass US Zipcode, UK Postcode, Canada Postalcode, IP address, Latitude/Longitude (decimal degree) or city name. Visit [request parameter section](https://www.weatherapi.com/docs/#intro-request) to learn more.
* @return	Returns the void response from the API call */
- (void) getTimeZoneAsyncWithQ:(NSString*) q
                completionBlock:(CompletedGetTimeZone) onCompleted
{
    //the base uri for api requests
    NSString* _baseUri = [NSString stringWithString: (NSString*) Configuration_BaseUri];

    //prepare query string for API call
    NSMutableString* _queryBuilder = [NSMutableString stringWithString: _baseUri]; 
    [_queryBuilder appendString: @"/timezone.json"];

    //process optional query parameters
    [APIHelper appendUrl: _queryBuilder withQueryParameters: @{
                    @"q": q,
                    @"key": Configuration_Key
                }];

    //validate and preprocess url
    NSString* _queryUrl = [APIHelper cleanUrl: _queryBuilder];

    //preparing request headers
    NSMutableDictionary* _headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"APIMATIC 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: _headers];


    //prepare the request and fetch response  
    HttpRequest* _request = [[self clientInstance] get: ^(HttpRequest* _request) 
    { 
        [_request setQueryUrl: _queryUrl]; //set request url        
        [_request setHeaders: _headers]; //set request headers

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: _request
     success: ^(id _context, HttpResponse *_response) {
         //Error handling using HTTP status codes
         NSError* _statusError = nil;

         //Error handling using HTTP status codes 
         if (_response.statusCode == 400)
             _statusError = [[APIError alloc] initWithReason: @"Error code 1003: Parameter 'q' not provided.Error code 1005: API request url is invalid.Error code 1006: No location found matching parameter 'q'Error code 9999: Internal application error."
                                               andContext:_context];
         else if (_response.statusCode == 401)
             _statusError = [[APIError alloc] initWithReason: @"Error code 1002: API key not provided.Error code 2006: API key provided is invalid"
                                               andContext:_context];
         else if (_response.statusCode == 403)
             _statusError = [[APIError alloc] initWithReason: @"Error code 2007: API key has exceeded calls per month quota.<br />Error code 2008: API key has been disabled."
                                               andContext:_context];
         else if((_response.statusCode < 200) || (_response.statusCode > 208)) //[200,208] = HTTP OK
             _statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                  andContext:_context];

         if(_statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, _context, nil, _statusError);
         }
         else
         {
             //return _response to API caller
             NSString* _strResult = [(HttpStringResponse*)_response body];
             TimezoneJsonResponse* _result = (TimezoneJsonResponse*) [APIHelper jsonDeserialize: _strResult
                toClass: TimezoneJsonResponse.class];

 
             //announce completion with success
             onCompleted(YES, _context, _result, nil);
         }
     } failure:^(id _context, NSError *_error) {
 
         //announce completion with failure
         onCompleted(NO, _context, nil, _error);
     }];
}

/**
* Return Location and Astronomy Object
* @param    q    Required parameter: Pass US Zipcode, UK Postcode, Canada Postalcode, IP address, Latitude/Longitude (decimal degree) or city name. Visit [request parameter section](https://www.weatherapi.com/docs/#intro-request) to learn more.
* @param    dt    Required parameter: Date on or after 1st Jan, 2015 in yyyy-MM-dd format
* @return	Returns the void response from the API call */
- (void) getAstronomyAsyncWithQ:(NSString*) q
                dt:(NSDate*) dt
                completionBlock:(CompletedGetAstronomy) onCompleted
{
    //the base uri for api requests
    NSString* _baseUri = [NSString stringWithString: (NSString*) Configuration_BaseUri];

    //prepare query string for API call
    NSMutableString* _queryBuilder = [NSMutableString stringWithString: _baseUri]; 
    [_queryBuilder appendString: @"/astronomy.json"];

    //process optional query parameters
    [APIHelper appendUrl: _queryBuilder withQueryParameters: @{
                    @"q": q,
                    @"dt": [NSDate NSDateFromNSString: dt],
                    @"key": Configuration_Key
                }];

    //validate and preprocess url
    NSString* _queryUrl = [APIHelper cleanUrl: _queryBuilder];

    //preparing request headers
    NSMutableDictionary* _headers = [[NSMutableDictionary alloc] initWithDictionary: @{
        @"user-agent": @"APIMATIC 2.0",
        @"accept": @"application/json"
    }];

    //Remove null values from header collection in order to omit from request
    [APIHelper removeNullValues: _headers];


    //prepare the request and fetch response  
    HttpRequest* _request = [[self clientInstance] get: ^(HttpRequest* _request) 
    { 
        [_request setQueryUrl: _queryUrl]; //set request url        
        [_request setHeaders: _headers]; //set request headers

    }];

    //use the instance of the http client to make the actual call
    [[self clientInstance]
     executeAsString: _request
     success: ^(id _context, HttpResponse *_response) {
         //Error handling using HTTP status codes
         NSError* _statusError = nil;

         //Error handling using HTTP status codes 
         if (_response.statusCode == 400)
             _statusError = [[APIError alloc] initWithReason: @"Error code 1003: Parameter 'q' not provided.Error code 1005: API request url is invalid.Error code 1006: No location found matching parameter 'q'Error code 9999: Internal application error."
                                               andContext:_context];
         else if (_response.statusCode == 401)
             _statusError = [[APIError alloc] initWithReason: @"Error code 1002: API key not provided.Error code 2006: API key provided is invalid"
                                               andContext:_context];
         else if (_response.statusCode == 403)
             _statusError = [[APIError alloc] initWithReason: @"Error code 2007: API key has exceeded calls per month quota.<br />Error code 2008: API key has been disabled."
                                               andContext:_context];
         else if((_response.statusCode < 200) || (_response.statusCode > 208)) //[200,208] = HTTP OK
             _statusError = [[APIError alloc] initWithReason: @"HTTP Response Not OK"
                                                  andContext:_context];

         if(_statusError != nil)
         {
             //announce completion with failure due to HTTP status code checking
             onCompleted(NO, _context, nil, _statusError);
         }
         else
         {
             //return _response to API caller
             NSString* _strResult = [(HttpStringResponse*)_response body];
             AstronomyJsonResponse* _result = (AstronomyJsonResponse*) [APIHelper jsonDeserialize: _strResult
                toClass: AstronomyJsonResponse.class];

 
             //announce completion with success
             onCompleted(YES, _context, _result, nil);
         }
     } failure:^(id _context, NSError *_error) {
 
         //announce completion with failure
         onCompleted(NO, _context, nil, _error);
     }];
}


@end