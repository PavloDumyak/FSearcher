//
//  ShowPhotoViewController.h
//  FSearcher
//
//  Created by Admin on 15.11.15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowPhotoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (nonatomic, strong) NSData *image;
@end
