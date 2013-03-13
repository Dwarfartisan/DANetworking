//
//  DAHTTPConnection.h
//  DANetworking
//
//  Created by Mars Liu on 13-3-12.
//  Copyright (c) 2013年 dwarf-artisan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DATask : NSObject

+ (id) newTask;
+ (void) setPoolSize:(NSUInteger) poolSize;
+ (NSUInteger) upside;
+ (NSUInteger) currentCount;

- (void) do:(void (^)(void)) task;

@end
