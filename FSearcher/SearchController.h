//
//  SearchController.h
//  FSearcher
//
//  Created by Admin on 16.11.15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
@interface SearchController : UIViewController<SWRevealViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *inputRequest;
@property (weak, nonatomic) IBOutlet UIButton *buttonSearch;

@end
