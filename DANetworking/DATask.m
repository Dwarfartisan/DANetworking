//
//  DAHTTPConnection.m
//  DANetworking
//
//  Created by Mars Liu on 13-3-12.
//  Copyright (c) 2013年 dwarf-artisan. All rights reserved.
//

#import "DATask.h"
#import "DLog.h"

static NSUInteger pool_size = 32;
static NSMutableArray *pool = Nil;
static NSUInteger task_serial = 0;

@interface DATask () {
    dispatch_queue_t queue;
}

- (id)init;

@end

@implementation DATask

+ (id) newTask {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        pool = [[NSMutableArray alloc] initWithCapacity:pool_size];
    });
    if ([pool count] < pool_size) {
        DATask *task = [[DATask alloc] init];
        [pool addObject:task];
        [task release];
        return task;
    } else {
        NSUInteger idx = random()%[pool count];
        return [[pool objectAtIndex:idx] retain];
    }
}

+ (void) setPoolSize:(NSUInteger) poolSize {
    pool_size = poolSize;
}

+ (NSUInteger) upside {
    return pool_size;
}

+ (NSUInteger)currentCount {
    return [pool count];
}

- (id)init {
    self = [super init];
    if (self) {
        char label[64];
        snprintf(label, 64, "dwarf artisan serial task %ld", task_serial++);
        NSLog(@"%s", label);
        queue = dispatch_queue_create(label, DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (id)retain {
    return [super retain];
}

- (oneway void)release {
    [super release];
}

- (void)dealloc {
    [pool removeObject:self];
    dispatch_release(queue);
    [super dealloc];
}

- (void) do:(void(^)(void)) task {
    dispatch_async(queue, ^{
        @try {
            task();
        }@catch (NSError *error){
            DLog(@"catched %@", error);
        }
    });
}

@end
