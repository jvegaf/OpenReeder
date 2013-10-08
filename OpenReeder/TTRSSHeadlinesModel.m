//
//  TTRSSHeadlinesModel.m
//  JSONTest
//
//  Created by JOSE VEGA on 26/09/13.
//  Copyright (c) 2013 JOSE VEGA. All rights reserved.
//

#import "TTRSSHeadlinesModel.h"

@implementation TTRSSHeadlinesModel

-(id) initWithFeedID:(NSInteger)aFeedID
              author:(NSString *)aAuthor
           feedTitle:(NSString *)aFeedtitle
                link:(NSURL *)aLink
               title:(NSString *)aTitle
             updated:(NSInteger)aUpdated
           articleID:(NSInteger)aArticleID
{
    if (self = [super init]) {

        _feedID = aFeedID;
        _feedTitle = aFeedtitle;
        _author = aAuthor;
        _link = aLink;
        _title = aTitle;
        _updated = aUpdated;
        _articleID = aArticleID;
        

    }
    
    return self;
    
}

-(id) initWithTitle:(NSString *)aTitle 
          feedTitle:(NSString *)aFeedtitle 
               link:(NSURL *)aLink
{
	if (self = [super init])
	{
		_title = aTitle;
        _feedTitle = aFeedtitle;
        _link = aLink;
	}

	return self;
}

-(id) initWithDictionary:(NSDictionary *)aDict
{
    return [self initWithFeedID:[[aDict objectForKey:@"feed_id"]intValue]
            author:[aDict objectForKey:@"author"]
            feedTitle:[aDict objectForKey:@"feed_title"]
            link:[aDict objectForKey:@"link"]
            title:[aDict objectForKey:@"title"]
            updated:[[aDict objectForKey:@"updated"]intValue]
            articleID:[[aDict objectForKey:@"id"]intValue]];
}



@end
