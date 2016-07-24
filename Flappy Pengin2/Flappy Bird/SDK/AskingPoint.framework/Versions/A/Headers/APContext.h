//
//  APContext.h
//  AskingPoint
//
//  Copyright (c) 2012 KnowFu Inc. All rights reserved.
//
#import <Foundation/Foundation.h>

#define AP_VERSION @"2.3.2"
extern NSString * const APVersion;

#define AP_COPYRIGHT @"AskingPoint SDK v" AP_VERSION @". Copyright 2012-2013 KnowFu Inc., All Rights Reserved."

#if defined(__cplusplus)
#define ASKINGPOINT_EXTERN extern "C"
#else
#define ASKINGPOINT_EXTERN extern
#endif

extern const int APLogLevelError;
extern const int APLogLevelWarn;
extern const int APLogLevelInfo;

@class APAnalytics;
@class APCommandManager;

@interface APContext : NSObject

@property(nonatomic,copy) NSString *localizedAppName;
@property(nonatomic,copy) NSString *appVersion;

+(void)startup:(NSString *)appKey;
+(APContext *)sharedContext;

+(void)setLogLevel:(int)logLevel;

@end

@interface APContext (APAnalytics)
@property(nonatomic,readonly) APAnalytics *analytics;
+(APAnalytics *)sharedAnalytics;
@end

@interface APContext (APCommandManager)
@property(nonatomic,readonly) APCommandManager *commandManager;
+(APCommandManager *)sharedCommandManager;
@end