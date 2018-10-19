//
//  NSDate+Random.m
//  ASDemo
//
//  Created by Alessio Sardella on 08/09/18.
//  Copyright © 2018 Alessio Sardella. All rights reserved.
//

#import "NSDate+Random.h"

@implementation NSDate (Random)
+ (NSDate *) generateRandom{
    
    int r1 = arc4random_uniform(27);
    int r2 = arc4random_uniform(11);
    int r3 = 18 + arc4random() % (70 - 18);;
    
    NSDate *today = [NSDate new];
    NSCalendar *gregorian =
    [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *offsetComponents = [NSDateComponents new];
    [offsetComponents setDay:r1];
    [offsetComponents setMonth:r2];
    [offsetComponents setYear:-r3];
    
    NSDate *rndDate1 = [gregorian dateByAddingComponents:offsetComponents
                                                  toDate:today options:0];

    return rndDate1;
}
@end
