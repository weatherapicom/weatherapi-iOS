//
//  WeatherAPI
//
//  This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ).
//
#import "ForecastJsonResponse.h"

@implementation ForecastJsonResponse

/**
* TODO: Write general description for this method
*/
@synthesize location;

/**
* TODO: Write general description for this method
*/
@synthesize current;

/**
* TODO: Write general description for this method
*/
@synthesize forecast;



/**
* Key mappings for the json serialization and deserialization
*/
+(NSDictionary*) keyMap
{
    NSMutableDictionary* map = [[NSMutableDictionary alloc] init];
    [map addEntriesFromDictionary: @{
        @"location": @"location",
        @"current": @"current",
        @"forecast": @"forecast"  
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