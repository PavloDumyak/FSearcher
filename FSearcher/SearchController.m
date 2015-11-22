//
//  SearchController.m
//  FSearcher
//
//  Created by Admin on 16.11.15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import "SearchController.h"
static NSInteger cellTag = 0;
@interface SearchController ()

@end

@implementation SearchController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.revealViewController.delegate=self;
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    self.dataSaver = [FSDataSaver sharedInstance];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3
                                                      target:self
                                                    selector:@selector(downloadFirstThreeImages2)
                                                    userInfo:nil repeats:YES];
    [timer fire];

}

- (void)tableView:(UITableView *)tableView willDisplayCell:(CustomCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.transform = CGAffineTransformMakeScale(0.8, 0.8);
    [UIView animateWithDuration:0.5 animations:^{
        cell.transform = CGAffineTransformIdentity;
    }];
    
    FSFilm *film = self.dataSaver.searchingFilms[indexPath.row];
    
    if(self.dataSaver.searchingFilms !=nil)
    {
        if(film.isImageLoad==NO){
            film.isImageLoad = YES;
            
            [FSDownloading downloadImage:film.posterPath :^(NSData *image) {
                [film setImage: image];
                [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
                
            }];
        }
    }
}


-(void)downloadFirstThreeImages2
{
    
    if(self.dataSaver.searchingFilms!=nil)
    {
        for(NSInteger count = 0;count < 3;count++)
        {
            NSIndexPath *myIP = [NSIndexPath indexPathForRow:count inSection:0];
            FSFilm *film = self.dataSaver.searchingFilms[count];
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


- (void)viewWillDisappear:(BOOL)animated
{
    self.dataSaver.searchingFilms = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)searchFilms:(id)sender
{
    [FSDataSaver getSearchingData:self.textInput.text];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;//self.dataSaver.searchingFilms.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.showDetailButton.tag = indexPath.row;
    self.film = self.dataSaver.searchingFilms[indexPath.row];
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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    cellTag = indexPath.row;
    [self performSegueWithIdentifier:@"ShowDetail" sender:self];
}


- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return NO;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if([segue.identifier isEqualToString:@"ShowDetail"])
    {
        FSFilm *film = self.dataSaver.searchingFilms[cellTag];
        //[FSDataSaver getAllImageForCollection:film.ID];
        FSShowDetailViewController *showDetail = [segue destinationViewController];
        [showDetail setFilmDetail:self.dataSaver.searchingFilms[cellTag]];
    }
}





@end
