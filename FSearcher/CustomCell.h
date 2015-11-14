//
//  CustomCell.h
//  FSearcher
//
//  Created by Admin on 14.11.15.
//  Copyright (c) 2015 Pavlo Dumyak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *customTitle;
@property (weak, nonatomic) IBOutlet UIImageView *customImageView;
@property (weak, nonatomic) IBOutlet UILabel *customRated;
@property (weak, nonatomic) IBOutlet UILabel *customDateRelease;
@end
