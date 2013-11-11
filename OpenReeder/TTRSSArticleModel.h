//
//  TTRSSArticleModel.h
//  JSONTest
//
//  Created by JOSE VEGA on 29/09/13.
//  Copyright (c) 2013 JOSE VEGA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTRSSArticleModel : NSObject

@property (nonatomic,copy) NSString *author;
@property (nonatomic,copy) NSString *comments;
@property (nonatomic,copy) NSString *content;
@property (nonatomic) NSInteger feedID;
@property (nonatomic,copy) NSString *feedTitle;
@property (nonatomic) NSInteger articleID;
@property (nonatomic,copy) NSString *link;
@property (nonatomic,copy) NSString *title;

-(id) initWithAuthor:(NSString *)aAuthor
            comments:(NSString *)aComments
             content:(NSString *)aContent
              feedID:(NSInteger)aFeedID
           feedTitle:(NSString *)aFeedTitle
           articleID:(NSInteger)aArticleID
                link:(NSString *)aLink
               title:(NSString *)aTitle;

-(id) initWithDictionary:(NSDictionary *)aDict;
-(NSString *)formatedContent:(NSString *)preContent withTitle:(NSString *)aTitle;

@end
