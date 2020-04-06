//
//  AFNetworkingExtension.h
//  AFNetworkingExtension
//
//  Created by Elf Sundae on 2019/06/18.
//  Copyright © 2019 https://0x123.com. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT double AFNetworkingExtensionVersionNumber;
FOUNDATION_EXPORT const unsigned char AFNetworkingExtensionVersionString[];

// Logger
#import "AFNetworkActivityLogger+AFEExtension.h"

// NSURLSession
#import "AFHTTPSessionManager+AFEExtension.h"

// Reachability
#if !TARGET_OS_WATCH
#import "AFNetworkReachabilityManager+AFEExtension.h"
#endif

// Serialization
#import "AFHTTPRequestSerializer+AFEExtension.h"
