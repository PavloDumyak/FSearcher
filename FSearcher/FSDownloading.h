//
//  FSDownloading.h
//  FSearcher
//
//  Created by Pavlo Dumyak on 11/13/15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSUrlFetcher.h"
#import "FSFilm.h"
@interface FSDownloading : NSObject
+ (void)downloadDataTask:(NSInteger)type :(NSInteger)page :(void (^)(NSData* json))onCompletition;
+ (void)downloadImage:(NSString *)imagePath :(void (^)(NSData* image))onCompletition;
@end
