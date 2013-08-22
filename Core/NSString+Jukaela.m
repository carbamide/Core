//
//  NSString+Jukaela.m
//  Core
//
//  Created by Josh on 8/21/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
//

#import "NSString+Jukaela.h"

@implementation NSString (Jukaela)

+(NSString *)documentsPath
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

@end
