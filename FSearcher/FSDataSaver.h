//
//  FSDataSaver.h
//  FSearcher
//
//  Created by Pavlo Dumyak on 11/13/15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FSDownloading.h"
#import "FSFilm.h"
@interface FSDataSaver : NSObject
@property (nonatomic, strong) NSMutableArray *films;
@property (nonatomic, assign) NSInteger totalPages;
+ (instancetype)sharedInstance;
+ (void)updateData:(NSInteger)type :(NSInteger)page;
@end
