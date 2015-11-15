//
//  FSUrlFetcher.h
//  FSearcher
//
//  Created by Pavlo Dumyak on 11/13/15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSPathDefines.h"
@interface FSUrlFetcher : NSObject
+ (NSURL*)getTopRatedFilmsURL:(NSInteger)page;
+ (NSURL*)getPopularFilmsURL:(NSInteger)page;
+ (NSURL*)getUpcomingFilmsURL:(NSInteger)page;
+ (NSURL*)getImage:(NSString*)imagePath;
+ (NSURL*)getImagesPath:(NSInteger)filmID;

@end
