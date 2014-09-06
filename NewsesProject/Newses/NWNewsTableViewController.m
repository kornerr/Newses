//
//  NWNewsTableViewController.m
//  Newses
//
//  Created by Admin on 01.08.14.
//  Copyright (c) 2014 VantuZ. All rights reserved.
//

#import "NWNewsTableViewCell.h"
//#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"

@interface NWNewsTableViewController ()

@property (retain, nonatomic) NSDictionary *groupsIds;
@property (retain, nonatomic) NSArray *resGroups;
@property (retain, nonatomic) NSArray *resItems;
@property (retain, nonatomic) NSDictionary *resGroupsItem;
@property (retain, nonatomic) NSDictionary *resItemsItem;
@property (retain, nonatomic) NSData *data;
@property (retain, nonatomic) UIImage *image;
@property (retain, nonatomic) NSMutableArray *images;
@property (retain, nonatomic) NSMutableArray *titles;
@property (retain, nonatomic) NSMutableArray *dates;
@property (retain, nonatomic) NSMutableArray *texts;


@end

@implementation NWNewsTableViewController

- (void) dealloc
{
    [_resItemsItem release];
    [_resItems release];
    [_images release];
    [_titles release];
    [_groupsIds release];
    [_resGroups release];
    [_resGroupsItem release];
    [_data release];
    [_image release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    self.title = @"News";
    
    self.groupsIds = [[NSDictionary alloc] initWithObjectsAndKeys:@"post", @"filters", nil];
    self.images = [[NSMutableArray alloc] init];
    self.titles = [[NSMutableArray alloc] init];
    self.dates = [[NSMutableArray alloc] init];
    self.texts = [[NSMutableArray alloc] init];
    
    
    VKRequest *request = [VKRequest requestWithMethod:@"newsfeed.get" andParameters:self.groupsIds andHttpMethod:@"GET"];
    
    [request executeWithResultBlock:^(VKResponse *response) {
        // REVIEW Почему в одном месте скобка { на той же строке,
        // REVIEW а в другом - на новой? По какому принципу?
        
        self.resGroups = [response.json valueForKey:@"groups"];
        self.resItems = [response.json valueForKey:@"items"];
        
        for (int i=0; i<[self.resItems count]; i++) {
            self.resItemsItem = [self.resItems objectAtIndex:i];
            for (int g=0; g<[self.resGroups count]; g++) {
                self.resGroupsItem = [self.resGroups objectAtIndex:g];
                if ([[NSString stringWithFormat:@"%@", [self.resItemsItem valueForKey:@"source_id"]] isEqualToString:[NSString stringWithFormat:@"-%@", [self.resGroupsItem valueForKey:@"id"]]])
                {
                    [self.images addObject:[self.resGroupsItem valueForKey:@"photo_50"]];
                    [self.titles addObject:[self.resGroupsItem valueForKey:@"name"]];
                    [self.dates addObject:[self.resItemsItem valueForKey:@"date"]];
                    [self.texts addObject:[self.resItemsItem valueForKey:@"text"]];
                    // REVIEW Как это привести к виду, чтобы был ровно один
                    // REVIEW массив данных, не размазанный по 100500
                    // REVIEW массивам?
                }
            }
        }
        
        [self.tableView reloadData];
        
    } errorBlock:^(NSError *error) {
        NSLog(@"Error: %@", error);
    }];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.texts count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NWNewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"newsCellId"];
    
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"NWNewsTableViewCell" bundle:nil] forCellReuseIdentifier:@"newsCellId"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"newsCellId"];
    }
    
    //AVATAR
    self.data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[self.images objectAtIndex:indexPath.row]]];
    self.image = [UIImage imageWithData: self.data];
    // REVIEW Что мешает сразу хранить массив UIImage? Какой смысл
    // REVIEW каждый раз при отображении преобразовывать байты в UIImage?
    cell.groupAvatar.image = self.image;
    
    NSURL *url = [NSURL URLWithString:[self.images objectAtIndex:indexPath.row]];
    //NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //UIImage *placeholderImage = [UIImage imageNamed:@"your_placeholder"];
    
    //__weak UITableViewCell *weakCell = cell;
    UIImage *placeholderImage = [UIImage imageNamed:@"placeholder"];
    [cell.groupAvatar setImageWithURL:url placeholderImage:placeholderImage];
    
    //TITLE
    cell.groupTitle.text = [self.titles objectAtIndex:indexPath.row];

    //DATE
    double timestamp = [[self.dates objectAtIndex:indexPath.row] intValue];
    NSTimeInterval ti = timestamp;
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc]init];
    [dateformatter setLocale:[NSLocale currentLocale]];
    [dateformatter setDateFormat:@"dd LLL yyyy HH:mm"];
    NSString *dateString=[dateformatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:ti]];
    cell.newsDate.text = dateString;
    
    //TEXT
    cell.newsText.text = [self.texts objectAtIndex:indexPath.row];
    
    //CELLS PROP
    [cell.newsText setEditable:NO];
    [cell.newsText setScrollEnabled:NO];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    // REVIEW Где ещё можно задать результат этих трёх вызовов?
    [cell sizeToFit];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    CGSize maximumSize = CGSizeMake(280, 9999);
    // REVIEW Необходимо убрать константы и брать ширину из XIB.
    UIFont *myResTextFont = [UIFont fontWithName:@"Helvetica Neue" size:14];
    // REVIEW Где лучше и легче это задать?
    CGSize myStringSize = [[self.texts objectAtIndex:indexPath.row] sizeWithFont:myResTextFont constrainedToSize:maximumSize];

    return 120.0f + myStringSize.height;
    // REVIEW Что за 120?
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
