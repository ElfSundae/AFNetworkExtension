//
//  AFHTTPRequestSerializer+ESExtension.h
//  AFNetworkingExtension
//
//  Created by Elf Sundae on 2019/06/18.
//  Copyright © 2019 https://0x123.com. All rights reserved.
//

#import <AFNetworking/AFURLRequestSerialization.h>

NS_ASSUME_NONNULL_BEGIN

typedef NSDictionary<NSString *, id> * _Nullable (^ AFURLQueryBlock)(NSString *method, NSString *URLString, id _Nullable parameters);
typedef NSDictionary<NSString *, id> * _Nullable (^ AFHTTPRequestHeadersBlock)(NSURLRequest *request, id _Nullable parameters);

@interface AFHTTPRequestSerializer (ESExtension)

/**
 * The block that may return additional URL query parameters for the request.
 */
@property (nullable, nonatomic, copy) AFURLQueryBlock URLQueryParametersBlock;

/**
 * The block that may return additional HTTP request headers.
 * @discussion You can remove an existing header by giving [NSNull null] as
 * the header value.
 */
@property (nullable, nonatomic, copy) AFHTTPRequestHeadersBlock HTTPRequestHeadersBlock;

@end

NS_ASSUME_NONNULL_END
