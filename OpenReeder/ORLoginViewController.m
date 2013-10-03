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

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([textField isEqual:@"2i8-6R-peW"]) {
        [defaults setObject:textField.text forKey:@"URL"];
    }else if ([textField isEqual:@"userNameTextField"]){
        [defaults setObject:textField.text forKey:@"USER"];
    }else if ([textField isEqual:@"passwordTextField"]){
        [defaults setObject:textField.text forKey:@"PASSWORD"];
    }
    
    NSLog(@"URL = %@",[defaults objectForKey:@"URL"]);
    
    return YES;
}





@end
