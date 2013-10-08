//
//  TTRSSCategoryModel.h
//  JSONTest
//
//  Created by JOSE VEGA on 18/09/13.
//  Copyright (c) 2013 JOSE VEGA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTRSSCategoryModel : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic) NSInteger catID;
@property (nonatomic) NSInteger unread;
@property (nonatomic) NSInteger orderID;


-(id)initWithCatID:(NSInteger)aCatid
             title:(NSString *)aTitle
            unread:(NSInteger)aUnread
           orderid:(NSInteger)aOrder;


-(id)initWithDictionary:(NSDictionary *)aDict;


@end
