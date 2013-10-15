//
//  ORArticleViewController.m
//  OpenReeder
//
//  Created by Jose on 10/12/13.
//  Copyright (c) 2013 JOSE VEGA. All rights reserved.
//

#import "ORArticleViewController.h"

@interface ORArticleViewController ()

@end

@implementation ORArticleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithSessionID:(NSString *)aSID articleID:(NSInteger)aArticleID
{
    if (self = [super init]) {
        _sessionID = aSID;
        _articleID = aArticleID;
        TTRSSModel *model = [[TTRSSModel alloc]init];
        [model getArticleWithSessionID:self.sessionID articleID:self.articleID];
        self.content = [NSString stringWithString:[model articleContent]];
        //test
        //NSLog(@"content = %@",self.content);
        
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.webView setDelegate:self];
    [self.webView loadHTMLString:self.content baseURL:nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{

}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
   
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:[error localizedDescription]
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"OK", nil];
    [alert show];
}

@end
