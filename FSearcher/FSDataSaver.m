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

+ (void)updateData:(NSInteger)type
{
    
    [FSDownloading downloadDataTask:type :^(NSData *json) {
        NSDictionary* JSON = [NSJSONSerialization JSONObjectWithData:json
                                                             options:0
                                                               error:nil];
        
        NSArray *arrayOfData= [JSON valueForKey:@"results"];
        
        FSDataSaver *dataSaver = [FSDataSaver sharedInstance];
        NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithCapacity:100];
        for (id obj in arrayOfData)
        {
            FSFilm *film = [[FSFilm alloc] init];
            [mutableArray addObject:[film init:obj]];
        }
        
       [FSDownloading downloadImageWithArray:mutableArray :^(NSData *image) {
           
       }];
        
        [dataSaver setFilms:mutableArray];
         
    
    }];
    
}
@end
