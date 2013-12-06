//
//  TTRSSModel.h
//  JSONTest
//
//  Created by JOSE VEGA on 14/09/13.
//  Copyright (c) 2013 JOSE VEGA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTRSSModel : NSObject

@property (nonatomic,strong) NSArray *keys;
@property (nonatomic,strong) NSArray *objects;
@property (nonatomic,copy) NSString *session_id;
@property (nonatomic,strong) NSURL *url;

@property (nonatomic,strong) NSMutableArray *categories;
@property (nonatomic,strong) NSMutableArray *feeds;
@property (nonatomic,strong) NSMutableArray *headlines;
@property (nonatomic,strong) NSMutableArray *articleObject;
@property (nonatomic,copy) NSString *articleContent;
@property (nonatomic,weak) NSUserDefaults *defaults;




-(void)startConnection;
-(void)isLoggedInWithSessionID:(NSString *)aSID;
-(void)stopConectionWithSessionID:(NSString *)aSID;
-(void)getCategoriesWithSessionID:(NSString *)aSID;
-(void)getFeedsWithSessionID:(NSString *)aSID catID:(NSInteger)aCatID;
-(void)getHeadlinesWithSessionID:(NSString *)aSID FeedID:(NSInteger)aFeedID;
-(void)getArticleWithSessionID:(NSString *)aSID articleID:(NSInteger)aArticleID;
-(void)getConfigWithSessionID:(NSString *)aSID;

@end
