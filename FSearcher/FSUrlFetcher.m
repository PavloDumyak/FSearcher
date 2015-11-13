//
//  FSUrlFetcher.m
//  FSearcher
//
//  Created by Pavlo Dumyak on 11/13/15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import "FSUrlFetcher.h"

@implementation FSUrlFetcher

+ (NSURL*)getTopRatedFilmsURL
{
    NSMutableString *base = [NSMutableString stringWithString: SITE_ADDRESS];
    [base appendString:TOP_RATED];
    [base appendString:API_KEY];
    return [NSURL URLWithString:base];
}

+ (NSURL*)getImage:(NSString *)imagePath
{
    NSMutableString *base = [NSMutableString stringWithString: IMAGE];
    [base appendString:imagePath];
    return [NSURL URLWithString:base];
}

@end
