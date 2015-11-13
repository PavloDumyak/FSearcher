//
//  TableFilmViewController.m
//  FSearcher
//
//  Created by Pavlo Dumyak on 11/13/15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import "TableFilmViewController.h"

@interface TableFilmViewController ()

@end

@implementation TableFilmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSaver = [FSDataSaver sharedInstance];
    self.film = [FSFilm alloc];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3
                                                      target:self
                                                    selector:@selector(reloadDATA)
                                                    userInfo:nil repeats:YES];
    [timer fire];
}

- (IBAction)changeFilmCategory:(id)sender
{

    [FSDataSaver updateData:self.segmentedFilmController.selectedSegmentIndex];
}

- (void)reloadDATA
{
  [self.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [self.dataSaver.films count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    self.film = self.dataSaver.films[indexPath.row];
    cell.textLabel.text = self.film.title;
    if ([self.film.image isEqual:nil])
    {
        cell.imageView.image = [UIImage imageNamed:@"No_Image_Available.png"];
    }
    else
    {
    cell.imageView.image = [UIImage imageWithData:self.film.image];
    }
    return cell;
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
