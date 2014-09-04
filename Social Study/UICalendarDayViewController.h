//
//  UICalendarViewController.h
//  Social Study
//
//  Created by Nicholas Gordon on 9/2/14.
//  Copyright (c) 2014 Duke University. All rights reserved.
//
// https://github.com/devinross/tapkulibrary

#import <UIKit/UIKit.h>
#import <TapkuLibrary/TapkuLibrary.h>
#import "UISidebarMenuViewController.h"

@interface UICalendarDayViewController : TKCalendarDayViewController


@property (nonatomic, weak) IBOutlet UIBarButtonItem *sidebarButton;
@property (nonatomic,strong) NSArray *data;

@end
