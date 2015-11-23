//
//  SearchController.h
//  FSearcher
//
//  Created by Admin on 16.11.15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWRevealViewController.h"
#import "FSDataSaver.h"
#import "CustomCell.h"
#import "FSFilm.h"
#import "FSShowDetailViewController.h"
#import "FSYouTube.h"
@interface SearchController : UIViewController<SWRevealViewControllerDelegate, UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textInput;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *searchButton;
@property (nonatomic, strong) FSDataSaver* dataSaver;
@property (nonatomic, strong) FSFilm *film;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSTimer *timer;

@end
