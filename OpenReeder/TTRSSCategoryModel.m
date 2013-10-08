//
//  TTRSSCategoryModel.m
//  JSONTest
//
//  Created by JOSE VEGA on 18/09/13.
//  Copyright (c) 2013 JOSE VEGA. All rights reserved.
//

#import "TTRSSCategoryModel.h"


@implementation TTRSSCategoryModel



-(id)initWithCatID:(NSInteger)aCatid
             title:(NSString *)aTitle
            unread:(NSInteger)aUnread
           orderid:(NSInteger)aOrder
{
    if (self = [super init]) {
        _catID = aCatid;
        _title = aTitle;
        _unread = aUnread;
        _orderID= aOrder;
    }
    
    return self;

}

-(id)initWithDictionary:(NSDictionary *)aDict
{
    return [self initWithCatID:[[aDict objectForKey:@"id"]intValue]
                         title:[aDict objectForKey:@"title"]
                        unread:[[aDict objectForKey:@"unread"]intValue]
                       orderid:[[aDict objectForKey:@"orderID"]intValue]];

}



@end
