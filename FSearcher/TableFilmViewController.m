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
                                                    selector:@selector(reloadDATA)
                                                    userInfo:nil repeats:YES];
    [timer fire];
    self.numberOfPage.text = [NSString stringWithFormat:@"%ld/%ld",(long)currentPage,(long)self.dataSaver.totalPages];
    self.navigationController.navigationBar.topItem.title = @"Films";
    
}


- (IBAction)changeFilmCategory:(id)sender
{
    @autoreleasepool {
    currentPage = 1;
    [FSDataSaver updateData:self.segmentedFilmController.selectedSegmentIndex :currentPage];
    self.numberOfPage.text = [NSString stringWithFormat:@"%ld/%ld",(long)currentPage,(long)self.dataSaver.totalPages];
    }
}

- (void)reloadDATA
{
  [self.tableView reloadData];
}

- (IBAction)prevPage:(id)sender
{ if(currentPage > 1)
    {
        currentPage--;
        [FSDataSaver updateData:self.segmentedFilmController.selectedSegmentIndex :currentPage];
        self.numberOfPage.text = [NSString stringWithFormat:@"%ld/%ld",(long)currentPage,(long)self.dataSaver.totalPages];
    }
}
- (IBAction)nextPage:(id)sender
{
    if(currentPage < self.dataSaver.totalPages)
    {
        currentPage++;
        [FSDataSaver updateData:self.segmentedFilmController.selectedSegmentIndex :currentPage];
        self.numberOfPage.text = [NSString stringWithFormat:@"%ld/%ld",(long)currentPage,(long)self.dataSaver.totalPages];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [self.dataSaver.films count];
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
    if ([self.film.image isEqual:nil])
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
    @autoreleasepool
    {
        FSFilm *film = self.dataSaver.films[[sender tag]];
        [FSDataSaver getAllImageForCollection:film.ID];
        FSShowDetailViewController *showDetail = [segue destinationViewController];
        [showDetail setFilmDetail:self.dataSaver.films[[sender tag]]];
    }
}


@end
