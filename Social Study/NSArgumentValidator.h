//
//  NSArgumentValidator.h
//  Social Study
//
//  Created by Nicholas Gordon on 9/1/14.
//  Copyright (c) 2014 Duke University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArgumentValidator : NSObject

+(BOOL) isValidEmail:(NSString *)email;

+(BOOL) isValidDukeEmail:(NSString *)email;

+(BOOL) isValidPassword:(NSString *)password;

+(BOOL) isValid:(NSString *)text withRegex:(NSString *)regex;

@end
