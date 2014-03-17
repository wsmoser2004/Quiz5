//
//  Quiz5ViewController.m
//  Quiz5
//
//  Created by Moser, Wesley on 3/14/14.
//  Copyright (c) 2014 Moser, Wesley. All rights reserved.
//

#import "DetailViewController.h"
#import "Task.h"
#import "Quiz5ViewController.h"

@interface Quiz5ViewController ()

@property (nonatomic, strong) NSMutableArray *tasks;

@end

@implementation Quiz5ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tasks = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++)
    {
        Task *newTask = [[Task alloc] init];
        NSTimeInterval numDays = 60 * 60 * 24 * i;
        NSDate *now = [[NSDate alloc] init];
        
        newTask.urgency = i;
        newTask.dueDate = [now dateByAddingTimeInterval:numDays];
        newTask.name = [NSString stringWithFormat:@"Task %d", i];
        
        [self.tasks addObject:newTask];
    }
    self.title = @"My Tasks";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"UITableViewCell"];
    }
    
    Task *currTask = [self.tasks objectAtIndex:[indexPath row]];
    
    cell.textLabel.text = currTask.name;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterFullStyle];
    cell.detailTextLabel.text = [formatter stringFromDate:currTask.dueDate];
    cell.backgroundColor = [UIColor colorWithRed:(currTask.urgency * .11) green:((9 - currTask.urgency) * .11) blue:0 alpha:1];
    if (currTask.urgency > 6)
    {
        [cell.imageView setImage:[UIImage imageNamed:@"urgent.jpg"]];
    }
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UITableViewCell *cell = (UITableViewCell *)sender;
    NSIndexPath *path = [self.tableView indexPathForCell:cell];

    DetailViewController *detailView = ((DetailViewController *)[segue destinationViewController]);
    
    detailView.task = self.tasks[[path row]];
    detailView.dismissBlock = ^{
        [self.tasks sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
            Task *t1 = (Task *)obj1;
            Task *t2 = (Task *)obj2;
            return [t1.dueDate compare:t2.dueDate];
        }];
        [[self tableView] reloadData];
    };
    detailView.title = ((Task *)self.tasks[[path row]]).name;
}

@end
