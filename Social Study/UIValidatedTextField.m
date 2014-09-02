//
//  UIValidatedTextField.m
//  Social Study
//
//  Created by Nicholas Gordon on 9/1/14.
//  Copyright (c) 2014 Duke University. All rights reserved.
//

#import "UIValidatedTextField.h"
#import "NSArgumentValidator.h"
#import "NSConstants.h"

@implementation UIValidatedTextField

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initialize {
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:)
                name:UITextFieldTextDidChangeNotification object:self];
        [self validate]; //Validate in case editing began before observer was set.
    }
    return self;
}

- (void) setOptional:(BOOL)isOptional {
    _isOptional = isOptional;
}

- (BOOL) isOptional {
    return _isOptional;
}

- (void) setRegex:(NSString *)regex {
    _regex = regex;
}

- (void) setConfirm:(UITextField *)confirm {
    _confirm = confirm;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:)
            name:UITextFieldTextDidChangeNotification object:_confirm];
    [self validate]; //Validate in case editing on confirm began before observer was set.
}

- (void) setQuery:(NSString *)query {
    _query = query;
}

- (void) textFieldDidChange:(NSNotification *)notification {
    [self validate];
    [self showInputValidation];
}

- (BOOL) validateRegex {
    if (_regex.length == 0) {
        return true;
    }
    return [NSArgumentValidator isValid:self.text withRegex:_regex];
}

- (BOOL) validateConfirm {
    if (_confirm == NULL) {
        return true;
    }
    return [self.text isEqualToString:_confirm.text];
}

- (BOOL) validateQuery {
    //TODO: implement me
    return true;
}

- (BOOL) validate {
    _isValid = (self.text == 0 && _isOptional) || ((self.text != 0) && [self validateRegex] && [self validateConfirm] && [self validateQuery]);
    return _isValid;
}

- (BOOL) isValid {
    return _isValid;
}

- (void) showInputValidation {
    self.layer.borderWidth = 2.0;
    self.layer.cornerRadius = 5.0;
    
    if (self.text.length == 0) {
        self.layer.borderColor = [[UIColor blackColor] CGColor];
    } else if (_isValid) {
        self.layer.borderColor = [[UIColor greenColor] CGColor];
    } else {
        self.layer.borderColor = [[UIColor redColor] CGColor];
    }
}

- (void) finalize {
    [super finalize];
    [[NSNotificationCenter defaultCenter] removeObserver:self
            name:UITextFieldTextDidChangeNotification object:self];
    
    if (_confirm != NULL) {
        [[NSNotificationCenter defaultCenter] removeObserver:self
                name:UITextFieldTextDidChangeNotification object:_confirm];
    }
}

@end
