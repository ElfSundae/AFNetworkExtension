//
//  AFHTTPResponseSerializer+AFEExtension.m
//  AFNetworkingExtension
//
//  Created by Elf Sundae on 2019/09/09.
//  Copyright © 2019 https://0x123.com. All rights reserved.
//

#import "AFHTTPResponseSerializer+AFEExtension.h"
#import <ESFramework/ESHelpers.h>

@implementation AFHTTPResponseSerializer (AFEExtension)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ESSwizzleInstanceMethod(self, @selector(responseObjectForResponse:data:error:), @selector(afe_responseObjectForResponse:data:error:));
    });
}

- (id)afe_responseObjectForResponse:(NSURLResponse *)response
                               data:(NSData *)data
                              error:(NSError *__autoreleasing *)error
{
    NSError *serializationError = nil;
    id responseObject = [self afe_responseObjectForResponse:response data:data error:&serializationError];

    if (serializationError) {
        if (error) {
            *error = serializationError;
        }

        return nil;
    }

    if (![self validateResponseObject:responseObject]) {
        if (error) {
            NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
            userInfo[NSLocalizedDescriptionKey] = NSLocalizedStringFromTable(@"Request failed: invalid response object", @"AFNetworking", nil);
            userInfo[NSURLErrorFailingURLErrorKey] = response.URL;
            userInfo[AFNetworkingOperationFailingURLResponseErrorKey] = response;
            if (responseObject) {
                userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] = responseObject;
            } else if (data) {
                userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] = data;
            }
            *error = [NSError errorWithDomain:AFURLResponseSerializationErrorDomain
                                         code:NSURLErrorCannotDecodeContentData
                                     userInfo:userInfo];
        }

        return nil;
    }

    return responseObject;
}

- (BOOL)validateResponseObject:(id)responseObject;
{
    return YES;
}

@end
