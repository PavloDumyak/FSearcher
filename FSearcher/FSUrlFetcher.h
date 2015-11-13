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
+ (NSURL*)getTopRatedFilmsURL;
+ (NSURL*)getPopularFilmsURL;
+ (NSURL*)getUpcomingFilmsURL;
+ (NSURL*)getImage:(NSString*)imagePath;
@end
