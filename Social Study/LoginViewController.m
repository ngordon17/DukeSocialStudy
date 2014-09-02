//
//  LoginViewController.m
//  Study Groups
//
//  Created by Nicholas Gordon on 6/2/14.
//  Copyright (c) 2014 Duke Student Government. All rights reserved.
//

#import "LoginViewController.h"
#import "NSConnectionFactory.h"
#import "NSConstants.h"
#import "NSArgumentValidator.h"
#import "SBJsonParser.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

#pragma mark - Initialization

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTextFields];
    [self initButtons];
}

- (void) initTextFields {
    _email.delegate = self;
    _password.delegate = self;
}

- (void) initButtons {
    _loginButton.layer.borderColor = [[UIColor whiteColor] CGColor];
    _registerButton.layer.borderColor = [[UIColor whiteColor] CGColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Forgot Password

- (IBAction)forgotPassword:(id)sender {
    
}

#pragma mark - Alert View

-(void) alertStatus:(NSString *)msg :(NSString *)title {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alertView show];
}

#pragma mark - Login

- (IBAction) login:(id) sender {
    if (![NSArgumentValidator isValidDukeEmail:_email.text]) {
        [self alertStatus:@"Please enter a valid Duke email" : @"Invalid Email"];
        return;
        
    } else if (_password.text.length == 0) {
        [self alertStatus:@"Please enter a valid password" : @"Invalid Password"];
        return;
    }
    
    NSMutableURLRequest *request = [NSConnectionFactory createLoginValidationRequest:_email.text password:_password.text delegate:self];
    
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:false];
    [conn scheduleInRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    [conn start];
    [self showHUD:@"Logging in..."];
}

- (void) validateLogin {
    NSString *responseData = [[NSString alloc] initWithData:_loginData encoding:NSUTF8StringEncoding];
    SBJsonParser *jsonParser = [SBJsonParser new];
    NSDictionary *jsonData = (NSDictionary *) [jsonParser objectWithString:responseData error:nil];
    NSInteger success = [(NSNumber *) [jsonData objectForKey:@"success"] integerValue];
    
    if (success != 1) {
        [self alertStatus:[jsonData objectForKey:@"error_message"] :@"Login Failed!"];
        return;
    }
    
    [self alertStatus: @"Logged in successfully" : @"Login success"];
    [self performLoginSegue];
}

- (void) performLoginSegue {
    [self performSegueWithIdentifier:@"login" sender:self];
}


#pragma mark - NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	_expectedLength = MAX([response expectedContentLength], 1);
	_currentLength = 0;
	_HUD.mode = MBProgressHUDModeDeterminate;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	_currentLength += [data length];
	_HUD.progress = _currentLength / (float)_expectedLength;
    _loginData = data;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	_HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
	_HUD.mode = MBProgressHUDModeCustomView;
	[_HUD hide:YES afterDelay:0.5];
    [self validateLogin];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	[_HUD hide:YES];
    [self alertStatus: @"Please check your internet connection or try again later" : @"Connection Error"];
}

#pragma mark - MBProgressHUDDelegate

- (void)showHUD:(NSString *)label {
    _HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
	_HUD.delegate = self;
	_HUD.labelText = label;
    _HUD.dimBackground = YES;
}

- (void)hudWasHidden:(MBProgressHUD *)hud {
	// Remove HUD from screen when the HUD was hidden
	[_HUD removeFromSuperview];
	_HUD = nil;
}

@end
