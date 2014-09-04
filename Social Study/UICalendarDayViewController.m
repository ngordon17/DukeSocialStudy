//
//  UICalendarViewController.m
//  Social Study
//
//  Created by Nicholas Gordon on 9/2/14.
//  Copyright (c) 2014 Duke University. All rights reserved.
//

#import "UICalendarDayViewController.h"

@interface UICalendarDayViewController ()

@end

@implementation UICalendarDayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Change button color
    //_sidebarButton.tintColor = [UIColor colorWithWhite:0.96f alpha:0.2f];
    
    // Set the side bar button action.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.data = @[
                  @[@"Appointment #1", @"Appointment #1", @5, @0, @5, @30],
                  @[@"Appointment #2", @"Appointment #2", @7, @0, @12, @0],
                  @[@"Appointment #3", @"Appointment #3", @15, @0, @18, @0],
                  @[@"Appointment #4", @"Appointment #4", @15, @0, @18, @0],
                  @[@"Appointment #5", @"Appointment #5", @5, @30, @6, @0]];
	
}

- (NSUInteger) supportedInterfaceOrientations{
	return  UIInterfaceOrientationMaskPortrait;
}
- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

- (void) viewWillAppear:(BOOL)animated{
	[super viewWillAppear:animated];
	
	//self.navigationController.navigationBar.hairlineDividerView.hidden = YES;
	//self.dayView.daysBackgroundView.backgroundColor = [UIColor colorWithHex:0xf8f8f8];
}
- (void) viewWillDisappear:(BOOL)animated 
	[super viewWillDisappear:animated];
}

#pragma mark TKCalendarDayViewDelegate
- (NSArray *) calendarDayTimelineView:(TKCalendarDayView*)calendarDayTimeline eventsForDate:(NSDate *)eventDate{
	
	if([eventDate compare:[NSDate dateWithTimeIntervalSinceNow:-24*60*60]] == NSOrderedAscending) return @[];
	if([eventDate compare:[NSDate dateWithTimeIntervalSinceNow:24*60*60]] == NSOrderedDescending) return @[];
    
	NSDateComponents *info = [[NSDate date] dateComponentsWithTimeZone:calendarDayTimeline.calendar.timeZone];
	info.second = 0;
	NSMutableArray *ret = [NSMutableArray array];
	
	for(NSArray *ar in self.data){
		
		TKCalendarDayEventView *event = [calendarDayTimeline dequeueReusableEventView];
		if(event == nil) event = [TKCalendarDayEventView eventView];
        
		event.identifier = nil;
		event.titleLabel.text = ar[0];
		event.locationLabel.text = ar[1];
		
		info.hour = [ar[2] intValue];
		info.minute = [ar[3] intValue];
		event.startDate = [NSDate dateWithDateComponents:info];
		
		info.hour = [ar[4] intValue];
		info.minute = [ar[5] intValue];
		event.endDate = [NSDate dateWithDateComponents:info];
        
		[ret addObject:event];
		
	}
	return ret;
	
    
}

- (void) calendarDayTimelineView:(TKCalendarDayView*)calendarDayTimeline eventViewWasSelected:(TKCalendarDayEventView *)eventView{
	TKLog(@"%@",eventView.titleLabel.text);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

