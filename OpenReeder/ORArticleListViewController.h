//
//  ORArticleViewController.h
//  OpenReeder
//
//  Created by Jose on 10/12/13.
//  Copyright (c) 2013 JOSE VEGA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTRSSModel.h"
#import "TTRSSHeadlinesModel.h"
#import "ORArticleViewController.h"
#import "ORArticleCustomCell.h"

@interface ORArticleListViewController : UITableViewController

@property (nonatomic,copy) NSString *sessionID;
@property (nonatomic,strong) NSArray *articlesArray;
@property (nonatomic,strong) TTRSSModel *model;
@property (nonatomic) NSInteger selectFeedID;

-(id)initWithStyle:(UITableViewStyle)style
            feedID:(NSInteger)aFeedID
         sessionID:(NSString *)aSessionID;

@end
