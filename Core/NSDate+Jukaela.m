//
//  NSDate+Jukaela.h
//  JukaelaCore
//
//  Created by Josh Barrow on 5/6/12.
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

#import "NSDate+Jukaela.h"

@implementation NSDate (Jukaela)

+ (NSDate *)dateWithISO8601String:(NSString *)dateString withFormatter:(NSDateFormatter *)formatter
{
    if (!dateString) {
        return nil;
    }
    
    if ([dateString hasSuffix:@"Z"]) {
        dateString = [[dateString substringToIndex:(dateString.length-1)] stringByAppendingString:@"-0000"];
    }
    
    return [self dateFromString:dateString withFormat:@"yyyy-MM-dd'T'HH:mm:ssZ" withFormatter:formatter];
}

+ (NSDate *)dateFromString:(NSString *)dateString withFormat:(NSString *)dateFormat withFormatter:(NSDateFormatter *)formatter
{    
    [formatter setDateFormat:dateFormat];
        
    NSDate *date = [formatter dateFromString:dateString];
    
    return date;
}

+ (int)daysBetweenDate:(NSDate *)dateOne andDate:(NSDate *)dateTwo options:(NSCalendarOptions)options
{
    NSUInteger unitFlags = NSDayCalendarUnit;
    
    NSDateComponents *components = [[NSCalendar currentCalendar] components:unitFlags fromDate:dateOne toDate:dateTwo options:options];
    
    return [components day]+1;
}

@end
