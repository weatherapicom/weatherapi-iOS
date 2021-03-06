//
//  WeatherAPI
//
//  This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ).
//
#import "SearchJsonResponse.h"

@implementation SearchJsonResponse

/**
* TODO: Write general description for this method
*/
@synthesize mid;

/**
* Local area name.
*/
@synthesize name;

/**
* Local area region.
*/
@synthesize region;

/**
* Country
*/
@synthesize country;

/**
* Area latitude
*/
@synthesize lat;

/**
* Area longitude
*/
@synthesize lon;

/**
* TODO: Write general description for this method
*/
@synthesize url;



/**
* Key mappings for the json serialization and deserialization
*/
+(NSDictionary*) keyMap
{
    NSMutableDictionary* map = [[NSMutableDictionary alloc] init];
    [map addEntriesFromDictionary: @{
        @"id": @"mid",
        @"name": @"name",
        @"region": @"region",
        @"country": @"country",
        @"lat": @"lat",
        @"lon": @"lon",
        @"url": @"url"  
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