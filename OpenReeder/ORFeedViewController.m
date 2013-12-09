//
//  ORFeedViewController.m
//  OpenReeder
//
//  Created by JOSE VEGA on 04/10/13.
//  Copyright (c) 2013 JOSE VEGA. All rights reserved.
//

#import "ORFeedViewController.h"


@interface ORFeedViewController ()

@end

@implementation ORFeedViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithStyle:(UITableViewStyle)style
        categoryID:(NSInteger)aCatID
      categoryName:(NSString *)aCatName
         sessionID:(NSString *)aSessionID
{
    if (self = [super initWithStyle:style]) {
        _sessionID = aSessionID;
        _categoryID = aCatID;
        _categoryName = aCatName;
        _myfeeds = [[NSArray alloc]init];
        
        _myModel = [[TTRSSModel alloc]init];
        [_myModel getFeedsWithSessionID:_sessionID catID:_categoryID];
        self.myfeeds = [_myModel feeds];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = self.categoryName;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return [self.myfeeds count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *uniqueIdentifier = @"ORFeedCustomCell";
    // Configure the cell...
    TTRSSFeedModel *model = [self.myfeeds objectAtIndex:indexPath.row];
    //test
    //NSLog(@"tv feedname: %@",hlModel.feedTitle);
    //NSLog(@"tv article tit: %@",hlModel.title);
    
    ORFeedCustomCell *cell = (ORFeedCustomCell *) [tableView dequeueReusableCellWithIdentifier:uniqueIdentifier];
    
    if (!cell) {
        NSArray *topLevelObjects = [[NSBundle mainBundle]loadNibNamed:@"ORFeedCustomCell" owner:nil options:nil];
        for (id currentObject in topLevelObjects) {
            if ([currentObject isKindOfClass:[ORFeedCustomCell class]]) {
                cell = (ORFeedCustomCell *)currentObject;
                break;
            }
        }
    }
    
    cell.feedNameLabel.text = model.title;
    return cell;
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
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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
    
    TTRSSFeedModel *feedModel = [_myfeeds objectAtIndex:indexPath.row];
    NSLog(@"feed title.....: %@",feedModel.title);
    NSLog(@"feed id: %d",feedModel.orderID);
    
    ORArticleListViewController *articleList = [[ORArticleListViewController alloc]initWithStyle:UITableViewStylePlain feedID:feedModel.feedID feedName:feedModel.title sessionID:_sessionID];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:articleList animated:YES];
}
 


@end
