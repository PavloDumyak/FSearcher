//
//  FSFilm.m
//  FSearcher
//
//  Created by Pavlo Dumyak on 11/13/15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import "FSFilm.h"

@implementation FSFilm


-(FSFilm*)init:(NSDictionary*)object
{
    self = [super init];
    if (self)
    {
      [self parsing:object];
    }
    return  self;
}


-(void)parsing:(NSDictionary*)object
{
    self.ID =  ![[object valueForKey:@"id"] isKindOfClass:[NSNull class]]? [[object valueForKey:@"id"] integerValue]: 0;
    self.title =![[object valueForKey:@"title"] isKindOfClass:[NSNull class]] ? [object valueForKey:@"title"] : nil;
    self.overview = ![[object valueForKey:@"overview"] isKindOfClass:[NSNull class]] ? [object valueForKey:@"overview"] : nil;
    self.adult = [object valueForKey:@"adult"];
    self.originalTitle = [object valueForKey:@"original_title"];
    self.originalLanguge = [object valueForKey:@"original_language"];
    self.popularity = [[object valueForKey:@"popularity"] floatValue];
    self.voteCount = [[object valueForKey:@"vote_count"] integerValue];
    self.vote_average = [[object valueForKey:@"vote_average"] integerValue];
    NSString *dateStr = [object valueForKey:@"release_date"];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-dd-mm"];
    self.releaseDate= [dateFormat dateFromString:dateStr];
    self.posterPath = ![[object valueForKey:@"poster_path"] isKindOfClass:[NSNull class]] ?  [object valueForKey:@"poster_path"] : @"none";
    self.isImageLoad = NO;
    
    
}

@end
