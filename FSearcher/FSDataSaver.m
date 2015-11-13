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

@end
