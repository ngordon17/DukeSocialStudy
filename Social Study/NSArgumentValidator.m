//
//  NSArgumentValidator.m
//  Social Study
//
//  Created by Nicholas Gordon on 9/1/14.
//  Copyright (c) 2014 Duke University. All rights reserved.
//

#import "NSArgumentValidator.h"
#import "NSConstants.h"

@implementation NSArgumentValidator

+(BOOL) isValidEmail:(NSString *) email {
    return [self isValid: email withRegex:VALID_EMAIL_REGEX];
}

+(BOOL) isValidDukeEmail:(NSString *) email {
    return [self isValid: email withRegex:VALID_DUKE_EMAIL_REGEX];
}

+(BOOL) isValidPassword:(NSString *) password {
    return [self isValid: password withRegex:VALID_PASSWORD_REGEX];
}

+(BOOL) isValid:(NSString *)text withRegex:(NSString *)regex {
    if (text.length == 0) {
        return false;
    }
    NSError *error = NULL;
    NSRegularExpression *matcher = [[NSRegularExpression alloc] initWithPattern:regex options:nil error:&error];
    NSUInteger matches = [matcher numberOfMatchesInString:text options:nil range:NSMakeRange(0, text.length)];
    
    if (matches > 0) {
        return true;
    }
    return false;
}
@end
