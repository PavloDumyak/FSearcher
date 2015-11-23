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
@property (nonatomic, strong) NSArray *searchingFilms;
@property (nonatomic, assign) NSInteger totalPages;
@property (nonatomic, strong) NSArray *allPostersPath;
@property (nonatomic, strong) NSArray *ImageData;

@property (nonatomic, strong) NSString *trailersID;

+ (instancetype)sharedInstance;
+ (void)updateData:(NSInteger)type :(NSInteger)page;
+ (void)getAllImageForCollection: (NSInteger)filmID;
+ (void)getSearchingData:(NSString*)query;
+ (void)getTrailers: (NSInteger)filmID;
@end
