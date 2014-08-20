//
//  NWTableViewController.m
//  Newses
//
//  Created by Admin on 01.08.14.
//  Copyright (c) 2014 VantuZ. All rights reserved.
//

#import "NWTableViewController.h"
#import "NWTableViewCell.h"

@implementation NWTableViewController

- (void) dealloc
{
    [_newsController release];
    [_menuLabels release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.menuLabels = [[NSArray alloc] initWithObjects:@"News", @"Groups", @"Search", nil];
    self.title = @"Menu";
    
    [VKSdk initializeWithDelegate:self andAppId:@"4493763"];
    [VKSdk authorize:@[VK_PER_WALL, VK_PER_AUDIO, VK_PER_PHOTOS, VK_PER_NOHTTPS, VK_PER_FRIENDS] revokeAccess:YES];
    [VKSdk authorize:@[VK_PER_WALL, VK_PER_AUDIO, VK_PER_PHOTOS, VK_PER_NOHTTPS, VK_PER_FRIENDS] revokeAccess:YES];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) viewDidUnload
{
    self.menuLabels = nil;
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
    return [self.menuLabels count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCellId"];
    
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"NWTableViewCell" bundle:nil] forCellReuseIdentifier:@"mainCellId"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"mainCellId"];
    }
    
    cell.mainCellLabel.text = [self.menuLabels objectAtIndex:[indexPath row]];
    
    return cell;
}

- (void)vkSdkNeedCaptchaEnter:(VKError *)captchaError
{
    NSLog(@"eas here6");
}

- (void)vkSdkTokenHasExpired:(VKAccessToken *)expiredToken
{
    NSLog(@"eas here4");
}

- (void)vkSdkUserDeniedAccess:(VKError *)authorizationError
{
    NSLog(@"auth error");
}

- (void)vkSdkReceivedNewToken:(VKAccessToken *)newToken
{
}

- (void)vkSdkShouldPresentViewController:(UIViewController *)controller
{
    //	[self presentViewController:controller animated:YES completion:nil];
}


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


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
   // <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:self.newsController animated:YES];
}


@end
