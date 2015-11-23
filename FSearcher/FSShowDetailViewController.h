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
#import "ShowPhotoViewController.h"
#import "FSYouTube.h"


@interface FSShowDetailViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIScrollView *scroller;
@property (nonatomic, strong)FSDataSaver *dataSaver;
@property (nonatomic, strong) FSFilm *filmDetail;
@property (weak, nonatomic) IBOutlet UIImageView *filmPoster;
@property (weak, nonatomic) IBOutlet UITextView *filmTitle;
@property (weak, nonatomic) IBOutlet UITextView *completeTitleLable;
@property (nonatomic, strong) NSMutableString *completeTitle;
@property (weak, nonatomic) IBOutlet UICollectionView *colectionView;
@property (weak, nonatomic) IBOutlet UITextView *filmOverview;
@property (nonatomic, assign) NSInteger indexRow;
@property (nonatomic, strong) NSArray *posters;
@property (weak, nonatomic) IBOutlet UIWebView *video;

@property (weak, nonatomic) IBOutlet UIView *videoScreen;



@end
