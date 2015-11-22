//
//  FSUrlFetcher.m
//  FSearcher
//
//  Created by Pavlo Dumyak on 11/13/15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import "FSUrlFetcher.h"

@implementation FSUrlFetcher

+ (NSURL*)getTopRatedFilmsURL:(NSInteger)page
{
    NSMutableString *base = [NSMutableString stringWithString: SITE_ADDRESS];
    [base appendString:TOP_RATED];
    [base appendString:PAGE];
    [base appendString:[NSString stringWithFormat:@"%lu",page]];
    [base appendString:API_KEY];
    return [NSURL URLWithString:base];
}

+ (NSURL*)getPopularFilmsURL:(NSInteger)page
{
    NSMutableString *base = [NSMutableString stringWithString: SITE_ADDRESS];
    [base appendString:POPULAR];
    [base appendString:PAGE];
    [base appendString:[NSString stringWithFormat:@"%lu",page]];
    [base appendString:API_KEY];
    return [NSURL URLWithString:base];
}

+ (NSURL*)getUpcomingFilmsURL:(NSInteger)page
{
    NSMutableString *base = [NSMutableString stringWithString: SITE_ADDRESS];
    [base appendString:UPCOMING];
    [base appendString:PAGE];
    [base appendString:[NSString stringWithFormat:@"%lu",page]];
    [base appendString:API_KEY];
    return [NSURL URLWithString:base];
}

+ (NSURL*)getImage:(NSString *)imagePath
{
    NSMutableString *base = [NSMutableString stringWithString: IMAGE];
    if(imagePath ==nil)
    {
       [base appendString:@"none"];
    }
    else
    {
       [base appendString:imagePath];
    }

    return [NSURL URLWithString:base];
}

+ (NSURL*)getImagesPath:(NSInteger)filmID
{
    NSMutableString *base = [NSMutableString stringWithString: SITE_ADDRESS];
    [base appendString:GET_IMAGE_PATH];
    NSString *ID = [NSString stringWithFormat:@"%ld",(long)filmID];
    [base appendString:ID];
    [base appendString:IM];
    [base appendString:API_KEY_FOR_IM];
    return [NSURL URLWithString:base];
}

+ (NSURL*)searchingURL:(NSString*)query
{
    NSMutableString *base = [NSMutableString stringWithString: SITE_ADDRESS];
    [base appendString:SEARCH_PATH_BEGIN];
    [base appendString:query];
    [base appendString:API_KEY];
    NSString *encodedString = [base stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *myURL = [[NSURL alloc] initWithString:encodedString];
    return myURL;
    
    
}



@end
