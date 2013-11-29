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
    
    NSArray *stringsArray = @[@"<html><head><meta name=\"viewport\" content=\"width=320\"/><style type=\"text/css\">#contenedor img {max-width:320px; height:auto; margin-left:-8; margin-right:auto; margin-top:10; margin-bottom:10} #mainTitle {margin-top:30px; margin-bottom:80px;line-height:1.2;font-weight:lighter;} body{color:#5c5c5c;line-height:1.5;font-weight:lighter;font-size:110%;}a:link{color:#5c5c5c;}</style></head><body><font face=\"Helvetica Neue\"><h2><center><div id=\"mainTitle\">",aTitle,@"</div></center></h2><p></p><div id=\"contenedor\">",preContent,@"</div></font></body></html>"];
    NSString *finalContent = [stringsArray componentsJoinedByString:@""];
    //test
    NSLog(@"\n\n\nFinal content:%@\n\n\n\n",finalContent);
    
    return finalContent;
}



@end
