//
//  ShowPhotoViewController.m
//  FSearcher
//
//  Created by Admin on 15.11.15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import "ShowPhotoViewController.h"

@interface ShowPhotoViewController ()

@end

@implementation ShowPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.photoView.image = [UIImage imageWithData:self.image];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
