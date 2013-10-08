//
//  TTRSSFeedModel.h
//  JSONTest
//
//  Created by JOSE VEGA on 25/09/13.
//  Copyright (c) 2013 JOSE VEGA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTRSSFeedModel : NSObject

@property (nonatomic,strong) NSURL *feedURL;
@property (nonatomic,copy) NSString *title;
@property (nonatomic) NSInteger feedID;
@property (nonatomic) NSInteger unread;
@property (nonatomic) BOOL hasIcon;
@property (nonatomic) NSInteger catID;
@property (nonatomic) NSInteger lastUpdated;
@property (nonatomic) NSInteger orderID;


-(id)initWithFeedURL:(NSURL *)aFeedURL
               title:(NSString *)aTitle
              feedID:(NSInteger)aFeedID
              unread:(NSInteger)aUnread
             hasIcon:(BOOL)aHasIcon
               catID:(NSInteger)aCatID
         lastUpdated:(NSInteger)aLastUpdated
             orderID:(NSInteger)aOrderID ;

-(id)initWithDictionary:(NSDictionary *)aDict;


@end
