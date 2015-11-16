//
//  SearchController.m
//  FSearcher
//
//  Created by Admin on 16.11.15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import "SearchController.h"

@interface SearchController ()

@end

@implementation SearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.revealViewController.delegate=self;
   [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    self.buttonSearch.layer.cornerRadius = 10;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)searchFilms:(id)sender
{
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
