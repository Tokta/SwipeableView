//
//  MUtilities.m
//  ASBunqAssignment
//
//  Created by Alessio Sardella on 07/08/18.
//  Copyright © 2018 Alessio Sardella. All rights reserved.
//

#import "MUtilities.h"

@implementation MUtilities

/* STRING */

+ (BOOL)stringIsNullOrEmpty:(NSString *)candidate {
    
    return (candidate == nil || [candidate isEqualToString:@""]);
    
}

+(NSString *)makeGuid {
    
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuidStringRef = CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    NSString *newGuid = [(__bridge NSString *)uuidStringRef lowercaseString];
    CFRelease(uuidStringRef);
    return newGuid;
}

+ (NSString*)stringFromDate:(NSDate*)date{
    
    NSDateFormatter *dateF = [[NSDateFormatter alloc] init];
    [dateF setDateFormat:@"dd/MM/yyyy HH:mm"];
    return [dateF stringFromDate:date];

}

+ (NSDate*)dateFromString:(NSString*)dateString{

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy HH:mm"];
    return [dateFormatter dateFromString:dateString];
}
+ (NSString*)stringFromDate:(NSDate*)date withFormat:(NSString*)format{
    
    NSDateFormatter *dateF = [[NSDateFormatter alloc] init];
    [dateF setDateFormat:format];
    return [dateF stringFromDate:date];
    
}

/*IMAGES*/
+ (UIImage *)image:(UIImage *)source withColor:(UIColor*)color {
    UIGraphicsBeginImageContextWithOptions(source.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setFill];
    
    // translate/flip the graphics context (for transforming from CG* coords to UI* coords
    CGContextTranslateCTM(context, 0, source.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGContextSetBlendMode(context, kCGBlendModeColorBurn);
    CGRect rect = CGRectMake(0, 0, source.size.width, source.size.height);
    CGContextDrawImage(context, rect, source.CGImage);
    
    CGContextSetBlendMode(context, kCGBlendModeSourceIn);
    CGContextAddRect(context, rect);
    CGContextDrawPath(context,kCGPathFill);
    
    // generate a new UIImage from the graphics context we drew onto
    UIImage *coloredImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //return the color-burned image
    return coloredImg;
}

/*COLORS*/
+ (NSString *)hexStringForColor:(UIColor *)color {
    
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    NSString *hexString=[NSString stringWithFormat:@"%02X%02X%02X", (int)(r * 255), (int)(g * 255), (int)(b * 255)];
    return hexString;
    
}

+ (UIColor*)randomUIColor{
    
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

/*DIRECTORY*/
+ (NSURL *)applicationDocumentsDirectoryURL{
    
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    
}

+ (NSString *)applicationDocumentsDirectoryPath{
    
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject].relativePath;
}

/*NSDate*/

+(NSDate*)jsonMinDate {
    return [NSDate dateWithTimeIntervalSince1970:0];
}

+(NSDate*)jsonMaxDate {
    return [NSDate dateWithTimeIntervalSinceNow:(3650*24*60*60)];
}

/* VIEW X,Y calculation */
+ (CGFloat)getBottomYpointForView:(UIView*)view plusPad:(int)pad{
    
    return view.frame.origin.y + view.frame.size.height +pad;
}

+ (CGFloat)getBottomYpointForView:(UIView*)view{
    
    return view.frame.origin.y + view.frame.size.height;
}

+ (CGFloat)getRightXpointForView:(UIView*)view plusPad:(int)pad{
    
    return view.frame.origin.x + view.frame.size.width +pad;
}

+ (CGFloat)getRightXpointForView:(UIView*)view{
    
    return view.frame.origin.x + view.frame.size.width;
}

+ (CGFloat) getMiddleXPointInView:(UIView*)container forViewWithSizeWidth:(CGFloat)width{
    
    return container.frame.size.width/2 - width/2;
}

+ (CGFloat) getMiddleYPointInView:(UIView*)container forViewWithSizeHeight:(CGFloat)height{
    
    return container.frame.size.height/2 - height/2;
}

/* DRAW LINE*/

+ (void)addBottomBorderOnView:(UIView*)view withPad:(int)margin color:(UIColor*)color{
    
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.backgroundColor = [color CGColor];
    bottomBorder.frame = CGRectMake(margin, CGRectGetHeight(view.frame) - 1, CGRectGetWidth(view.frame)- margin*2, 0.5f);
    [view.layer addSublayer:bottomBorder];
}

/* RANDOM */

+ (float)randomFloatBetween:(float)smallNumber and:(float)bigNumber {
    float diff = bigNumber - smallNumber;
    return (((float) (arc4random() % ((unsigned)RAND_MAX + 1)) / RAND_MAX) * diff) + smallNumber;
}

@end
