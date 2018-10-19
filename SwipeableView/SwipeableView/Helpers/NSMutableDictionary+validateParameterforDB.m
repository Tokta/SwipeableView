//
//  NSMutableDictionary+validateParameterforDB.m
//  Tab4Checker
//
//  Created by Alessio on 01/03/18.
//  Copyright © 2018 Mitric Srl. All rights reserved.
//

#import "NSMutableDictionary+validateParameterforDB.h"

@implementation NSMutableDictionary (validateParameterforDB)
- (void)checkKeyinTable:(NSArray*)table setObject:(nonnull id)object forKey:(nonnull id)key{
    
    if ([table containsObject:key]) {
        [self setObject:object forKey:key];
    }else{
//         DLog(@"KEY %@ NOT FOUND\nThis is not a problem, is just a message to inform you that this key do not exist inside the current table.",key);
    }

}
@end
