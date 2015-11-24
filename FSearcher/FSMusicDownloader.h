//
//  FSMusicDownloader.h
//  FSearcher
//
//  Created by Admin on 24.11.15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VKSdk.h"
#import "FSDataSaver.h"
@interface FSMusicDownloader : NSObject

@property (nonatomic, strong) NSArray *musicList;
+ (void)getMyMusicFromVK :(void (^)(void))onCompletition;

@end
