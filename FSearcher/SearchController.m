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
                                                    selector:@selector(reloadDATA)
                                                    userInfo:nil repeats:YES];
    [timer fire];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)searchFilms:(id)sender
{
    [FSDataSaver getSearchingData:self.textInput.text];
}

- (void) reloadDATA
{
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSaver.searchingFilms.count;
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
        [FSDataSaver getAllImageForCollection:film.ID];
        FSShowDetailViewController *showDetail = [segue destinationViewController];
        [showDetail setFilmDetail:self.dataSaver.searchingFilms[cellTag]];
    }
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
