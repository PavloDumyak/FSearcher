//
//  FSMusicDownloader.m
//  FSearcher
//
//  Created by Admin on 24.11.15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import "FSMusicDownloader.h"

@implementation FSMusicDownloader

+ (void)getMyMusicFromVK :(void (^)(void))onCompletition
{
    FSDataSaver *dataSaver = [FSDataSaver sharedInstance];
    if([[VKSdk  getAccessToken] userId])
    {
        NSDictionary* params =
        [NSDictionary dictionaryWithObjectsAndKeys:@(100), @"count", nil];
        VKRequest * audioReq = [VKApi requestWithMethod:@"audio.get" andParameters:params andHttpMethod:@"GET"];
        [audioReq executeWithResultBlock:^(VKResponse * response)
        {
            VKAudios *audios = [[VKAudios alloc] initWithDictionary:response.json objectClass:VKAudio.class];
            dataSaver.musicList = audios.items;
            onCompletition();
        }
        errorBlock:^(NSError * error)
        {
            if (error.code != VK_API_ERROR)
            {
                [error.vkError.request repeat];
            }
            else
            {
                NSLog(@"VK error: %@", error);
            }
        }];
    }
    
    
}
@end
