# AFNetworkingExtension

[![Build Status](https://travis-ci.org/ElfSundae/AFNetworkingExtension.svg)](https://travis-ci.org/ElfSundae/AFNetworkingExtension)

[AFNetworking](https://github.com/AFNetworking/AFNetworking) extension.

## Installation

```ruby
pod 'AFNetworkingExtension'
```

Sub specs:

```ruby
pod 'AFNetworkingExtension/Logger'
pod 'AFNetworkingExtension/Reachability'
pod 'AFNetworkingExtension/Serialization'
```

## Usage

### AFNetworkReachabilityManager

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

### [AFNetworkActivityLogger](https://github.com/AFNetworking/AFNetworkActivityLogger)

```objc
NSURL *baseURL = [NSURL URLWithString:@"https://api.github.com"];
AFHTTPSessionManager *github = [[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];

#if DEBUG
    github.logger.enabled = YES;
    [github.logger setLogLevel:AFLoggerLevelDebug];
#endif
```

### AFHTTPRequestSerializer

```objc
github.requestSerializer.HTTPRequestHeadersBlock = ^NSDictionary<NSString *, id> * (NSURLRequest * request, id parameters) {
    return @{ @"FooHeader": NSUUID.UUID.UUIDString };
};

github.requestSerializer.URLQueryParametersBlock = ^NSDictionary<NSString *, id> * (NSString * method, NSString * URLString, id parameters) {
    return @{ @"_time": @((long)NSDate.date.timeIntervalSince1970) };
};
```

## License

AFNetworkingExtension is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
