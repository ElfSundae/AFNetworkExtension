//
//  AFNetworkReachabilityManager+AFEExtension.h
//  AFNetworkingExtension
//
//  Created by Elf Sundae on 2019/06/18.
//  Copyright © 2019 https://0x123.com. All rights reserved.
//

#import <AFNetworking/AFNetworkReachabilityManager.h>
#if !TARGET_OS_WATCH

NS_ASSUME_NONNULL_BEGIN

/**
 * Returns a string representation of an `AFNetworkReachabilityStatus` value.
 * @discussion Possible values: "None", "WWAN", "WiFi", "Unknown".
 */
FOUNDATION_EXPORT NSString *AFNetworkReachabilityStatusString(AFNetworkReachabilityStatus status);

@interface AFNetworkReachabilityManager (AFEExtension)

/**
 * Returns a string representation of the current network reachability status.
 * @discussion Possible values: "None", "WWAN", "WiFi", "Unknown".
 */
- (NSString *)networkReachabilityStatusString;

@end

NS_ASSUME_NONNULL_END
#endif
