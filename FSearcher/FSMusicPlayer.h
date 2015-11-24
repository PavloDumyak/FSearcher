//
//  FSMusicPlayer.h
//  FSearcher
//
//  Created by Admin on 24.11.15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface FSMusicPlayer : NSObject
@property(nonatomic, strong) NSTimer *timer;
@property(nonatomic, assign) float duration;


+ (instancetype) sharedPlayer;

- (void) playWithStringPath:(NSString *)url;
- (BOOL) playerCreated;
- (float) rate;
- (void) pause;
- (void) stop;
- (void) playCurrentAudioTrack;
- (float) currentTime;
- (void) seekToTime:(CMTime)sliderValueTime;

@end
