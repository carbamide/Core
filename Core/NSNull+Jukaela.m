//
//  NSNull+Jukaela.m
//  JukaelaCore
//
//  Created by Josh on 8/31/12.
//  Copyright (c) 2013 Jukaela Enterprises.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "NSNull+Jukaela.h"

#define PrintAccessLog(selector)\
if (warnsOnNullAccess) { \
NSLog(@"Attempting to access null value from \"%@\": %@", NSStringFromSelector(selector), [NSThread callStackSymbols]); \
}

@implementation NSNull (DontCrash)

static BOOL warnsOnNullAccess = YES;

+ (void)setWarnsOnNullAccess:(BOOL)shouldWarnOnNullAccess
{
	warnsOnNullAccess = shouldWarnOnNullAccess;
}

#pragma mark -

- (BOOL)boolValue
{
	PrintAccessLog(_cmd)
    
	return NO;
}

- (char)charValue
{
	PrintAccessLog(_cmd)
    
	return '\0';
}

- (NSDecimal)decimalValue
{
	PrintAccessLog(_cmd)
    
	return [[NSDecimalNumber zero] decimalValue];
}

- (double)doubleValue
{
	PrintAccessLog(_cmd)
    
	return 0.0;
}

- (float)floatValue
{
	PrintAccessLog(_cmd)
    
	return 0.0;
}

- (int)intValue
{
	PrintAccessLog(_cmd)
    
	return 0;
}

- (NSInteger)integerValue
{
	PrintAccessLog(_cmd)
    
	return 0;
}

- (long long)longLongValue
{
	PrintAccessLog(_cmd)
    
	return 0;
}

- (long)longValue
{
	PrintAccessLog(_cmd)
    
	return 0;
}

- (short)shortValue
{
	PrintAccessLog(_cmd)
    
	return 0;
}

- (unsigned char)unsignedCharValue
{
	PrintAccessLog(_cmd)
    
	return '\0';
}

- (NSUInteger)unsignedIntegerValue
{
	PrintAccessLog(_cmd)
    
	return 0;
}

- (unsigned int)unsignedIntValue
{
	PrintAccessLog(_cmd)
    
	return 0;
}

- (unsigned long long)unsignedLongLongValue
{
	PrintAccessLog(_cmd)
    
	return 0;
}

- (unsigned long)unsignedLongValue
{
	PrintAccessLog(_cmd)
    
	return 0;
}

- (unsigned short)unsignedShortValue
{
	PrintAccessLog(_cmd)
    
	return 0;
}

- (id)valueForKey:(NSString *)key
{
	PrintAccessLog(_cmd)
    
	return nil;
}

- (id)objectAtIndex:(NSUInteger)index
{
	PrintAccessLog(_cmd)
    
	return nil;
}

- (id)objectAtIndexedSubscript:(NSUInteger)index
{
	PrintAccessLog(_cmd)
    
	return nil;
}

- (NSUInteger)count
{
	PrintAccessLog(_cmd)
    
	return 0;
}

- (id)objectForKey:(id)key
{
	PrintAccessLog(_cmd)
    
	return nil;
}

- (id)objectForKeyedSubscript:(id)key
{
	PrintAccessLog(_cmd)
    
	return nil;
}

- (NSUInteger)length
{
	PrintAccessLog(_cmd)
    
	return 0;
}

@end
