//
//  FSMusicPlayer.m
//  FSearcher
//
//  Created by Admin on 24.11.15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import "FSMusicPlayer.h"
static AVPlayer *player;
@implementation FSMusicPlayer
+ (instancetype) sharedPlayer
{
    static FSMusicPlayer *sharedPlayer = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedPlayer = [[FSMusicPlayer alloc] init];
    });
    return sharedPlayer;
}


#pragma mark - Public methods

- (void) playWithStringPath:(NSString *)url
{
    
    if (player)
    {
        [self stop];
    }
    player = [[AVPlayer alloc]initWithURL:[NSURL URLWithString:url]];
    
    if ([player rate] == 0)
    {
        if (self.timer)
        {
            [self.timer invalidate];
            self.timer = nil;
        }
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(currentTimeChanging) userInfo:nil repeats:YES];
        [player addObserver:self forKeyPath:@"status" options:0 context:NULL];
    }
}

- (BOOL) playerCreated
{
    return player ? YES : NO;
}

- (float) rate
{
    return  [player rate];
}

- (void) pause
{
    [player pause];
}

- (void) stop
{
    if (player)
    {
        [player pause];
        [player removeObserver:self forKeyPath:@"status"];
        player = nil;
    }
}

- (void) playCurrentAudioTrack
{
    [player play];
}

- (float) currentTime
{
    return CMTimeGetSeconds(player.currentItem.currentTime);
}

- (void) seekToTime:(CMTime)sliderValueTime
{
    [player seekToTime: sliderValueTime];
}


#pragma mark - Action methods

- (void)currentTimeChanging {
    _duration = CMTimeGetSeconds(player.currentItem.duration);
    if (isnan(_duration)) {
        _duration = 1;
    }
}


#pragma mark - Notification observers

- (void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"status"]) {
        if (player.status == AVPlayerStatusReadyToPlay) {
            [player play];
            _duration = CMTimeGetSeconds(player.currentItem.duration);
        } else if (player.status == AVPlayerStatusFailed) {
            NSLog(@"Error! player.status == AVPlayerStatusFailed");
        }
    }
}
@end
