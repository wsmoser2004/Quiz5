//
//  DetailViewController.m
//  Quiz5
//
//  Created by Moser, Wesley on 3/14/14.
//  Copyright (c) 2014 Moser, Wesley. All rights reserved.
//

#import "Task.h"
#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.nameField.text = self.task.name;
    self.urgencySlider.value = self.task.urgency;
    self.urgencyLabel.text = [NSString stringWithFormat:@"%.2f", self.urgencySlider.value];
    self.dueDatePicker.date = self.task.dueDate;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveClick:(id)sender
{
    self.task.name   = self.nameField.text;
    self.task.urgency = self.urgencySlider.value;
    self.task.dueDate = self.dueDatePicker.date;
    [[self navigationController] popViewControllerAnimated:YES];
    self.dismissBlock();
//    [[self presentingViewController] dismissViewControllerAnimated:YES completion:self.dismissBlock];
}

- (IBAction)urgencyChanged:(id)sender
{
    self.urgencyLabel.text = [NSString stringWithFormat:@"%.2f", self.urgencySlider.value];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.nameField resignFirstResponder];
    return YES;
}
@end
