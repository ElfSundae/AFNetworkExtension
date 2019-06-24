//
//  AFHTTPSessionManager+ESExtension.h
//  AFNetworkingExtension
//
//  Created by Elf Sundae on 2019/06/24.
//  Copyright © 2019 https://0x123.com. All rights reserved.
//

#import "AFHTTPSessionManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface AFHTTPSessionManager (ESExtension)

/**
 * Returns the full URL of the given path relative to the baseURL.
 */
- (NSURL *)fullURL:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
