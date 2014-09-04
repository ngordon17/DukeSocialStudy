//
//  MenuTableViewController.m
//  Social Study
//
//  Created by Nicholas Gordon on 8/30/14.
//  Copyright (c) 2014 Duke University. All rights reserved.
//

#import "UIMenuViewController.h"
#import "UISidebarMenuViewController.h"
#import "UICalendarDayViewController.h"
#import "UIHomeViewController.h"

@interface UIMenuViewController ()

#define BACKGROUND_COLOR [UIColor colorWithWhite:0.025f alpha:1.0f]
#define CELL_COLOR [UIColor colorWithWhite:0.10f alpha:1.0f]
#define SEPARATOR_COLOR [UIColor colorWithWhite:0.40f alpha:0.8f]

@end

@implementation UIMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BACKGROUND_COLOR;
    self.tableView.backgroundColor = BACKGROUND_COLOR;
    self.tableView.separatorColor = SEPARATOR_COLOR;
    
    _menuItems = @[@"header", @"profile", @"home", @"calendar", @"courses", @"messages", @"faq", @"settings", @"bug-report", @"logout"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_menuItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = [_menuItems objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (indexPath.item != 0) {
        cell.backgroundColor = CELL_COLOR;
    } else {
        cell.backgroundColor = BACKGROUND_COLOR;
    }
    return cell;
}

- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender {
    
    // Set the photo if it navigates to the PhotoView
    if ([segue.identifier isEqualToString:@"calendar"]) {
        //UICalendarDayViewController *controller = (UICalendarDayViewController *)segue.destinationViewController;
    
    }
    /*
    if ( [segue isKindOfClass: [UISidebarMenuViewControllerSegueSetController class]] ) {
        UISidebarMenuViewControllerSegueSetController *setSegue =(UISidebarMenuViewControllerSegueSetController *) segue;
        
        setSegue.performBlock = ^(UISidebarMenuViewControllerSegueSetController* rvc_segue, UIViewController* svc, UIViewController* dvc) {
            
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[dvc] animated: NO ];
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        };
    }*/
}

@end
