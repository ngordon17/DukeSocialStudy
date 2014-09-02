//
//  RegisterViewController.m
//  Social Study
//
//  Created by Nicholas Gordon on 9/1/14.
//  Copyright (c) 2014 Duke University. All rights reserved.
//

#import "UIRegisterViewController.h"
#import "UIRegisterViewCell.h"
#import "UIValidatedTextField.h"
#import "NSConstants.h"

@interface UIRegisterViewController ()


@end

@implementation UIRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableItems = @[@"name", @"email", @"netId", @"username", @"password", @"confirmPassword"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_tableItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = [_tableItems objectAtIndex:indexPath.row];
    UIRegisterViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    
   if ([cellIdentifier isEqualToString:@"email"]) {
        [cell.textField setRegex:VALID_DUKE_EMAIL_REGEX];
        
    } else if ([cellIdentifier isEqualToString:@"netId"]) {
        //Validation?
        
    } else if ([cellIdentifier isEqualToString:@"password"]) {
        [cell.textField setRegex:VALID_PASSWORD_REGEX];
        
    } else if ([cellIdentifier isEqualToString:@"confirmPassword"]) {
        [cell.textField setRegex:VALID_PASSWORD_REGEX];
        NSIndexPath *index = [NSIndexPath indexPathForRow:4 inSection:0];
        UIRegisterViewCell *confirm =(UIRegisterViewCell *)[self tableView:_tableView cellForRowAtIndexPath:index];
        [cell.textField setConfirm:confirm.textField];
    }
    
    cell.textField.delegate = self;
    return cell;
}


#pragma mark - Text Field Delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


#pragma mark - Create Account Button
- (IBAction) createAccount:(id)sender {
    if (![self validateInputs]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unable to Create Account"
            message:@"Please make sure all required fields are correctly filled" delegate:self
            cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    [self createAccount];
}

- (BOOL) validateInputs {
    for (int i = 0; i < _tableItems.count; i++) {
        NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:0];
        UIRegisterViewCell *cell = (UIRegisterViewCell *) [self tableView:_tableView cellForRowAtIndexPath:index];
        if (!cell.textField.isValid) {
            return false;
        }
    }
    return true;
}

- (void) createAccount {
    
}


@end
