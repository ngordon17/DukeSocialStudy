//
//  LoginViewController.h
//  Study Groups
//
//  Created by Nicholas Gordon on 6/2/14.
//  Copyright (c) 2014 Duke Student Government. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIValidatedTextField.h"
#import "MBProgressHUD.h"

@interface LoginViewController : UIViewController <UITextFieldDelegate, MBProgressHUDDelegate, NSURLConnectionDataDelegate, NSURLConnectionDelegate> {
    
    MBProgressHUD *_HUD;
	long long _expectedLength;
	long long _currentLength;
    NSData *_loginData;
}

@property (nonatomic, weak) IBOutlet UIImageView *logo;
@property (nonatomic, weak) IBOutlet UITextField *email;
@property (nonatomic, weak) IBOutlet UITextField *password;
@property (nonatomic, weak) IBOutlet UIButton *loginButton;
@property (nonatomic, weak) IBOutlet UIButton *registerButton;
@property (nonatomic, weak) IBOutlet UIButton *forgotPassword;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;

@end
