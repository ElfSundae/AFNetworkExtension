//
//  AFNetworkActivityLogger+ESExtension.m
//  AFNetworkingExtension
//
//  Created by Elf Sundae on 2019/06/18.
//  Copyright © 2019 https://0x123.com. All rights reserved.
//

#import "AFNetworkActivityLogger+ESExtension.h"
#import <objc/runtime.h>
#import <ESFramework/ESHelpers.h>

static const void *enabledKey = &enabledKey;

@implementation AFNetworkActivityLogger (ESExtension)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ESSwizzleInstanceMethod(self, @selector(startLogging), @selector(nc_startLogging));
        ESSwizzleInstanceMethod(self, @selector(stopLogging), @selector(nc_stopLogging));
    });
}

- (void)nc_startLogging
{
    [self nc_startLogging];

    objc_setAssociatedObject(self, enabledKey, @YES, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)nc_stopLogging
{
    [self nc_stopLogging];

    objc_setAssociatedObject(self, enabledKey, @NO, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isEnabled
{
    return ESBoolValue(objc_getAssociatedObject(self, enabledKey));
}

- (void)setEnabled:(BOOL)enabled
{
    if (enabled == self.isEnabled) {
        return;
    }

    if (enabled) {
        [self startLogging];
    } else {
        [self stopLogging];
    }
}

@end

static const void *loggerKey = &loggerKey;

@implementation AFHTTPSessionManager (ESActivityLogger)

- (AFNetworkActivityLogger *)logger
{
    AFNetworkActivityLogger *logger = objc_getAssociatedObject(self, loggerKey);

    if (!logger) {
        logger = [[AFNetworkActivityLogger alloc] init];
        self.logger = logger;
    }

    return logger;
}

- (void)setLogger:(AFNetworkActivityLogger *)logger
{
    objc_setAssociatedObject(self, loggerKey, logger, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    if (logger) {
        for (id<AFNetworkActivityLoggerProtocol> aLogger in logger.loggers) {
            [self _addBaseURLFilterPredicateForLogger:aLogger];
        }
    }
}

- (void)_addBaseURLFilterPredicateForLogger:(id<AFNetworkActivityLoggerProtocol>)logger
{
    if (!self.baseURL) {
        return;
    }

    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL (NSURLRequest * _Nullable request, NSDictionary<NSString *, id> * _Nullable bindings) {
        return ![request.URL.absoluteString hasPrefix:self.baseURL.absoluteString];
    }];

    if (logger.filterPredicate) {
        predicate = [[NSCompoundPredicate alloc]
                     initWithType:NSOrPredicateType
                     subpredicates:@[ predicate, logger.filterPredicate ]];
    }

    logger.filterPredicate = predicate;
}

@end
