//
//  WeatherAPI
//
//  This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ).
//
#import "Current.h"

@implementation Current

/**
* Local time when the real time data was updated in unix time.
*/
@synthesize lastUpdatedEpoch;

/**
* Local time when the real time data was updated.
*/
@synthesize lastUpdated;

/**
* Temperature in celsius
*/
@synthesize tempC;

/**
* Temperature in fahrenheit
*/
@synthesize tempF;

/**
* 1 = Yes 0 = No <br />Whether to show day condition icon or night icon
*/
@synthesize isDay;

/**
* TODO: Write general description for this method
*/
@synthesize condition;

/**
* Wind speed in miles per hour
*/
@synthesize windMph;

/**
* Wind speed in kilometer per hour
*/
@synthesize windKph;

/**
* Wind direction in degrees
*/
@synthesize windDegree;

/**
* Wind direction as 16 point compass. e.g.: NSW
*/
@synthesize windDir;

/**
* Pressure in millibars
*/
@synthesize pressureMb;

/**
* Pressure in inches
*/
@synthesize pressureIn;

/**
* Precipitation amount in millimeters
*/
@synthesize precipMm;

/**
* Precipitation amount in inches
*/
@synthesize precipIn;

/**
* Humidity as percentage
*/
@synthesize humidity;

/**
* Cloud cover as percentage
*/
@synthesize cloud;

/**
* Feels like temperature as celcius
*/
@synthesize feelslikeC;

/**
* Feels like temperature as fahrenheit
*/
@synthesize feelslikeF;

/**
* TODO: Write general description for this method
*/
@synthesize visKm;

/**
* TODO: Write general description for this method
*/
@synthesize visMiles;

/**
* UV Index
*/
@synthesize uv;

/**
* Wind gust in miles per hour
*/
@synthesize gustMph;

/**
* Wind gust in kilometer per hour
*/
@synthesize gustKph;



/**
* Key mappings for the json serialization and deserialization
*/
+(NSDictionary*) keyMap
{
    NSMutableDictionary* map = [[NSMutableDictionary alloc] init];
    [map addEntriesFromDictionary: @{
        @"last_updated_epoch": @"lastUpdatedEpoch",
        @"last_updated": @"lastUpdated",
        @"temp_c": @"tempC",
        @"temp_f": @"tempF",
        @"is_day": @"isDay",
        @"condition": @"condition",
        @"wind_mph": @"windMph",
        @"wind_kph": @"windKph",
        @"wind_degree": @"windDegree",
        @"wind_dir": @"windDir",
        @"pressure_mb": @"pressureMb",
        @"pressure_in": @"pressureIn",
        @"precip_mm": @"precipMm",
        @"precip_in": @"precipIn",
        @"humidity": @"humidity",
        @"cloud": @"cloud",
        @"feelslike_c": @"feelslikeC",
        @"feelslike_f": @"feelslikeF",
        @"vis_km": @"visKm",
        @"vis_miles": @"visMiles",
        @"uv": @"uv",
        @"gust_mph": @"gustMph",
        @"gust_kph": @"gustKph"  
    }];

    return map;
}

/**
* Key mapper for json serialization and deserialization
*/
+(JSONKeyMapper*) keyMapper
{ 
  return [[JSONKeyMapper alloc] initWithDictionary: [self keyMap]];
}

/**
* Helps avoiding deserialization errors when one or more properties are missing
* @returns	True, indicating that all properties are optional for deserialization
*/
+(BOOL)propertyIsOptional:(NSString*) propertyName
{
    return YES;
}

@end