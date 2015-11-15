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
    [self.scroller setContentSize:CGSizeMake(self.view.bounds.size.width, 1000)];
    self.dataSaver = [FSDataSaver sharedInstance];
    [self makeCompleteTitle];
    [self loadSheet];
   
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateCollection) userInfo:nil repeats:YES];
    
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
