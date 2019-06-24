//
//  AFHTTPSessionManager+ESExtension.m
//  AFNetworkingExtension
//
//  Created by Elf Sundae on 2019/06/24.
//  Copyright © 2019 https://0x123.com. All rights reserved.
//

#import "AFHTTPSessionManager+ESExtension.h"

@implementation AFHTTPSessionManager (ESExtension)

- (NSURL *)fullURL:(NSString *)path
{
    return [NSURL URLWithString:path relativeToURL:self.baseURL];
}

@end
