# AFNetworkExtension

[![Build status](https://github.com/ElfSundae/AFNetworkExtension/workflows/Build/badge.svg)](https://github.com/ElfSundae/AFNetworkExtension/actions?query=workflow%3ABuild)
![CocoaPods](https://img.shields.io/cocoapods/v/AFNetworkExtension)
![CocoaPods platforms](https://img.shields.io/cocoapods/p/AFNetworkExtension)

[AFNetworking](https://github.com/AFNetworking/AFNetworking) 3/4 extensions.

## Installation

```ruby
pod 'AFNetworkExtension'
```

## Usage

```objc
NSURL *baseURL = [NSURL URLWithString:@"https://api.github.com"];
AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
```

### [AFNetworkActivityLogger](https://github.com/AFNetworking/AFNetworkActivityLogger) extension

```objc
#if DEBUG
manager.logger.enabled = YES;
[manager.logger setLogLevel:AFLoggerLevelDebug];
#endif
```

### AFHTTPSessionManager extension

```objc
// https://api.github.com/users/ElfSundae
NSURL *url = [manager URLWithPath:@"users/ElfSundae"];

// Get all tasks which API path has prefix "/users/"
[manager tasksWithPath:@"users/*"];

// Get all POST tasks that requesting API path "/foo/bar"
[manager tasksWithPath:@"foo/bar" method:@"POST"];
```

### AFNetworkReachabilityManager extension

Get a string representation of an `AFNetworkReachabilityStatus` value:

```objc
AFNetworkReachabilityManager *reachability = [AFNetworkReachabilityManager sharedManager];

// 2
NSLog(@"%ld", reachability.networkReachabilityStatus);

// @"WiFi"
NSLog(@"%@", reachability.networkReachabilityStatusString);

// @"Reachable via WiFi"
NSLog(@"%@", reachability.localizedNetworkReachabilityStatusString);

// WWAN
NSLog(@"%@", AFNetworkReachabilityStatusString(AFNetworkReachabilityStatusReachableViaWWAN));
```

### AFHTTPRequestSerializer extension

```objc
manager.requestSerializer.HTTPRequestHeadersBlock = ^NSDictionary<NSString *, id> * (NSURLRequest * request, id parameters) {
    return @{ @"FooHeader": NSUUID.UUID.UUIDString };
};

manager.requestSerializer.URLQueryParametersBlock = ^NSDictionary<NSString *, id> * (NSString * method, NSString * URLString, id parameters) {
    return @{ @"_time": @((long)NSDate.date.timeIntervalSince1970) };
};
```

## License

AFNetworkExtension is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
