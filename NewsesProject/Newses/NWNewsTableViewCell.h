//
//  NWNewsTableViewCell.h
//  Newses
//
//  Created by Admin on 03.08.14.
//  Copyright (c) 2014 VantuZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NWTableViewController.h"
#import "NWNewsTableViewController.h"

@interface NWNewsTableViewCell : UITableViewCell

@property (retain, nonatomic) IBOutlet UIImageView *groupAvatar;
@property (retain, nonatomic) IBOutlet UILabel *groupTitle;
@property (retain, nonatomic) IBOutlet UILabel *newsDate;
@property (retain, nonatomic) IBOutlet UITextView *newsText;

-(void)setupNewsTableCell;
// REVIEW Что это? Зачем оно здесь?

@end
