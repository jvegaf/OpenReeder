//
//  TTRSSArticleModel.m
//  JSONTest
//
//  Created by JOSE VEGA on 29/09/13.
//  Copyright (c) 2013 JOSE VEGA. All rights reserved.
//

#import "TTRSSArticleModel.h"

@implementation TTRSSArticleModel

-(id) initWithAuthor:(NSString *)aAuthor
            comments:(NSString *)aComments
             content:(NSString *)aContent
              feedID:(NSInteger)aFeedID
           feedTitle:(NSString *)aFeedTitle
           articleID:(NSInteger)aArticleID
                link:(NSString *)aLink
               title:(NSString *)aTitle
{
    if (self = [super init]) {
        _author = aAuthor;
        _comments = aComments;
        _content = aContent;
        _feedID = aFeedID;
        _feedTitle = aFeedTitle;
        _articleID = aArticleID;
        _link = aLink;
        _title = aTitle;
    }
    
    return self;
}

-(id) initWithDictionary:(NSDictionary *)aDict
{
    return [self initWithAuthor:[aDict objectForKey:@"author"]
                       comments:[aDict objectForKey:@"comments"]
                        content:[self formatedContent:[aDict objectForKey:@"content"] withTitle:[aDict objectForKey:@"title"]]
                         feedID:[[aDict objectForKey:@"feed_id"]intValue]
                      feedTitle:[aDict objectForKey:@"feed_title"]
                      articleID:[[aDict objectForKey:@"id"]intValue]
                           link:[aDict objectForKey:@"link"]
                          title:[aDict objectForKey:@"title"]];
}

-(NSString *)formatedContent:(NSString *)preContent withTitle:(NSString *)aTitle
{
    NSArray *stringsArray = @[@"<html><head><meta name=\"viewport\" content=\"width=320\"/><style type=\"text/css\">#contenedor img {max-width:320px; margin-left:-8; margin-right:auto; margin-top:10; margin-bottom:10}</style></head><body><font face=\"Helvetica Neue\"><div id=\"contenedor\"><p><h2><center>",aTitle,@"</center></h2></p>",preContent,@"</div></font></body></html>"];
    NSString *finalContent = [stringsArray componentsJoinedByString:@""];
    //test
    NSLog(@"Final content:%@",finalContent);
    return finalContent;
}



@end
