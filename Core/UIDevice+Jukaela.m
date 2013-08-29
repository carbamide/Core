//
//  UIDevice+Jukaela.m
//  JukaelaCore
//
//  Created by Josh on 8/27/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
//

@import Darwin.sys.mount;

#import "UIDevice+Jukaela.h"

@implementation UIDevice (Jukaela)

+(BOOL)isDeviceiPad
{
    return ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad);
}

+(BOOL)isDeviceiPhone
{
    return ([[[UIDevice currentDevice] model] compare:@"iPhone"] == 0) ? YES : NO;
}

+(BOOL)isDeviceRetina
{
    static BOOL isHiRes = false;
    
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        isHiRes = ([[[UIDevice currentDevice] systemVersion] intValue] >= 4 && [[UIScreen mainScreen] scale] == 2.0);
    });
    
    return isHiRes;
}

+(float)getFreeSpace
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    struct statfs tStats;
    
    statfs([[paths lastObject] cString], &tStats);
    
    return (float)(tStats.f_blocks * tStats.f_bsize);
}
@end
