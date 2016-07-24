//
//  APCommandType.h
//  AskingPointLib
//
//  Copyright (c) 2012 KnowFu Inc. All rights reserved.
//
#import <AskingPoint/APContext.h>
#import <AskingPoint/APCommand.h>

@protocol APCommandManagerDelegate
@required
-(void)commandManager:(APCommandManager*)commandManager reportAlertResponseForCommand:(APCommand*)command button:(APAlertButton*)pressed;
@end

typedef void (^APCommandManagerRequestComplete)(NSString *tag, APCommand *command);


@interface APCommandManager : NSObject

@property(nonatomic,assign) id<APCommandManagerDelegate> commandDelegate;

-(void)requestCommandsWithTag:(NSString*)tag completionHandler:(APCommandManagerRequestComplete)completionHandler;
-(void)reportAlertResponseForCommand:(APCommand*)command button:(APAlertButton*)button;

@end
