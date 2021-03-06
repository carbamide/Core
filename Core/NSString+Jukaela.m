//
//  NSString+Jukaela.m
//  JukaelaCore
//
//  Created by Josh on 8/21/13.
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

#import "NSString+Jukaela.h"

@implementation NSString (Jukaela)

+(NSString *)documentsPath
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

+(NSString *)applicationSupportPath
{
    NSArray *tempArray = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    
    NSString *documentsDirectory = tempArray[0];
    
    return documentsDirectory;
}

+(BOOL)isNilOrEmpty:(NSString *)string
{
    if (!string) {
        return true;
    }
    
    if ([string length] == 0) {
        return true;
    }
    
    return false;
}

-(NSString *)stringWithSlashEscapes
{
    NSString *escapedString = nil;
    
    escapedString = [self stringByReplacingOccurrencesOfString:@"\\" withString:@"\\\\"];
    escapedString = [escapedString stringByReplacingOccurrencesOfString:@"+" withString:@"\\+"];
    escapedString = [escapedString stringByReplacingOccurrencesOfString:@"-" withString:@"\\-"];
    escapedString = [escapedString stringByReplacingOccurrencesOfString:@"&" withString:@"\\&"];
    escapedString = [escapedString stringByReplacingOccurrencesOfString:@"!" withString:@"\\!"];
    escapedString = [escapedString stringByReplacingOccurrencesOfString:@"(" withString:@"\\("];
    escapedString = [escapedString stringByReplacingOccurrencesOfString:@")" withString:@"\\)"];
    escapedString = [escapedString stringByReplacingOccurrencesOfString:@"{" withString:@"\\{"];
    escapedString = [escapedString stringByReplacingOccurrencesOfString:@"}" withString:@"\\}"];
    escapedString = [escapedString stringByReplacingOccurrencesOfString:@"[" withString:@"\\["];
    escapedString = [escapedString stringByReplacingOccurrencesOfString:@"]" withString:@"\\]"];
    escapedString = [escapedString stringByReplacingOccurrencesOfString:@"^" withString:@"\\^"];
    escapedString = [escapedString stringByReplacingOccurrencesOfString:@"~" withString:@"\\~"];
    escapedString = [escapedString stringByReplacingOccurrencesOfString:@"*" withString:@"\\*"];
    escapedString = [escapedString stringByReplacingOccurrencesOfString:@"?" withString:@"\\?"];
    escapedString = [escapedString stringByReplacingOccurrencesOfString:@":" withString:@"\\:"];
    escapedString = [escapedString stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    
    return escapedString;
}

-(BOOL)contains:(NSString *)string
{
    NSRange range = [self rangeOfString:string];
    
    return (range.location != NSNotFound);
}

@end
