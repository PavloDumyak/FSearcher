//
//  FSDownloading.h
//  FSearcher
//
//  Created by Pavlo Dumyak on 11/13/15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSUrlFetcher.h"
@interface FSDownloading : NSObject

- (void)downloadDataTask:(void (^)(NSData* json))onCompletition;
+ (void)downloadImage:(NSString *)imagePath :(void (^)(NSData* image))onCompletition;
@end
