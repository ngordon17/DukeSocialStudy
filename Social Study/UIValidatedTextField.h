//
//  UIValidatedTextField.h
//  Social Study
//
//  Created by Nicholas Gordon on 9/1/14.
//  Copyright (c) 2014 Duke University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIValidatedTextField : UITextField <UITextFieldDelegate> {
    BOOL _isOptional;
    BOOL _isValid;
    
    NSString *_regex;
    NSString *_query;
    
    UITextField *_confirm;
}

- (void) setOptional:(BOOL)isOptional;
- (void) setRegex:(NSString *)regex;
- (void) setQuery:(NSString *)query;
- (void) setConfirm:(UITextField *)confirm;
- (BOOL) isValid;
- (BOOL) validate;

@end
