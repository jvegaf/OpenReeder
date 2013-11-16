//
//  TTRSSModel.m
//  JSONTest
//
//  Created by JOSE VEGA on 14/09/13.
//  Copyright (c) 2013 JOSE VEGA. All rights reserved.
//

#import "TTRSSModel.h"
#import "TTRSSCategoryModel.h"
#import "TTRSSFeedModel.h"
#import "TTRSSHeadlinesModel.h"
#import "TTRSSArticleModel.h"

@implementation TTRSSModel


-(id) init
{
    if ((self = [super init])){
        
        self.defaults = [NSUserDefaults standardUserDefaults];

        //url = [NSURL URLWithString:@"http://tosukapetaka.dyndns.info/tt-rss/api/"];
        self.url = [NSURL URLWithString:[self.defaults objectForKey:@"URL"]];
        
    }
    return self;
}

#pragma mark - connections

-(void)startConnection
{
    // prepare the dictionary
    self.keys = @[@"op",@"user",@"password"];
    self.objects = @[@"login",[self.defaults objectForKey:@"USERNAME"],[self.defaults objectForKey:@"PASSWORD"]];
    // create the d¡ctionary
    self.questionDict = [NSDictionary dictionaryWithObjects:self.objects forKeys:self.keys];
    // transform to JSON
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.questionDict
                                                       options:kNilOptions error:&error];
    // prepare the JSON request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:jsonData];
    // send request
    NSURLResponse *response = [[NSURLResponse alloc] init];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];

    // get the response
    if (data != nil) {
        NSLog(@"RESPONSE: %@",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        NSDictionary *JSONObjects = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        //test
//            NSLog(@"diccionario count: %lu",[JSONObjects count]);
//            for (NSString *key in JSONObjects) {
//                NSLog(@"%@",key);
//            }
        NSDictionary *content = [JSONObjects valueForKey:@"content"];
        //test
//            NSLog(@"%lu",[content count]);
//            for (NSString *key in content) {
//                NSLog(@"%@",key);
//            }
        self.session_id = [content valueForKey:@"session_id"];
        //test
        NSLog(@"session id = %@",self.session_id);
        
    }
    else {
        NSLog(@"Error: %@",error.localizedDescription);
    }
}

-(void)isLoggedInWithSessionID:(NSString *)aSID
{
    self.keys = @[@"sid",@"op"];
    self.objects = @[aSID,@"isLoggedIn"];
    self.questionDict = [NSDictionary dictionaryWithObjects:self.objects forKeys:self.keys];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.questionDict
                                                       options:kNilOptions error:&error];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:jsonData];
    NSURLResponse * response = [[NSURLResponse alloc] init];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (data != nil) {
        NSLog(@"isLoggedIn RESPONSE: %@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);;
        
    }
    else {
        NSLog(@"Error: %@",error.localizedDescription);
    }
}


-(void)stopConectionWithSessionID:(NSString *)aSID
{
    self.keys = @[@"sid",@"op"];
    self.objects = @[aSID,@"logout"];
    self.questionDict = [NSDictionary dictionaryWithObjects:self.objects forKeys:self.keys];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.questionDict
                                                       options:kNilOptions error:&error];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:jsonData];
    NSURLResponse *response = [[NSURLResponse alloc] init];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (data != nil) {
        NSLog(@"stopConnection RESPONSE: %@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);;
        
    }
    else {
        NSLog(@"Error: %@",error.localizedDescription);
    }
    
}

#pragma mark - methods

-(void)getCategoriesWithSessionID:(NSString *)aSID
{
    self.keys = @[@"sid",@"op"];
    self.objects = @[aSID,@"getCategories"];
    self.questionDict = [NSDictionary dictionaryWithObjects:self.objects forKeys:self.keys];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.questionDict
                                                       options:kNilOptions error:&error];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:jsonData];
    NSURLResponse * response = [[NSURLResponse alloc] init];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (data != nil) {
        //test
        //NSLog(@"getCategories RESPONSE: %@ \n\n\n\n\n\n",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);;
        NSDictionary *JSONObjects = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        //NSLog(@"%@",JSONObjects);
        NSArray *contents = [JSONObjects objectForKey:@"content"];
        //test
//		NSLog(@"contents count: %lu",[contents count]);
//      NSLog(@"content 1 = %@",[contents objectAtIndex:0]);
        self.categories = [[NSMutableArray alloc]init];
        for (NSDictionary *category in contents) {
            //test
            //NSLog(@"category: %@",category);
            //Create category model object
            TTRSSCategoryModel *cat = [[TTRSSCategoryModel alloc]initWithDictionary:category];
            //add object to array
            [self.categories addObject:cat];
            //test
            //NSLog(@"categoy added: %@",[cat title]);
            //NSLog(@"Cat ID: %d",cat.catID);
        }
        //Test
        NSLog(@"number of categories in Array: %d",[self.categories count]);
        
    }
    else {
        NSLog(@"Error: %@",error.localizedDescription);
    }
    
}



