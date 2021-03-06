//
//  ORArticleViewController.m
//  OpenReeder
//
//  Created by Jose on 10/12/13.
//  Copyright (c) 2013 JOSE VEGA. All rights reserved.
//

#import "ORArticleListViewController.h"

@interface ORArticleListViewController ()

@end

@implementation ORArticleListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

-(id)initWithStyle:(UITableViewStyle)style
            feedID:(NSInteger)aFeedID
          feedName:(NSString *)aFeedName
         sessionID:(NSString *)aSessionID
{
    if (self = [super initWithStyle:style]) {
        _sessionID = aSessionID;
        _selectFeedID = aFeedID;
        _feedName = aFeedName;
        _articlesArray = [[NSArray alloc]init];
        
        _model = [[TTRSSModel alloc]init];
        [_model getHeadlinesWithSessionID:_sessionID FeedID:_selectFeedID];
        _articlesArray = _model.headlines;
        
    }
    
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //UINib *nib = [UINib nibWithNibName:@"ORArticleCustomCell" bundle:nil];
    
    //[[self tableView]registerNib:nib forCellReuseIdentifier:@"ORArticleCustomCell"];
    
    
    
    self.navigationItem.title = self.feedName;
    
    //NSLog(@"feed id: %d",_selectFeedID);

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
    return _articlesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *uniqueIdentifier = @"ORArticleCustomCell";
    // Configure the cell...
    TTRSSHeadlinesModel *hlModel = [_articlesArray objectAtIndex:indexPath.row];
    //test
    //NSLog(@"tv feedname: %@",hlModel.feedTitle);
    //NSLog(@"tv article tit: %@",hlModel.title);
    
    ORArticleCustomCell *cell = (ORArticleCustomCell *) [tableView dequeueReusableCellWithIdentifier:uniqueIdentifier];
    
    if (!cell) {
        NSArray *topLevelObjects = [[NSBundle mainBundle]loadNibNamed:@"ORArticleCustomCell" owner:nil options:nil];
        for (id currentObject in topLevelObjects) {
            if ([currentObject isKindOfClass:[ORArticleCustomCell class]]) {
                cell = (ORArticleCustomCell *)currentObject;
                break;
            }
        }
    }
    
    cell.feedNameLabel.text = hlModel.feedTitle;
    cell.titleLabel.text = hlModel.title;

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
    
    TTRSSArticleModel *article = [self.articlesArray objectAtIndex:indexPath.row];
    
    ORArticleViewController *articleVC = [[ORArticleViewController alloc]initWithSessionID:self.sessionID articleID:article.articleID];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:articleVC animated:YES];
}
 


@end
