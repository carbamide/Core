//
//  NSUserDefaults+Jukeala.m
//  JukaelaCore
//
//  Created by Josh on 8/26/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
//

#import "NSUserDefaults+Jukeala.h"

@implementation NSUserDefaults (Jukeala)

+(void)saveObject:(id)object forKey:(NSString *)key
{
    [[self standardUserDefaults] setObject:object forKey:key];
    [[self standardUserDefaults] synchronize];
}

+(void)deleteObjectForKey:(NSString *)key
{
    [[self standardUserDefaults] removeObjectForKey:key];
    [[self standardUserDefaults] synchronize];
}

@end
