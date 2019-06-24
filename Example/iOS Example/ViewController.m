//
//  ViewController.m
//  iOS Example
//
//  Created by Elf Sundae on 2019/06/18.
//  Copyright © 2019 https://0x123.com. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworkingExtension/AFNetworkingExtension.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [AFNetworkReachabilityManager.sharedManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Network status: %@", AFNetworkReachabilityStatusString(status));
    }];
    [AFNetworkReachabilityManager.sharedManager startMonitoring];

    NSURL *baseURL = [NSURL URLWithString:@"https://api.github.com"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];

#if DEBUG
    manager.logger.enabled = YES;
    [manager.logger setLogLevel:AFLoggerLevelDebug];
#endif

    manager.requestSerializer.HTTPRequestHeadersBlock = ^NSDictionary<NSString *, id> * _Nullable (NSURLRequest * _Nonnull request, id _Nullable parameters) {
        return @{ @"FooHeader": NSUUID.UUID.UUIDString };
    };
    manager.requestSerializer.URLQueryParametersBlock = ^NSDictionary<NSString *, id> * _Nullable (NSString * _Nonnull method, NSString * _Nonnull URLString, id _Nullable parameters) {
        return @{ @"_time": @((long)NSDate.date.timeIntervalSince1970) };
    };

    [manager GET:@"users/ElfSundae" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        // NSLog(@"responseObject: %@", responseObject);
    } failure:nil];

    // Should not log
    [manager GET:@"https://httpbin.org/get" parameters:nil progress:nil success:nil failure:nil];

    [manager GET:@"/users/ElfSundae/repos"
     parameters:@{ @"type": @"all", @"sort": @"updated" }
       progress:nil success:nil failure:nil];
}

@end
