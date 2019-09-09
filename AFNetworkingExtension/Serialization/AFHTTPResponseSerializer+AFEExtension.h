//
//  AFHTTPResponseSerializer+AFEExtension.h
//  AFNetworkingExtension
//
//  Created by Elf Sundae on 2019/09/09.
//  Copyright © 2019 https://0x123.com. All rights reserved.
//

#import "AFURLResponseSerialization.h"

NS_ASSUME_NONNULL_BEGIN

@interface AFHTTPResponseSerializer (AFEExtension)

/**
 * Validates the decoded response object.
 */
- (BOOL)validateResponseObject:(nullable id)responseObject;

@end

NS_ASSUME_NONNULL_END
