//
//  NSMutableDictionary+validateParameterforDB.h
//  Tab4Checker
//
//  Created by Alessio on 01/03/18.
//  Copyright © 2018 Mitric Srl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (validateParameterforDB)
- (void)checkKeyinTable:(nonnull NSArray*)table setObject:(nonnull id)object forKey:(nonnull id)key;
@end
