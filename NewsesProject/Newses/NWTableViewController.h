//
//  NWTableViewController.h
//  Newses
//
//  Created by Admin on 01.08.14.
//  Copyright (c) 2014 VantuZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NWNewsTableViewController.h"

@interface NWTableViewController : UITableViewController
{
    NSArray *menuLabels;
}

@property (nonatomic, retain) NSArray *menuLabels;
@property (nonatomic, retain) NWNewsTableViewController *newsController;

@end
