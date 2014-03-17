//
//  DetailViewController.h
//  Quiz5
//
//  Created by Moser, Wesley on 3/14/14.
//  Copyright (c) 2014 Moser, Wesley. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Task;

@interface DetailViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UIDatePicker *dueDatePicker;
@property (weak, nonatomic) IBOutlet UILabel *urgencyLabel;
@property (weak, nonatomic) IBOutlet UISlider *urgencySlider;

- (IBAction)saveClick:(id)sender;
- (IBAction)urgencyChanged:(id)sender;

@property (strong, nonatomic) void (^dismissBlock)(void);
@property (weak, nonatomic) Task *task;

@end
