//
//  AFHTTPSessionManager+ESExtension.h
//  AFNetworkingExtension
//
//  Created by Elf Sundae on 2019/06/24.
//  Copyright © 2019 https://0x123.com. All rights reserved.
//

#import <AFNetworking/AFHTTPSessionManager.h>

NS_ASSUME_NONNULL_BEGIN

@interface AFHTTPSessionManager (ESExtension)

/**
 * Returns the full URL of the given path relative to the base URL.
 */
- (NSURL *)URLWithPath:(NSString *)path;

/**
 * The data, upload, and download tasks currently run by the managed session.
 * @note The `URLString` can end with "*" to match path prefix.
 */
- (NSArray<NSURLSessionTask *> *)tasksWithURL:(NSString *)URLString method:(nullable NSString *)method;

@end

NS_ASSUME_NONNULL_END
