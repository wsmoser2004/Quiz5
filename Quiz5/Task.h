//
//  Task.h
//  Quiz5
//
//  Created by Moser, Wesley on 3/14/14.
//  Copyright (c) 2014 Moser, Wesley. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDate *dueDate;
@property (nonatomic) float urgency;

@end
