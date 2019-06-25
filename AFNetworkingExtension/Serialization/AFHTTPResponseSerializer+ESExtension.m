//
//  AFHTTPResponseSerializer+ESExtension.m
//  AFNetworkingExtension
//
//  Created by Elf Sundae on 2019/06/25.
//  Copyright © 2019 https://0x123.com. All rights reserved.
//

#import "AFHTTPResponseSerializer+ESExtension.h"
#import <ESFramework/ESHelpers.h>

ESDefineAssociatedObjectKey(responseObjectValidationBlock)

@implementation AFHTTPResponseSerializer (ESExtension)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ESSwizzleInstanceMethod(self, @selector(responseObjectForResponse:data:error:), @selector(es_responseObjectForResponse:data:error:));
    });
}

- (AFResponseObjectValidationBlock)responseObjectValidationBlock
{
    return objc_getAssociatedObject(self, responseObjectValidationBlockKey);
}

- (void)setResponseObjectValidationBlock:(AFResponseObjectValidationBlock)block
{
    objc_setAssociatedObject(self, responseObjectValidationBlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (id)es_responseObjectForResponse:(NSURLResponse *)response
                              data:(NSData *)data
                             error:(NSError *__autoreleasing *)error
{
    NSError *serializerError = nil;
    id object = [self es_responseObjectForResponse:response data:data error:&serializerError];

    if (serializerError) {
        if (error) {
            *error = serializerError;
        }

        return nil;
    }

    if (self.responseObjectValidationBlock &&
        !self.responseObjectValidationBlock(response, object)) {
        if (error) {
            NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
            userInfo[NSLocalizedDescriptionKey] = NSLocalizedStringFromTable(@"Invalid response object", @"AFNetworking", nil);
            userInfo[NSURLErrorFailingURLErrorKey] = response.URL;
            userInfo[AFNetworkingOperationFailingURLResponseErrorKey] = response;
            if (object) {
                userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] = object;
            } else if (data) {
                userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] = data;
            }

            *error = [NSError errorWithDomain:AFURLResponseSerializationErrorDomain
                                         code:NSURLErrorCannotDecodeContentData
                                     userInfo:userInfo];
        }

        return nil;
    }

    return object;
}

@end
