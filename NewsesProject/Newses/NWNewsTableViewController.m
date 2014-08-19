//
//  NWNewsTableViewController.m
//  Newses
//
//  Created by Admin on 01.08.14.
//  Copyright (c) 2014 VantuZ. All rights reserved.
//

#import "NWNewsTableViewController.h"
#import "NWNewsTableViewCell.h"

@interface NWNewsTableViewController ()


@property (retain, nonatomic) NSArray *resText;
@property (retain, nonatomic) NSArray *resDate;
@property (retain, nonatomic) NSArray *resGroupAvatar;
@property (retain, nonatomic) NSArray *resGroupName;

@end

@implementation NWNewsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"News";
    
    self.groupsIds = [[NSDictionary alloc] initWithObjectsAndKeys:@"post", @"filters", nil];
    
    VKRequest *request = [VKRequest requestWithMethod:@"newsfeed.get" andParameters:self.groupsIds andHttpMethod:@"GET"];
    
    [request executeWithResultBlock:^(VKResponse *response) {
        self.resText = [[response.json valueForKey:@"items"] valueForKey:@"text"];
        self.resDate = [[response.json valueForKey:@"items"] valueForKey:@"date"];
        //self.groupTitle.text = [self.res objectAtIndex:0];
        //NSLog(@"count: %d", self.resText.count);
        
    } errorBlock:^(NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

- (void) dealloc
{
    [_groupAvatar release];
    [_groupTitle release];
    [_newsDate release];
    [_newsText release];
    [_resText release];
    [_groupsIds release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSLog(@"count:%d", [_resText count]);
    return [_resText count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NWNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsCellId"];
    
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"NWNewsTableViewCell" bundle:nil] forCellReuseIdentifier:@"newsCellId"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"newsCellId"];
    }
    
    //self.groupTitle.text = @"News";
    //self.groupTitle.text = groupAva;
    self.groupAvatar.backgroundColor = [UIColor redColor];
    self.newsDate.text = @"7 min";
    self.newsText.text = @"news";
    [self.newsText setEditable:NO];
    [self.newsText setScrollEnabled:NO];
    
    // Configure the cell...
    //[cell setupNewsTableCell];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell sizeToFit];
    
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    NWNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsCellId"];
//    
//    if (!cell) {
//        [tableView registerNib:[UINib nibWithNibName:@"NWNewsTableViewCell" bundle:nil] forCellReuseIdentifier:@"newsCellId"];
//        cell = [tableView dequeueReusableCellWithIdentifier:@"newsCellId"];
//    }
//    
//    UITextView *newsText = cell.newsText;
//    
//    CGRect newsTextFrame = newsText.frame;
//    newsTextFrame.size.height = newsText.contentSize.height;
//    newsText.frame = newsTextFrame;
//    
//    CGSize newsTextHeight = newsTextFrame.size;
//    //NSLog(@"1 %d", newsTextHeight.height);
//    return 120;
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

@end
