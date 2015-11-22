//
//  TableFilmViewController.m
//  FSearcher
//
//  Created by Pavlo Dumyak on 11/13/15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import "TableFilmViewController.h"
#import "FSShowDetailViewController.h"
@interface TableFilmViewController ()

@end

@implementation TableFilmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
    self.revealViewController.delegate = self;
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self.tableView addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    self.dataSaver = [FSDataSaver sharedInstance];
    self.film = [FSFilm alloc];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3
                                                      target:self
                                                    selector:@selector(downloadFirstThreeImages)
                                                    userInfo:nil repeats:YES];
    [timer fire];
    self.numberOfPage.text = [NSString stringWithFormat:@"%ld/%ld",(long)currentPage,(long)self.dataSaver.totalPages];
    self.navigationController.navigationBar.topItem.title = @"Films";
  
}




- (void)tableView:(UITableView *)tableView willDisplayCell:(CustomCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.transform = CGAffineTransformMakeScale(0.8, 0.8);
    [UIView animateWithDuration:0.5 animations:^{
        cell.transform = CGAffineTransformIdentity;
    }];

    FSFilm *film = self.dataSaver.films[indexPath.row];
    
           if(self.dataSaver.films !=nil)
        {
            NSLog(@"%ld",(long)indexPath.row);

            if(film.isImageLoad==NO){
                film.isImageLoad = YES;
                
                [FSDownloading downloadImage:film.posterPath :^(NSData *image) {
                    [film setImage: image];
                    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
                    
                }];
            }
        }
   }


-(void)downloadFirstThreeImages
{

    if(self.dataSaver.films!=nil)
    {
       for(NSInteger count = 0;count < 3;count++)
       {
           NSIndexPath *myIP = [NSIndexPath indexPathForRow:count inSection:0];
           FSFilm *film = self.dataSaver.films[count];
           if(film.isImageLoad==NO)
               {
                  [FSDownloading downloadImage:film.posterPath :^(NSData *image)
                  {
                     [film setImage: image];
                     [self.tableView reloadRowsAtIndexPaths:@[myIP] withRowAnimation:UITableViewRowAnimationNone];
                  }];
               }
        }
    }
    
}

    
    
- (void)getTopOfTavleView
{
    [self.tableView setContentOffset:CGPointZero animated:YES];
}



- (IBAction)changeFilmCategory:(id)sender
{
    [self getTopOfTavleView];
    @autoreleasepool {
    currentPage = 1;
    [FSDataSaver updateData:self.segmentedFilmController.selectedSegmentIndex :currentPage];
    self.numberOfPage.text = [NSString stringWithFormat:@"%ld/%ld",(long)currentPage,(long)self.dataSaver.totalPages];
    }
}



- (IBAction)prevPage:(id)sender
{ if(currentPage > 1)
    {
        [self getTopOfTavleView];
        currentPage--;
        [FSDataSaver updateData:self.segmentedFilmController.selectedSegmentIndex :currentPage];
        self.numberOfPage.text = [NSString stringWithFormat:@"%ld/%ld",(long)currentPage,(long)self.dataSaver.totalPages];
         [self.tableView reloadData];
    }
}
- (IBAction)nextPage:(id)sender
{
    if(currentPage < self.dataSaver.totalPages)
    {
        [self getTopOfTavleView];
        currentPage++;
        [FSDataSaver updateData:self.segmentedFilmController.selectedSegmentIndex :currentPage];
        self.numberOfPage.text = [NSString stringWithFormat:@"%ld/%ld",(long)currentPage,(long)self.dataSaver.totalPages];
         [self.tableView reloadData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  20;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        static NSString *cellIdentifier = @"cell";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.showDetailButton.tag = indexPath.row;
    self.film = self.dataSaver.films[indexPath.row];
    cell.customTitle.text = self.film.title;
    NSMutableString *popularity = [NSMutableString stringWithString:@"Rating:"];
    [popularity appendString:[NSString stringWithFormat:@"%.1f", self.film.vote_average]];
    cell.customRated.text = popularity;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    NSString *stringFromDate = [formatter stringFromDate:self.film.releaseDate];
    cell.customDateRelease.text = stringFromDate;
    if (self.film.image == nil)
    {
        cell.customImageView.image = [UIImage imageNamed:@"No_Image_Available.png"];
    }
    else
    {
        cell.customImageView.image = [UIImage imageWithData:self.film.image];
    }
        return cell;
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Navigation




- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if([identifier isEqualToString:@"ShowDetail"])
    {
        return YES;
    }
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   
        FSFilm *film = self.dataSaver.films[[sender tag]];
       // [FSDataSaver getAllImageForCollection:film.ID];
        FSShowDetailViewController *showDetail = [segue destinationViewController];
        [showDetail setFilmDetail:self.dataSaver.films[[sender tag]]];
    
}


@end
