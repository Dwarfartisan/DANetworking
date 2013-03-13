//
//  TaskTest.m
//  DANetworking
//
//  Created by Mars Liu on 13-3-12.
//  Copyright (c) 2013年 dwarf-artisan. All rights reserved.
//

#import "TaskTest.h"
#import "DATask.h"

@implementation TaskTest

- (void)testSerials {
    for (int i=0; i<200; i++) {
        DATask *task = [DATask newTask];
        [task release];
    }
}

@end
