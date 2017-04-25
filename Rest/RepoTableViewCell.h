//
//  RepoTableViewCell.h
//  Rest
//
//  Created by SHON on 23/04/2017.
//  Copyright © 2017 SHON. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RepoTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *repoNameLabel;
@property (nonatomic, weak) IBOutlet UIImageView *repoImageView;
@property (nonatomic, weak) IBOutlet UILabel *repoDescribeLabel;
@property (nonatomic, weak) IBOutlet UILabel *repoStarCountLabel;

@end
