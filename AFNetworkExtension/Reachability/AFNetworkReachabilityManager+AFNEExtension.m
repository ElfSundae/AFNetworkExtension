//
//  AFNetworkReachabilityManager+AFNEExtension.m
//  AFNetworkExtension
//
//  Created by Elf Sundae on 2019/06/18.
//  Copyright © 2019 https://0x123.com. All rights reserved.
//

#import "AFNetworkReachabilityManager+AFNEExtension.h"

#if !TARGET_OS_WATCH

NSString *AFNetworkReachabilityStatusString(AFNetworkReachabilityStatus status)
{
    switch (status) {
        case AFNetworkReachabilityStatusNotReachable:
            return @"None";
        case AFNetworkReachabilityStatusReachableViaWWAN:
            return @"WWAN";
        case AFNetworkReachabilityStatusReachableViaWiFi:
            return @"WiFi";
        case AFNetworkReachabilityStatusUnknown:
        default:
            return @"Unknown";
    }
}

@implementation AFNetworkReachabilityManager (AFNEExtension)

- (NSString *)networkReachabilityStatusString
{
    return AFNetworkReachabilityStatusString(self.networkReachabilityStatus);
}

@end

#endif
