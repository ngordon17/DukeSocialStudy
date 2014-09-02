//
//  NSDataCore.h
//  Social Study
//
//  Created by Nicholas Gordon on 9/1/14.
//  Copyright (c) 2014 Duke University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSConnectionFactory : NSObject

+(NSURL *) makeURL:(NSString *) root extension:(NSString *) extension;

+(NSMutableURLRequest *) createHttpPostRequest:(NSURL *) url  post:(NSString *)post;
    
+(NSMutableURLRequest *) createLoginValidationRequest:(NSString *) email password:(NSString *) password
delegate:(id)delegate;

+(NSURLConnection *) createGetSubjectListConnection:(id)delegate;

+(NSURLConnection *) createGetCourseListConnection: (NSString *) subjectID delegate:(id)delegate;

@end
