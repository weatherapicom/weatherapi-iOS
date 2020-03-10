//
//  WeatherAPI
//
//  This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ).
//
#import "Condition.h"

@implementation Condition

/**
* Weather condition text
*/
@synthesize text;

/**
* Weather icon url
*/
@synthesize icon;

/**
* Weather condition unique code.
*/
@synthesize code;



/**
* Key mappings for the json serialization and deserialization
*/
+(NSDictionary*) keyMap
{
    NSMutableDictionary* map = [[NSMutableDictionary alloc] init];
    [map addEntriesFromDictionary: @{
        @"text": @"text",
        @"icon": @"icon",
        @"code": @"code"  
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