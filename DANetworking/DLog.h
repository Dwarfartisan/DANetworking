//
//  DLog.h
//  DANetworking
//
//  Created by Mars Liu on 13-3-13.
//  Copyright (c) 2013年 dwarf-artisan. All rights reserved.
//

#ifndef DANetworking_DLog_h
#define DANetworking_DLog_h

#ifdef DEBUG
#       define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#       define DLog(...)
#endif

#endif
