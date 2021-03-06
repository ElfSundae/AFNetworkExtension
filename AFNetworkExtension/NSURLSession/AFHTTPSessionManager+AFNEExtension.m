//
//  AFHTTPSessionManager+AFNEExtension.m
//  AFNetworkExtension
//
//  Created by Elf Sundae on 2019/06/24.
//  Copyright © 2019 https://0x123.com. All rights reserved.
//

#import "AFHTTPSessionManager+AFNEExtension.h"

static BOOL AFNEIsURLMatchesURL(NSURL *URL, NSURL *matchURL)
{
    if ([URL.host compare:matchURL.host options:NSCaseInsensitiveSearch] != NSOrderedSame) {
        return NO;
    }

    NSString *matchPath = matchURL.path;
    if ([matchPath hasSuffix:@"*"]) {
        NSString *matchPrefix = [matchPath substringToIndex:matchPath.length - 1];
        return [URL.path.lowercaseString hasPrefix:matchPrefix.lowercaseString];
    } else {
        return [URL.path compare:matchPath options:NSCaseInsensitiveSearch] == NSOrderedSame;
    }
}

@implementation AFHTTPSessionManager (AFNEExtension)

- (NSURL *)URLWithPath:(NSString *)path
{
    return [NSURL URLWithString:path relativeToURL:self.baseURL];
}

- (NSArray<NSURLSessionTask *> *)tasksWithPath:(NSString *)path
{
    return [self tasksWithPath:path method:nil];
}

- (NSArray<NSURLSessionTask *> *)tasksWithPath:(NSString *)path
                                        method:(nullable NSString *)method
{
    NSURL *url = [self URLWithPath:path];
    method = [method uppercaseString];

    NSMutableArray *tasks = [NSMutableArray array];

    for (NSURLSessionTask *task in self.tasks) {
        NSURLRequest *request = task.originalRequest;
        if ((!method || [request.HTTPMethod isEqualToString:method])
            && AFNEIsURLMatchesURL(request.URL, url)) {
            [tasks addObject:task];
        }
    }

    return tasks;
}

@end
