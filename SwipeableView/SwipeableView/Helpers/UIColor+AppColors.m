//
//  UIColor+AppColors.m
//  ASBunqAssignment
//
//  Created by Alessio Sardella on 08/08/18.
//  Copyright © 2018 Alessio Sardella. All rights reserved.
//

#import "UIColor+AppColors.h"

@implementation UIColor (AppColors)

+ (UIColor*) defaultBackgroundColor{
   
    return [UIColor colorWithRed:0.90 green:0.93 blue:0.93 alpha:1.00];
}

+ (UIColor *)defaultNavigationBarColor{
    
    return [UIColor colorWithRed:0.03 green:0.28 blue:0.58 alpha:1.00];
}

+ (UIColor*)defaultNavigationBarTextColor{
    
    return [UIColor whiteColor];
}

+ (UIColor*) defaultGreenColor{
    return [UIColor colorWithRed:0.62 green:0.79 blue:0.13 alpha:1.00];
}

+ (UIColor*) defaultRedColor{
    return [UIColor colorWithRed:0.92 green:0.35 blue:0.21 alpha:1.00];
}

+ (UIColor*) defaultYellowColor{
    return [UIColor colorWithRed:1.00 green:0.93 blue:0.46 alpha:1.00];
}
@end
