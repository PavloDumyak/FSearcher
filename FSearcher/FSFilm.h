//
//  FSFilm.h
//  FSearcher
//
//  Created by Pavlo Dumyak on 11/13/15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSDownloading.h"
@interface FSFilm : NSObject

@property (nonatomic, assign) BOOL adult;
@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, strong) NSString *originalLanguge;
@property (nonatomic, strong) NSString *originalTitle;
@property (nonatomic, strong) NSString *overview;
@property (nonatomic, strong) NSDate *releaseDate;
@property (nonatomic, strong) NSString *posterPath;
@property (nonatomic, assign) float popularity;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) float vote_average;
@property (nonatomic, assign) NSInteger voteCount;
@property (nonatomic, strong) NSData *image;


-(FSFilm*)init:(NSDictionary*)object;
-(void)parsing:(NSDictionary*)object;
@end
