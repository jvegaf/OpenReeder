//
//  ORArticleViewController.h
//  OpenReeder
//
//  Created by Jose on 10/12/13.
//  Copyright (c) 2013 JOSE VEGA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTRSSArticleModel.h"
#import "TTRSSModel.h"

@interface ORArticleViewController : UIViewController <UIWebViewDelegate>

@property (nonatomic,copy)NSString *sessionID;
@property (nonatomic)NSInteger articleID;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,strong) IBOutlet UIWebView *webView;

-(id)initWithSessionID:(NSString *)aSID articleID:(NSInteger)aArticleID;
@end
