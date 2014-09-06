//
//  NWTableViewController.h
//  Newses
//
//  Created by Admin on 01.08.14.
//  Copyright (c) 2014 VantuZ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NWNewsTableViewController.h"
#import "VKSdk.h"

@interface NWTableViewController : UITableViewController <VKSdkDelegate>

@property (nonatomic, retain) NSArray *menuLabels;
// REVIEW Что делает приватный массив в публичном интерфейсе?
// REVIEW Как сделать это свойство приватным?
@property (nonatomic, retain) NWNewsTableViewController *newsController;
// REVIEW Важна ли последовательность nonatomic и retain?
// REVIEW Почему в AppDelegate была последовательность (strong, nonatomic)?
//@property (nonatomic, retain) NWNewsTableViewController *newsController;
// REVIEW Что это? Зачем оно тут?

@end
