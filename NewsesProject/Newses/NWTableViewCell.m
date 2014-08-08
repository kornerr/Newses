//
//  NWTableViewCell.m
//  Newses
//
//  Created by Admin on 01.08.14.
//  Copyright (c) 2014 VantuZ. All rights reserved.
//

#import "NWTableViewCell.h"

@implementation NWTableViewCell

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
    [_mainCellLabel release];
    [super dealloc];
}
@end
