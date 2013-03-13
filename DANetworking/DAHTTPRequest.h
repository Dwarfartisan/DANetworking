//
//  DAHTTPRequest.h
//  DANetworking
//
//  Created by Mars Liu on 13-3-12.
//  Copyright (c) 2013年 dwarf-artisan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DASerialTask.h"

@interface DAHTTPRequest : NSObject

@property (readonly) BOOL isBusying;
@property (strong, nonatomic) NSString *method;

- (NSData *) syncWith:(NSURL *)url;
- (void) asyncWith:(NSURL *)url callback:(void (^)(NSData *)) callback;
- (void) asyncWith:(NSURL *)url;

- (void) asyncWith:(NSURL *)url connection:(DASerialTask *)connection callback:(void (^)(NSData *)) callback;
- (void) asyncWith:(NSURL *)url connection:(DASerialTask *)connection;

@end
