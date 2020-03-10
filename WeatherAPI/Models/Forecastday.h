//
//  WeatherAPI
//
//  This file was automatically generated by APIMATIC v2.0 ( https://apimatic.io ).
//
#ifndef APIMATIC_FORECASTDAY
#define APIMATIC_FORECASTDAY

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "APIHelper.h"

#import "Day.h"
#import "Astro.h"


//protocol defined for deserialization of JSON
@protocol Forecastday
@end

@interface Forecastday : JSONModel

/**
* Forecast date
*/
@property NSString* date;

/**
* Forecast date as unix time.
*/
@property NSNumber* dateEpoch;

/**
* See day element
*/
@property Day* day;

/**
* TODO: Write general description for this field
*/
@property Astro* astro;


/**
* Key mappings for the json serialization and deserialization
*/
+(NSDictionary*) keyMap;

/**
* Key mapper for json serialization and deserialization
*/
+(JSONKeyMapper*) keyMapper;

/**
* Helps avoiding deserialization errors when one or more properties are missing
* @returns	True, indicating that all properties are optional for deserialization
*/
+(BOOL)propertyIsOptional:(NSString*) propertyName;

@end
#endif