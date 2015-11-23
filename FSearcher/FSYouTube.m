//
//  FSYouTube.m
//  FSearcher
//
//  Created by Admin on 23.11.15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import "FSYouTube.h"

@implementation FSYouTube

+ (NSMutableString*)getCompleteURLForTrailer:(NSString*)filmID :(NSInteger)height :(NSInteger)width
{
    NSMutableString *code =[NSMutableString stringWithFormat: @"<iframe width=\"%ld\" height=\"%ld\" src=\"https://www.youtube.com/embed/",(long)width,(long)height];
    [code appendString:filmID];
    [code appendString:@"\" frameborder=\"0\" allowfullscreen></iframe>"];
    return code;
}

@end
