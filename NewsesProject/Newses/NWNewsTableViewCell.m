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
//    self.groupsIds = [[NSDictionary alloc] initWithObjectsAndKeys:@"post", @"filters", nil];
//    //VKRequest *groupAva = [[VKApi groups] getById:];
//    
//    VKRequest *request = [VKRequest requestWithMethod:@"newsfeed.get" andParameters:self.groupsIds andHttpMethod:@"GET"];
//
//    [request executeWithResultBlock:^(VKResponse *response) {
//        //self.groupsId = [[NSDictionary alloc] initWithObjectsAndKeys:response, @"groups_id", @"name", @"fields", nil];
//        //[[VKApi groups] getById:response];
//        //self.nameGr = response.json[@"groups"];
//            //NSLog(@"Result: %@", [self.nameGr objectForKey:@"name"]);
//        self.res = [[response.json valueForKey:@"groups"] valueForKey:@"name"];
//        //NSLog(@"Result: %@", self.res);
//        
//        self.groupTitle.text = [self.res objectAtIndex:0];
//        
//    } errorBlock:^(NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
//    //NSLog(groupAva);
//    
//    //self.groupTitle.text = @"News";
//    //self.groupTitle.text = groupAva;
//    self.groupAvatar.backgroundColor = [UIColor redColor];
//    self.newsDate.text = @"7 min";
//    self.newsText.text = @"news";
//    [self.newsText setEditable:NO];
//    [self.newsText setScrollEnabled:NO];
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
    //[_apiRequest release];
    [_groupAvatar release];
    [_groupTitle release];
    [_newsDate release];
    [_newsText release];
    [super dealloc];
}
@end
