//
//  FSYouTube.h
//  FSearcher
//
//  Created by Admin on 23.11.15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSDownloading.h"
@interface FSYouTube : NSObject
+ (NSMutableString*)getCompleteURLForTrailer:(NSString*)filmID :(NSInteger)height :(NSInteger)width;
@end
