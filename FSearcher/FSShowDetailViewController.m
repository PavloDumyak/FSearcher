//
//  FSShowDetailViewController.m
//  FSearcher
//
//  Created by Admin on 15.11.15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import "FSShowDetailViewController.h"

@interface FSShowDetailViewController ()

@end

@implementation FSShowDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.scroller setScrollEnabled:YES];
    //[self.scroller setContentSize:CGSizeMake(self.contentView.bounds.size.width, 1200)];
    self.dataSaver = [FSDataSaver sharedInstance];
    [self makeCompleteTitle];
    [self loadSheet];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateCollection) userInfo:nil repeats:YES];
    
    //self.playerView =  [[YTPlayerView alloc] initWithFrame:self.videoScreen.frame];
    //[self.playerView loadWithVideoId:@"M7lc1UVf-VE"];
   // [self.videoScreen addSubview:self.playerView];
    NSString *code = @"<iframe width=\"640\" height=\"360\" src=\"https://www.youtube.com/embed/36db4r3MsgU\" frameborder=\"0\" allowfullscreen></iframe>";
    [[self video]loadHTMLString:code baseURL:nil];

    
}


- (void)loadSheet
{
    NSLog(@"%ld",(long)self.filmDetail.ID);
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.scroller.contentInset = UIEdgeInsetsZero;
    self.scroller.scrollIndicatorInsets = UIEdgeInsetsZero;
    self.scroller.contentOffset = CGPointMake(0.0, 0.0);
    self.filmTitle.text = self.filmDetail.title;
    self.completeTitleLable.text = self.completeTitle;
    self.filmPoster.image = [UIImage imageWithData: self.filmDetail.image];
    self.filmOverview.text = self.filmDetail.overview;
}

- (void)viewWillDisappear:(BOOL)animated
{
    
    FSDataSaver *data = [FSDataSaver sharedInstance];
    //data.films = nil;
   // data.ImageData = nil;
}

- (void)updateCollection
{
    [self.colectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSaver.ImageData.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PhotoCell" forIndexPath:indexPath];
    cell.photoView.image = [UIImage imageWithData:self.dataSaver.ImageData[indexPath.row]];
    return cell;
}


- (void)makeCompleteTitle
{
    self.completeTitle = [NSMutableString stringWithString:@""];
    [self.completeTitle appendString:@"\n"];
    [self.completeTitle appendString:@"Rating:"];
    [self.completeTitle appendString:[NSString stringWithFormat:@"%f",self.filmDetail.popularity]];
    [self.completeTitle appendString:@"\n"];
    [self.completeTitle appendString:@"Release Date:"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd/mm/yyyy"];
    NSString *stringFromDate = [formatter stringFromDate:self.filmDetail.releaseDate];
    [self.completeTitle appendString:stringFromDate];
    [self.completeTitle appendString:@"\nAdult content: NO"];
    [self.completeTitle appendString:@"\nOriginal languge:"];
    [self.completeTitle appendString:self.filmDetail.originalLanguge];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return NO;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self setIndexRow:indexPath.row];
    [self performSegueWithIdentifier:@"photoView" sender:self];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ShowPhotoViewController *photoController = [segue destinationViewController];
    [photoController setImage: self.dataSaver.ImageData[self.indexRow]];
}


@end
