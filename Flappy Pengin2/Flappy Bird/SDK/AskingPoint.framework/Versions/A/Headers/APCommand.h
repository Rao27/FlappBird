//
//  APCommand.h
//  AskingPointLib
//
//  Copyright (c) 2013 KnowFu Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum APCommandType {
    APCommandWeb,                   // Set for Pop-up WebView. E.g. survey
    APCommandAlert,                 // Set for Messages, Rating Booster
    APCommandPayload                // Set for Remote-Control feature
} APCommandType;

typedef enum APAlertType {
    APAlertUnknown,                 // An UNKNOWN AlertType. Should not be seen by end user Apps
    APAlertRating,                  // Ratings Booster
    APAlertMessage                  // Pull Message
} APAlertType;

typedef enum APAlertRatingButtonType {
    APAlertRatingNone,              // An ERROR. Not a Rating Alert Button
    APAlertRatingYes,               // Will rate it
    APAlertRatingNo,                // Will not rate it
    APAlertRatingRemindMe           // Remind me to rate it later
} APAlertRatingButtonType;

@interface APCommand : NSObject
@property(nonatomic,readonly) APCommandType type;
@property(nonatomic,readonly) id commandId;
@property(nonatomic,readonly) BOOL test;                // Set to YES when shown by a Dashboard Test.
@property(nonatomic,readonly) NSSet *tags;              // Lists Tags set in features Dashboard Tag Editor.
@property(nonatomic,readonly) NSString *requestedTag;   // Tag that triggered this.
@property(nonatomic,readonly) id data;                  // Contains JSON data when Remote-Control APCommandPayload
@property(nonatomic,readonly,getter=isComplete) BOOL complete; // Indicates processing of an APCommand is complete.
-(void)reportComplete;                                  // Must be called when done processing Remote-Control (Payload) or else no further commands are received.
@end

@interface APCommand (Web)
@property(nonatomic,readonly) NSURL *url;               // URL the pop-up web view will take the user to.
@end

@class APAlertButton;

@interface APCommand (Alert)
@property(nonatomic,readonly) APAlertType alertType;
@property(nonatomic,copy) NSString *language;           // BCP 47 Language code (wikipedia.org/wiki/BCP_47).
@property(nonatomic,copy) NSString *title;              // Text to show in widget title bar.
@property(nonatomic,copy) NSString *message;            // Text to show in widget message body.
@property(nonatomic,readonly) NSArray *buttons;         // Array of APAlertButton items to show on widget.
-(void)reportCompleteWithButton:(APAlertButton*)button; // Must be called when customizing Rating or Message widget look and feel and your widget is
                                                        // collecting button responses. This reports the user selection and prevents them being prompted again.
@end

@interface APAlertButton : NSObject
@property(nonatomic,readonly) id buttonId;
@property(nonatomic,readonly) BOOL cancel;  // Follows Apple usability guidelines for Cancel buttons.
@property(nonatomic,readonly) NSURL *url;   // On Rating widget, the "Rate It" button contains a URL to the App's app store page. On a Message widget, Custom buttons have this set to URL added to button, else nil
@property(nonatomic,copy) NSString *text;   // Text that is shown on button, will be in language implied by APCommand language property.
@end

@interface APAlertButton (Rating)
@property(nonatomic,readonly) APAlertRatingButtonType ratingType;
@end
