//
//  FSDownloading.m
//  FSearcher
//
//  Created by Pavlo Dumyak on 11/13/15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import "FSDownloading.h"

@implementation FSDownloading

- (void)downloadDataTask:(void (^)(NSData* json))onCompletition
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[FSUrlFetcher getTopRatedFilmsURL]];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *error) {
                                      
                                      if (error) {
            
                                          return;
                                      }
                                      
                                      if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                                          NSLog(@"Response HTTP Status code: %ld\n", (long)[(NSHTTPURLResponse *)response statusCode]);
                                          NSLog(@"Response HTTP Headers:\n%@\n", [(NSHTTPURLResponse *)response allHeaderFields]);
                                      }
                                      
                                      onCompletition(data);
                                  }];
    [task resume];
}




+ (void)downloadImage:(NSString *)imagePath :(void (^)(NSData* image))onCompletition
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0) ,^{
         NSData *image;
         image = [NSData dataWithContentsOfURL:[FSUrlFetcher getImage:imagePath]];
        dispatch_async(dispatch_get_main_queue(),^{
            onCompletition(image);
        });
    });
}


@end
