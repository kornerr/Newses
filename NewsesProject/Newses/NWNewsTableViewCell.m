//
//  NWNewsTableViewCell.m
//  Newses
//
//  Created by Admin on 03.08.14.
//  Copyright (c) 2014 VantuZ. All rights reserved.
//

#import "NWNewsTableViewCell.h"


@implementation NWNewsTableViewCell

-(void)setupNewsTableCell
{
    self.groupTitle.text = @"News";
    self.groupAvatar.backgroundColor = [UIColor redColor];
    self.newsDate.text = @"7 min";
    self.newsText.text = @"news";
    [self.newsText setEditable:NO];
    [self.newsText setScrollEnabled:NO];
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_groupAvatar release];
    [_groupTitle release];
    [_newsDate release];
    [_newsText release];
    [super dealloc];
}
@end
