//
//  NWNewsTableViewController.h
//  Newses
//
//  Created by Admin on 01.08.14.
//  Copyright (c) 2014 VantuZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NWNewsTableViewController : UITableViewController

@property (retain, nonatomic) IBOutlet UIImageView *groupAvatar;
@property (retain, nonatomic) IBOutlet UILabel *groupTitle;
@property (retain, nonatomic) IBOutlet UILabel *newsDate;
@property (retain, nonatomic) IBOutlet UITextView *newsText;

@property (retain, nonatomic) NSDictionary *groupsIds;

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
