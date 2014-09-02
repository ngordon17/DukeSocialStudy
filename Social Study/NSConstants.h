//
//  NSConstants.h
//  Social Study
//
//  Created by Nicholas Gordon on 9/1/14.
//  Copyright (c) 2014 Duke University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSConstants : NSObject
#define VALID_EMAIL_REGEX @"^[_a-z0-9-]+(\\.[_a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*(\\.[a-z]{2,4})$"
#define VALID_DUKE_EMAIL_REGEX @"^[_a-z0-9-]+(\\.[_a-z0-9-]+)*@duke.edu$"

// (			 # start of group
// (?=.*\d)		 # contain one digit from 0-9
// (?=.*[a-z])   # contain one lowercase characters
// (?=.*[A-Z])	 # contain one uppercase characters
// (?=.*[@#$%])	 # contain one special symbols in the list "@#$%"
// .		     # match anything with previous condition checking
// {6,20}	     # length at least 6 characters and maximum of 20
// )		     # end of group
#define VALID_PASSWORD_REGEX @"((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%]).{6,20})"


/*
#define DATABASE_URL_ROOT @"http://colab-sbx-68.oit.duke.edu";
#define LOGIN_VALIDATION_URL_EXTENSION  @"php/validate_login.php";
#define DUKE_OIT_URL_ROOT @"https://streamer.oit.duke.edu";
#define DUKE_OIT_ACCESS_TOKEN @"a90cec76bce0a30d4a53aca6ca780448";
#define DUKE_OIT_GET_SUBJECT_URL_EXTENSION @"curriculum/list_of_values/fieldname/SUBJECT?access_token=%@";
#define DUKE_OIT_GET_COURSE_LIST_URL_EXTENSION @"curriculum/courses/subject/%@?access_token=%@";
*/

@end
