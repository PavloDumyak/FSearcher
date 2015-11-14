//
//  TableFilmViewController.h
//  FSearcher
//
//  Created by Pavlo Dumyak on 11/13/15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSDataSaver.h"
#import "FSFilm.h"
#import "FSDownloading.h"
#import "CustomCell.h"

static NSInteger currentPage = 1;

@interface TableFilmViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) FSDataSaver *dataSaver;
@property (nonatomic, strong) FSFilm *film;
@property (nonatomic, strong) NSArray *currentFilms;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedFilmController;
@property (weak, nonatomic) IBOutlet UILabel *numberOfPage;
@end
