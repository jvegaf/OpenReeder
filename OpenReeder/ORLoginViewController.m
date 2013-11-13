//
//  ORLoginViewController.m
//  OpenReeder
//
//  Created by JOSE VEGA on 03/10/13.
//  Copyright (c) 2013 JOSE VEGA. All rights reserved.
//

#import "ORLoginViewController.h"

@interface ORLoginViewController ()

@end

@implementation ORLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"getting URL = %@",[defaults objectForKey:@"URL"]);
    self.urlTextField.text = [defaults objectForKey:@"URL"];
    self.userNameTextField.text = [defaults objectForKey:@"USERNAME"];
    self.passwordTextField.text = [defaults objectForKey:@"PASSWORD"];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
//{
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    if ([textField isEqual:@"urlTextField"]) {
//        [defaults setObject:self.urlTextField.text forKey:@"URL"];
//        NSLog(@"URL WRITING");
//    }else if ([textField isEqual:@"userNameTextField"]){
//        [defaults setObject:self.userNameTextField.text forKey:@"USER"];
//    }else if ([textField isEqual:@"passwordTextField"]){
//        [defaults setObject:self.passwordTextField.text forKey:@"PASSWORD"];
//    }
//    
//    [defaults synchronize];
//    NSLog(@"URL = %@",[defaults objectForKey:@"URL"]);
//    
//    return YES;
//}

-(IBAction)isDone:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[self formatURLwithString:self.urlTextField.text] forKey:@"URL"];
    [defaults setObject:self.userNameTextField.text forKey:@"USERNAME"];
    [defaults setObject:self.passwordTextField.text forKey:@"PASSWORD"];
    [defaults synchronize];
    
    [self formatURLwithString:[defaults objectForKey:@"URL"]];
    [[super navigationController] popToRootViewControllerAnimated:YES];
}

-(NSString *)formatURLwithString:(NSString *)aURL
{
    NSString *aProtocol = @"http://";
    NSString *secondURL;
    NSString *finalURL;
    
    NSRange range = [aURL rangeOfString:aProtocol];
    if (range.length == 0) {
        NSLog(@"dont have a HTTP");
        secondURL = [NSString stringWithFormat:@"http://%@",aURL];
        NSLog(@"second URL: %@",secondURL);
    }else{
        NSLog(@"Range = %d",range.length);
    }
    
    NSString *apiString = @"/api/";
    NSRange secondRange = [secondURL rangeOfString:apiString];
    if (secondRange.length == 0) {
        NSLog(@"dont have APi termination");
        finalURL = [NSString stringWithFormat:@"%@/api/",secondURL];
    }
    
    return finalURL;
}


@end