-(void)getFeedsWithSessionID:(NSString *)aSID catID:(NSInteger)aCatID
{
    self.keys = @[@"sid",@"op",@"cat_id"];
    self.objects = @[aSID,@"getFeeds",[NSString stringWithFormat:@"%d",aCatID]];
    self.questionDict = [NSDictionary dictionaryWithObjects:self.objects forKeys:self.keys];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.questionDict
                                                       options:kNilOptions error:&error];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:jsonData];
    NSURLResponse * response = [[NSURLResponse alloc] init];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (data != nil) {
        //test
        //NSLog(@"getFeeds RESPONSE: %@\n\n\n\n",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);;
        NSDictionary *JSONObjects = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        //test
        //NSLog(@"getFeeds Dict = %@",JSONObjects);
        self.feeds = [[NSMutableArray alloc] init];
        NSArray *contents = [JSONObjects objectForKey:@"content"];
        // test
        NSLog(@"contents items: %d",[contents count]);
        for (NSDictionary *aFeeds in contents) {
            TTRSSFeedModel *feed = [[TTRSSFeedModel alloc] initWithDictionary:aFeeds];
            [self.feeds addObject:feed];
            NSLog(@"feed added: %@ withID: %d",[feed title],[feed feedID]);
        }
        //test
        NSLog(@"\n\n\n\n number of feeds: %d \n\n\n\n",[self.feeds count]);
    }
    else {
        NSLog(@"Error: %@",error.localizedDescription);
    }
}

-(void)getHeadlinesWithSessionID:(NSString *)aSID FeedID:(NSInteger)aFeedID
{
    self.keys = @[@"sid",@"op",@"feed_id",@"limit"];
    self.objects = @[aSID,@"getHeadlines",[NSNumber numberWithInt:aFeedID],[NSNumber numberWithInt:50]];
    self.questionDict = [NSDictionary dictionaryWithObjects:self.objects forKeys:self.keys];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.questionDict
                                                       options:kNilOptions error:&error];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:jsonData];
    NSURLResponse * response = [[NSURLResponse alloc] init];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (data != nil) {
        //test
        //NSLog(@"getHeadlines RESPONSE: %@\n\n\n\n",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);;
        NSDictionary *JSONObjects = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        //test
        //NSLog(@"getHeadlines Dict = %@",JSONObjects);
        NSArray *contents = [JSONObjects objectForKey:@"content"];
        //test
        NSLog(@"content items: %d",[contents count]);
        self.headlines = [[NSMutableArray alloc]init];
        
        for (NSDictionary *aHeadline in contents) {
            TTRSSHeadlinesModel *head = [[TTRSSHeadlinesModel alloc]initWithDictionary:aHeadline];
            [self.headlines addObject:head];
            //test
            NSLog(@"headline title: %@",[head title]);
            NSLog(@"articleID: %d",[head articleID]);
        }
        //test
        NSLog(@"\n\n\n\n number of headlines: %d \n\n\n\n",[self.headlines count]);
        
        
    }
    else {
        NSLog(@"Error: %@",error.localizedDescription);
    }
}

-(void)getArticleWithSessionID:(NSString *)aSID articleID:(NSInteger)aArticleID
{
    self.keys = @[@"sid",@"op",@"article_id"];
    self.objects = @[aSID,@"getArticle",[NSNumber numberWithInt:aArticleID]];
    self.questionDict = [NSDictionary dictionaryWithObjects:self.objects forKeys:self.keys];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.questionDict
                                                       options:kNilOptions error:&error];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:jsonData];
    NSURLResponse * response = [[NSURLResponse alloc] init];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (data != nil) {
        //test
        //NSLog(@"getHeadlines RESPONSE: %@\n\n\n\n",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);;
        NSDictionary *JSONObjects = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        //test
        //NSLog(@"article Dict = %@",JSONObjects);
        NSArray *contents = [JSONObjects objectForKey:@"content"];
        //test
        NSLog(@"content items: %d",[contents count]);
        self.articleObject = [[NSMutableArray alloc]init];
        
        for (NSDictionary *aArticle in contents) {
            TTRSSArticleModel *article = [[TTRSSArticleModel alloc]initWithDictionary:aArticle];
            [self.articleObject addObject:article];
            //test
            NSLog(@"article content: %@",[article content]);
            NSLog(@"article link: %@",[article link]);
            self.articleContent = [NSString stringWithString:[article content]];
            
        }
    }
    else {
        NSLog(@"Error: %@",error.localizedDescription);
    }
}

-(void)getConfigWithSessionID:(NSString *)aSID
{
    self.keys = @[@"sid",@"op"];
    self.objects = @[aSID,@"getConfig"];
    self.questionDict = [NSDictionary dictionaryWithObjects:self.objects forKeys:self.keys];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.questionDict
                                                       options:kNilOptions error:&error];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:self.url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:jsonData];
    NSURLResponse * response = [[NSURLResponse alloc] init];
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (data != nil) {
        //test
        //NSLog(@"getHeadlines RESPONSE: %@\n\n\n\n",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);;
        NSDictionary *JSONObjects = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        //test
        //NSLog(@"getConfig Dict = %@",JSONObjects);
        NSArray *contents = [JSONObjects objectForKey:@"content"];
        //test
        NSLog(@"content items: %d",[contents count]);
              
        
    }
    else {
        NSLog(@"Error: %@",error.localizedDescription);
    }
}



@end
