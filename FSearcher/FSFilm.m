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
    self.title = [object valueForKey:@"title"];
    self.overview = [object valueForKey:@"overview"];
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
    self.posterPath = [object valueForKey:@"poster_path"];
    [FSDownloading downloadImage:self.posterPath :^(NSData *image) {
        self.image = image;
    }];
   
    
    
}

@end
