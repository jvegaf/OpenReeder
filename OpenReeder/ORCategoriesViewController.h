//
//  ORCategoriesViewController.h
//  OpenReeder
//
//  Created by JOSE VEGA on 04/10/13.
//  Copyright (c) 2013 JOSE VEGA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTRSSModel.h"
#import "ORFeedViewController.h"
#import "TTRSSCategoryModel.h"
#import "ORLoginViewController.h"
#import "ORCategoriesCustomCell.h"

@interface ORCategoriesViewController : UITableViewController 

@property (nonatomic,copy) NSString *sessionID;
@property (nonatomic,strong) NSArray *categories;
@property (nonatomic,strong) TTRSSModel *model;


@end
