//
//  ORLoginViewController.h
//  OpenReeder
//
//  Created by JOSE VEGA on 03/10/13.
//  Copyright (c) 2013 JOSE VEGA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ORLoginViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic,retain)IBOutlet UITextField *urlTextField;
@property (nonatomic,retain)IBOutlet UITextField *userNameTextField;
@property (nonatomic,retain)IBOutlet UITextField *passwordTextField;

-(IBAction)isDone:(id)sender;


@end
