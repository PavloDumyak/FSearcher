//
//  FSShowDetailViewController.h
//  FSearcher
//
//  Created by Admin on 15.11.15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSFilm.h"
#import "CustomCollectionViewCell.h"
#import "FSDataSaver.h"
@interface FSShowDetailViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scroller;
@property (nonatomic, strong)FSDataSaver *dataSaver;
@property (nonatomic, strong) FSFilm *filmDetail;
@property (weak, nonatomic) IBOutlet UIImageView *filmPoster;
@property (weak, nonatomic) IBOutlet UITextView *filmTitle;
@property (weak, nonatomic) IBOutlet UITextView *completeTitleLable;
@property (nonatomic, strong) NSMutableString *completeTitle;
@property (weak, nonatomic) IBOutlet UICollectionView *colectionView;
@property (weak, nonatomic) IBOutlet UITextView *filmOverview;

@property (nonatomic, strong) NSArray *posters;
@end