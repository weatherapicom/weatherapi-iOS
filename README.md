# Getting started


# Introduction

WeatherAPI.com provides access to weather and geo data via a JSON/XML restful API. It allows developers to create desktop, web and mobile applications using this data very easy.

We provide following data through our API:

  * Real-time weather

  * 10 day weather forecast

  * Astronomy

  * Time zone

  * Location data

  * Search or Autocomplete API

  * NEW: Historical weather

# Getting Started

You need to [signup](https://www.weatherapi.com/signup.aspx) and then you can find your API key under [your account](https://www.weatherapi.com/login.aspx), and start using API right away!

If you find any features missing or have any suggestions, please [contact us](https://www.weatherapi.com/contact.aspx).

# Authentication

API access to the data is protected by an API key. If at anytime, you find the API key has become vulnerable, please regenerate the key using Regenerate button next to the API key.

Authentication to the WeatherAPI.com API is provided by passing your API key as request parameter through an API .

  ##  key parameter
  key=YOUR_API_KEY


## How to Build


The generated code has dependencies over external libraries like UniRest. These dependencies are defined in the ```PodFile``` file that comes with the SDK. 
To resolve these dependencies, we use the Cocoapods package manager.
Visit https://guides.cocoapods.org/using/getting-started.html to setup Cocoapods on your system.
Open command prompt and type ```pod --version```. This should display the current version of Cocoapods installed if the installation was successful.

Using command line, navigate to the directory containing the generated files (including ```PodFile```) for the SDK. 
Run the command ```pod install```. This should install all the required dependencies and create the ```pods``` directory in your project directory.

![Installing dependencies using Cocoapods](https://apidocs.io/illustration/objc?step=AddDependencies&workspaceFolder=Weather%20API-ObjC&workspaceName=WeatherAPI&projectName=WeatherAPI&rootNamespace=WeatherAPI)

Open the project workspace using the (WeatherAPI.xcworkspace) file. Invoke the build process using `Command(⌘)+B` shortcut key or using the `Build` menu as shown below.

![Building SDK using Xcode](https://apidocs.io/illustration/objc?step=BuildSDK&workspaceFolder=Weather%20API-ObjC&workspaceName=WeatherAPI&projectName=WeatherAPI&rootNamespace=WeatherAPI)


## How to Use

The generated code is a Cocoa Touch Static Library which can be used in any iOS project. The support for these generated libraries go all the way back to iOS 6.

The following section explains how to use the WeatherAPI library in a new iOS project.     
### 1. Starting a new project
To start a new project, left-click on the ```Create a new Xcode project```.
![Create Test Project - Step 1](https://apidocs.io/illustration/objc?step=Test1&workspaceFolder=Weather%20API-ObjC&workspaceName=WeatherAPI&projectName=WeatherAPI&rootNamespace=WeatherAPI)

Next, choose **Single View Application** and click ```Next```.
![Create Test Project - Step 2](https://apidocs.io/illustration/objc?step=Test2&workspaceFolder=Weather%20API-ObjC&workspaceName=WeatherAPI&projectName=WeatherAPI&rootNamespace=WeatherAPI)

Provide **Test-Project** as the product name click ```Next```.
![Create Test Project - Step 3](https://apidocs.io/illustration/objc?step=Test3&workspaceFolder=Weather%20API-ObjC&workspaceName=WeatherAPI&projectName=WeatherAPI&rootNamespace=WeatherAPI)

Choose the desired location of your project folder and click ```Create```.
![Create Test Project - Step 4](https://apidocs.io/illustration/objc?step=Test4&workspaceFolder=Weather%20API-ObjC&workspaceName=WeatherAPI&projectName=WeatherAPI&rootNamespace=WeatherAPI)

### 2. Adding the static library dependency
To add this dependency open a terminal and navigate to your project folder. Next, input ```pod init``` and press enter.
![Add dependency - Step 1](https://apidocs.io/illustration/objc?step=Add0&workspaceFolder=Weather%20API-ObjC&workspaceName=WeatherAPI&projectName=WeatherAPI&rootNamespace=WeatherAPI)

Next, open the newly created ```PodFile``` in your favourite text editor. Add the following line : pod 'WeatherAPI', :path => 'Vendor/WeatherAPI'
![Add dependency - Step 2](https://apidocs.io/illustration/objc?step=Add1&workspaceFolder=Weather%20API-ObjC&workspaceName=WeatherAPI&projectName=WeatherAPI&rootNamespace=WeatherAPI)

Execute `pod install` from terminal to install the dependecy in your project. This would add the dependency to the newly created test project.
![Add dependency - Step 3](https://apidocs.io/illustration/objc?step=Add2&workspaceFolder=Weather%20API-ObjC&workspaceName=WeatherAPI&projectName=WeatherAPI&rootNamespace=WeatherAPI)


## How to Test

Unit tests in this SDK can be run using Xcode. 

First build the SDK as shown in the steps above and naivgate to the project directory and open the WeatherAPI.xcworkspace file.

Go to the test explorer in Xcode as shown in the picture below and click on `run tests` from the menu. 
![Run tests](https://apidocs.io/illustration/objc?step=RunTests&workspaceFolder=Weather%20API-ObjC&workspaceName=WeatherAPI&projectName=WeatherAPI&rootNamespace=WeatherAPI)


## Initialization

### Authentication
In order to setup authentication and initialization of the API client, you need the following information.

| Parameter | Description |
|-----------|-------------|
| key | TODO: add a description |



Configuration variables can be set as following.
```Objc
// Configuration parameters and credentials
Configuration_Key = "Configuration_Key";

```

# Class Reference

## <a name="list_of_controllers"></a>List of Controllers

* [APIsController](#ap_is_controller)

## <a name="ap_is_controller"></a>![Class: ](https://apidocs.io/img/class.png ".APIsController") APIsController

### Get singleton instance
```objc
APIs* aPIs = [[APIs alloc]init] ;
```

### <a name="get_realtime_weather_async_with_q"></a>![Method: ](https://apidocs.io/img/method.png ".APIsController.getRealtimeWeatherAsyncWithQ") getRealtimeWeatherAsyncWithQ

> Current weather or realtime weather API method allows a user to get up to date current weather information in json and xml. The data is returned as a Current Object.Current object contains current or realtime weather information for a given city.


```objc
function getRealtimeWeatherAsyncWithQ:(NSString*) q
                lang:(NSString*) lang
                completionBlock:(CompletedGetRealtimeWeather) onCompleted(q lang : lang)
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| q |  ``` Required ```  | Pass US Zipcode, UK Postcode, Canada Postalcode, IP address, Latitude/Longitude (decimal degree) or city name. Visit [request parameter section](https://www.weatherapi.com/docs/#intro-request) to learn more. |
| lang |  ``` Optional ```  | Returns 'condition:text' field in API in the desired language. Visit [request parameter section](https://www.weatherapi.com/docs/#intro-request) to check 'lang-code'. |





#### Example Usage

```objc
    // Parameters for the API call
    NSString* q = @"q";
    NSString* lang = @"lang";

    [self.aPIs getRealtimeWeatherAsyncWithQ: q lang : lang  completionBlock:^(BOOL success, HttpContext* context, CurrentJsonResponse* response, NSError* error) { 
       //Add code here
    }];
```

#### Errors

| Error Code | Error Description |
|------------|-------------------|
| 400 | Error code 1003: Parameter 'q' not provided.Error code 1005: API request url is invalid.Error code 1006: No location found matching parameter 'q'Error code 9999: Internal application error. |
| 401 | Error code 1002: API key not provided.Error code 2006: API key provided is invalid |
| 403 | Error code 2007: API key has exceeded calls per month quota.<br />Error code 2008: API key has been disabled. |



### <a name="get_forecast_weather_async_with_q"></a>![Method: ](https://apidocs.io/img/method.png ".APIsController.getForecastWeatherAsyncWithQ") getForecastWeatherAsyncWithQ

> Forecast weather API method returns upto next 10 day weather forecast and weather alert as json. The data is returned as a Forecast Object.<br />Forecast object contains astronomy data, day weather forecast and hourly interval weather information for a given city.


```objc
function getForecastWeatherAsyncWithQ:(NSString*) q
                days:(int) days
                dt:(NSDate*) dt
                unixdt:(NSNumber*) unixdt
                hour:(NSNumber*) hour
                lang:(NSString*) lang
                completionBlock:(CompletedGetForecastWeather) onCompleted(q days : days dt : dt unixdt : unixdt hour : hour lang : lang)
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| q |  ``` Required ```  | Pass US Zipcode, UK Postcode, Canada Postalcode, IP address, Latitude/Longitude (decimal degree) or city name. Visit [request parameter section](https://www.weatherapi.com/docs/#intro-request) to learn more. |
| days |  ``` Required ```  | Number of days of weather forecast. Value ranges from 1 to 10 |
| dt |  ``` Optional ```  | Date should be between today and next 10 day in yyyy-MM-dd format |
| unixdt |  ``` Optional ```  | Please either pass 'dt' or 'unixdt' and not both in same request.<br />unixdt should be between today and next 10 day in Unix format |
| hour |  ``` Optional ```  | Must be in 24 hour. For example 5 pm should be hour=17, 6 am as hour=6 |
| lang |  ``` Optional ```  | Returns 'condition:text' field in API in the desired language. Visit [request parameter section](https://www.weatherapi.com/docs/#intro-request) to check 'lang-code'. |





#### Example Usage

```objc
    // Parameters for the API call
    NSString* q = @"q";
    int days = 78;
    NSDate* dt = [NSDate date];
    NSNumber* unixdt = 78;
    NSNumber* hour = 78;
    NSString* lang = @"lang";

    [self.aPIs getForecastWeatherAsyncWithQ: q days : days dt : dt unixdt : unixdt hour : hour lang : lang  completionBlock:^(BOOL success, HttpContext* context, ForecastJsonResponse* response, NSError* error) { 
       //Add code here
    }];
```

#### Errors

| Error Code | Error Description |
|------------|-------------------|
| 400 | Error code 1003: Parameter 'q' not provided.Error code 1005: API request url is invalid.Error code 1006: No location found matching parameter 'q'Error code 9999: Internal application error. |
| 401 | Error code 1002: API key not provided.Error code 2006: API key provided is invalid |
| 403 | Error code 2007: API key has exceeded calls per month quota.<br />Error code 2008: API key has been disabled. |



### <a name="get_history_weather_async_with_q"></a>![Method: ](https://apidocs.io/img/method.png ".APIsController.getHistoryWeatherAsyncWithQ") getHistoryWeatherAsyncWithQ

> History weather API method returns historical weather for a date on or after 1st Jan, 2015 as json. The data is returned as a Forecast Object.


```objc
function getHistoryWeatherAsyncWithQ:(NSString*) q
                dt:(NSDate*) dt
                unixdt:(NSNumber*) unixdt
                endDt:(NSDate*) endDt
                unixendDt:(NSNumber*) unixendDt
                hour:(NSNumber*) hour
                lang:(NSString*) lang
                completionBlock:(CompletedGetHistoryWeather) onCompleted(q dt : dt unixdt : unixdt endDt : endDt unixendDt : unixendDt hour : hour lang : lang)
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| q |  ``` Required ```  | Pass US Zipcode, UK Postcode, Canada Postalcode, IP address, Latitude/Longitude (decimal degree) or city name. Visit [request parameter section](https://www.weatherapi.com/docs/#intro-request) to learn more. |
| dt |  ``` Required ```  | Date on or after 1st Jan, 2015 in yyyy-MM-dd format |
| unixdt |  ``` Optional ```  | Please either pass 'dt' or 'unixdt' and not both in same request.<br />unixdt should be on or after 1st Jan, 2015 in Unix format |
| endDt |  ``` Optional ```  | Date on or after 1st Jan, 2015 in yyyy-MM-dd format'end_dt' should be greater than 'dt' parameter and difference should not be more than 30 days between the two dates. |
| unixendDt |  ``` Optional ```  | Date on or after 1st Jan, 2015 in Unix Timestamp format<br />unixend_dt has same restriction as 'end_dt' parameter. Please either pass 'end_dt' or 'unixend_dt' and not both in same request. e.g.: unixend_dt=1490227200 |
| hour |  ``` Optional ```  | Must be in 24 hour. For example 5 pm should be hour=17, 6 am as hour=6 |
| lang |  ``` Optional ```  | Returns 'condition:text' field in API in the desired language. Visit [request parameter section](https://www.weatherapi.com/docs/#intro-request) to check 'lang-code'. |





#### Example Usage

```objc
    // Parameters for the API call
    NSString* q = @"q";
    NSDate* dt = [NSDate date];
    NSNumber* unixdt = 78;
    NSDate* endDt = [NSDate date];
    NSNumber* unixendDt = 78;
    NSNumber* hour = 78;
    NSString* lang = @"lang";

    [self.aPIs getHistoryWeatherAsyncWithQ: q dt : dt unixdt : unixdt endDt : endDt unixendDt : unixendDt hour : hour lang : lang  completionBlock:^(BOOL success, HttpContext* context, HistoryJsonResponse* response, NSError* error) { 
       //Add code here
    }];
```

#### Errors

| Error Code | Error Description |
|------------|-------------------|
| 400 | Error code 1003: Parameter 'q' not provided.Error code 1005: API request url is invalid.Error code 1006: No location found matching parameter 'q'Error code 9999: Internal application error. |
| 401 | Error code 1002: API key not provided.Error code 2006: API key provided is invalid |
| 403 | Error code 2007: API key has exceeded calls per month quota.<br />Error code 2008: API key has been disabled. |



### <a name="search_autocomplete_weather_async_with_q"></a>![Method: ](https://apidocs.io/img/method.png ".APIsController.searchAutocompleteWeatherAsyncWithQ") searchAutocompleteWeatherAsyncWithQ

> WeatherAPI.com Search or Autocomplete API returns matching cities and towns as an array of Location object.


```objc
function searchAutocompleteWeatherAsyncWithQ:(NSString*) q
                completionBlock:(CompletedGetSearchAutocompleteWeather) onCompleted(q)
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| q |  ``` Required ```  | Pass US Zipcode, UK Postcode, Canada Postalcode, IP address, Latitude/Longitude (decimal degree) or city name. Visit [request parameter section](https://www.weatherapi.com/docs/#intro-request) to learn more. |





#### Example Usage

```objc
    // Parameters for the API call
    NSString* q = @"q";

    [self.aPIs searchAutocompleteWeatherAsyncWithQ: q  completionBlock:^(BOOL success, HttpContext* context, NSArray<SearchJsonResponse> * response, NSError* error) { 
       //Add code here
    }];
```

#### Errors

| Error Code | Error Description |
|------------|-------------------|
| 400 | Error code 1003: Parameter 'q' not provided.Error code 1005: API request url is invalid.Error code 1006: No location found matching parameter 'q'Error code 9999: Internal application error. |
| 401 | Error code 1002: API key not provided.Error code 2006: API key provided is invalid |
| 403 | Error code 2007: API key has exceeded calls per month quota.<br />Error code 2008: API key has been disabled. |



### <a name="get_ip_lookup_async_with_q"></a>![Method: ](https://apidocs.io/img/method.png ".APIsController.getIpLookupAsyncWithQ") getIpLookupAsyncWithQ

> IP Lookup API method allows a user to get up to date information for an IP address.


```objc
function getIpLookupAsyncWithQ:(NSString*) q
                completionBlock:(CompletedGetIpLookup) onCompleted(q)
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| q |  ``` Required ```  | Pass IP address. |





#### Example Usage

```objc
    // Parameters for the API call
    NSString* q = @"q";

    [self.aPIs getIpLookupAsyncWithQ: q  completionBlock:^(BOOL success, HttpContext* context, IpJsonResponse* response, NSError* error) { 
       //Add code here
    }];
```

#### Errors

| Error Code | Error Description |
|------------|-------------------|
| 400 | Error code 1003: Parameter 'q' not provided.Error code 1005: API request url is invalid.Error code 1006: No location found matching parameter 'q'Error code 9999: Internal application error. |
| 401 | Error code 1002: API key not provided.Error code 2006: API key provided is invalid |
| 403 | Error code 2007: API key has exceeded calls per month quota.<br />Error code 2008: API key has been disabled. |



### <a name="get_time_zone_async_with_q"></a>![Method: ](https://apidocs.io/img/method.png ".APIsController.getTimeZoneAsyncWithQ") getTimeZoneAsyncWithQ

> Return Location Object


```objc
function getTimeZoneAsyncWithQ:(NSString*) q
                completionBlock:(CompletedGetTimeZone) onCompleted(q)
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| q |  ``` Required ```  | Pass US Zipcode, UK Postcode, Canada Postalcode, IP address, Latitude/Longitude (decimal degree) or city name. Visit [request parameter section](https://www.weatherapi.com/docs/#intro-request) to learn more. |





#### Example Usage

```objc
    // Parameters for the API call
    NSString* q = @"q";

    [self.aPIs getTimeZoneAsyncWithQ: q  completionBlock:^(BOOL success, HttpContext* context, TimezoneJsonResponse* response, NSError* error) { 
       //Add code here
    }];
```

#### Errors

| Error Code | Error Description |
|------------|-------------------|
| 400 | Error code 1003: Parameter 'q' not provided.Error code 1005: API request url is invalid.Error code 1006: No location found matching parameter 'q'Error code 9999: Internal application error. |
| 401 | Error code 1002: API key not provided.Error code 2006: API key provided is invalid |
| 403 | Error code 2007: API key has exceeded calls per month quota.<br />Error code 2008: API key has been disabled. |



### <a name="get_astronomy_async_with_q"></a>![Method: ](https://apidocs.io/img/method.png ".APIsController.getAstronomyAsyncWithQ") getAstronomyAsyncWithQ

> Return Location and Astronomy Object


```objc
function getAstronomyAsyncWithQ:(NSString*) q
                dt:(NSDate*) dt
                completionBlock:(CompletedGetAstronomy) onCompleted(q dt : dt)
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| q |  ``` Required ```  | Pass US Zipcode, UK Postcode, Canada Postalcode, IP address, Latitude/Longitude (decimal degree) or city name. Visit [request parameter section](https://www.weatherapi.com/docs/#intro-request) to learn more. |
| dt |  ``` Required ```  | Date on or after 1st Jan, 2015 in yyyy-MM-dd format |





#### Example Usage

```objc
    // Parameters for the API call
    NSString* q = @"q";
    NSDate* dt = [NSDate date];

    [self.aPIs getAstronomyAsyncWithQ: q dt : dt  completionBlock:^(BOOL success, HttpContext* context, AstronomyJsonResponse* response, NSError* error) { 
       //Add code here
    }];
```

#### Errors

| Error Code | Error Description |
|------------|-------------------|
| 400 | Error code 1003: Parameter 'q' not provided.Error code 1005: API request url is invalid.Error code 1006: No location found matching parameter 'q'Error code 9999: Internal application error. |
| 401 | Error code 1002: API key not provided.Error code 2006: API key provided is invalid |
| 403 | Error code 2007: API key has exceeded calls per month quota.<br />Error code 2008: API key has been disabled. |



[Back to List of Controllers](#list_of_controllers)



