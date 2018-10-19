//
//  MUtilities.h
//  ASBunqAssignment
//
//  Created by Alessio Sardella on 07/08/18.
//  Copyright © 2018 Alessio Sardella. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MUtilities : NSObject{
    
}

/* STRING */

+ (BOOL)stringIsNullOrEmpty:(NSString *)candidate;

+ (NSString *)makeGuid;

+ (NSString*)stringFromDate:(NSDate*)date;

+ (NSString*)stringFromDate:(NSDate*)date withFormat:(NSString*)format;

/*IMAGES*/

+ (UIImage *)image:(UIImage *)source withColor:(UIColor*)color;

/*COLORS*/

+ (NSString *)hexStringForColor:(UIColor *)color;

+ (UIColor*)randomUIColor;

/*DIRECTORY*/

+ (NSURL *)applicationDocumentsDirectoryURL;

+ (NSString *)applicationDocumentsDirectoryPath;

/*NSDate*/

+(NSDate*)jsonMinDate;

+(NSDate*)jsonMaxDate;

+ (NSDate*)dateFromString:(NSString*)dateString;

/* VIEW X,Y calculation */

+ (CGFloat)getBottomYpointForView:(UIView*)view plusPad:(int)pad;

+ (CGFloat)getBottomYpointForView:(UIView*)view;

+ (CGFloat)getRightXpointForView:(UIView*)view plusPad:(int)pad;

+ (CGFloat)getRightXpointForView:(UIView*)view;

+ (CGFloat) getMiddleXPointInView:(UIView*)container forViewWithSizeWidth:(CGFloat)width;

+ (CGFloat) getMiddleYPointInView:(UIView*)container forViewWithSizeHeight:(CGFloat)height;

/* DRAW LINES */

+ (void)addBottomBorderOnView:(UIView*)view withPad:(int)margin color:(UIColor*)color;

/* RANDOM */

+ (float)randomFloatBetween:(float)smallNumber and:(float)bigNumber;

@end
