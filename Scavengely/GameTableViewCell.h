//
//  GameTableViewCell.h
//  Scavengely
//
//  Created by Jay Whitsitt on 7/19/2014.
//  Copyright (c) 2014 Jay Whitsitt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *gameImage;
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *numberOfMissions;

@end
