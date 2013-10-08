//
//  TTRSSHeadlinesModel.h
//  JSONTest
//
//  Created by JOSE VEGA on 26/09/13.
//  Copyright (c) 2013 JOSE VEGA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTRSSHeadlinesModel : NSObject

@property (nonatomic) NSInteger feedID;
@property (nonatomic,copy) NSString *author;
@property (nonatomic) NSInteger updated;
@property (nonatomic,copy) NSString *feedTitle;
@property (nonatomic,strong) NSURL *link;
@property (nonatomic,copy) NSString *title;
@property (nonatomic) NSInteger articleID;



-(id) initWithFeedID:(NSInteger)aFeedID
              author:(NSString *)aAuthor
           feedTitle:(NSString *)aFeedtitle
                link:(NSURL *)aLink
               title:(NSString *)aTitle
             updated:(NSInteger)aUpdated
           articleID:(NSInteger)aArticleID;

-(id) initWithDictionary:(NSDictionary *)aDict;

-(id) initWithTitle:(NSString *)aTitle 
          feedTitle:(NSString *)aFeedtitle 
               link:(NSURL *)aLink;

@end
