//
//  AFNetworkActivityLogger+ESExtension.h
//  AFNetworkingExtension
//
//  Created by Elf Sundae on 2019/06/18.
//  Copyright © 2019 https://0x123.com. All rights reserved.
//

#import <AFNetworkActivityLogger/AFNetworkActivityLogger.h>

NS_ASSUME_NONNULL_BEGIN

@interface AFNetworkActivityLogger (ESExtension)

/**
 * Start/Stop logging, indicate whether the logger is enabled or not.
 */
@property (nonatomic, getter = isEnabled) BOOL enabled;

@end

NS_ASSUME_NONNULL_END
