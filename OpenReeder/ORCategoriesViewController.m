//
//  ORCategoriesViewController.m
//  OpenReeder
//
//  Created by JOSE VEGA on 04/10/13.
//  Copyright (c) 2013 JOSE VEGA. All rights reserved.
//

#import "ORCategoriesViewController.h"


@interface ORCategoriesViewController ()

@end

@implementation ORCategoriesViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        _model = [[TTRSSModel alloc]init];
        [_model startConnection];
        _sessionID = _model.session_id;
        NSLog(@"session ID: %@",self.sessionID);
        [_model getCategoriesWithSessionID: self.sessionID];
        _categories = [NSArray arrayWithArray:_model.categories];
        for (TTRSSCategoryModel *cat in self.categories) {
            NSLog(@"new catID: %d",cat.catID);
        }
        
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Categories";
    

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
    return [_categories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    
    cell.textLabel.text = [[_categories objectAtIndex:indexPath.row]title];
    
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
    //test
    NSLog(@"row selected: %d",indexPath.row);
    
    TTRSSCategoryModel *model = [_categories objectAtIndex:indexPath.row];
    //test
    NSLog(@"category selected: %@",model.title);
    NSLog(@"cat ID selected: %d",model.catID);
    // Create the next view controller.
    ORFeedViewController *feedsVC = [[ORFeedViewController alloc]initWithStyle:UITableViewStylePlain
                                                                    categoryID:model.catID
                                                                  categoryName:model.title
                                                                     sessionID:self.sessionID];
    // Push the view controller.
    [self.navigationController pushViewController:feedsVC animated:YES];
    
    
    
}








@end
