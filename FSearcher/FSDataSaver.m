//
//  FSDataSaver.m
//  FSearcher
//
//  Created by Pavlo Dumyak on 11/13/15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import "FSDataSaver.h"

@implementation FSDataSaver

+ (instancetype)sharedInstance
{
    static FSDataSaver *object;
    static dispatch_once_t predicat;
    dispatch_once(&predicat, ^{object = [[FSDataSaver alloc] init];});
    return object;
}

+ (void)updateData:(NSInteger)type :(NSInteger)page
{
    
    [FSDownloading downloadDataTask:type :page :^(NSData *json) {
        NSDictionary* JSON = [NSJSONSerialization JSONObjectWithData:json
                                                             options:0
                                                               error:nil];
        
        NSArray *arrayOfData= [JSON valueForKey:@"results"];
        NSInteger totalPages = [[JSON valueForKey:@"total_pages"] integerValue];
        FSDataSaver *dataSaver = [FSDataSaver sharedInstance];
        NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithCapacity:100];
        for (id obj in arrayOfData)
        {
            FSFilm *film = [[FSFilm alloc] init];
            [mutableArray addObject:[film init:obj]];
        }
        
        
        [dataSaver setFilms:mutableArray];
        [dataSaver setTotalPages:totalPages];
         
    
    }];
}

+ (void)getAllImageForCollection: (NSInteger)filmID
{
    
    [FSDownloading downloadPosterPathes:filmID :^(NSData *json) {
        NSDictionary* JSON = [NSJSONSerialization JSONObjectWithData:json
                                                             options:0
                                                               error:nil];
        
        NSArray *arrayOfData= [JSON valueForKey:@"posters"];
        NSMutableArray *dataPosters = [NSMutableArray array];
        for (id ob in arrayOfData)
        {
            [dataPosters addObject:[ob valueForKey:@"file_path"]];
        }
         FSDataSaver *dataSaver = [FSDataSaver sharedInstance];
        [dataSaver setAllPostersPath:dataPosters];
        
        NSMutableArray *arr = [NSMutableArray array];
        for (int i = 0;i<5;i++) {
            [FSDownloading downloadImage:dataPosters[i] :^(NSData *image) {
                [arr addObject:image];
                [dataSaver setImageData:arr];
            }];
        }
        
    }];
    
}




@end
