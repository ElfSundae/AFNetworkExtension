//
//  AFHTTPResponseSerializer+ESExtension.h
//  AFNetworkingExtension
//
//  Created by Elf Sundae on 2019/06/25.
//  Copyright © 2019 https://0x123.com. All rights reserved.
//

#import <AFNetworking/AFURLResponseSerialization.h>

NS_ASSUME_NONNULL_BEGIN

typedef BOOL (^AFResponseObjectValidationBlock)(NSURLResponse * _Nullable response, id _Nullable object);

@interface AFHTTPResponseSerializer (ESExtension)

@property (nullable, nonatomic, copy) AFResponseObjectValidationBlock responseObjectValidationBlock;

@end

NS_ASSUME_NONNULL_END
