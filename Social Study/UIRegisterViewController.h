//
//  RegisterViewController.h
//  Social Study
//
//  Created by Nicholas Gordon on 9/1/14.
//  Copyright (c) 2014 Duke University. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIRegisterViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong) NSArray *tableItems;
@property (nonatomic, strong) NSArray *tableItemSelectors;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIButton *createButton;
@property (nonatomic, weak) IBOutlet UITextView *textView;

@end
