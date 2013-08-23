//
//  NSMutableURLRequest+Jukaela.m
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

static NSString *const kGetHttpRequest = @"GET";
static NSString *const kPostHttpRequest = @"POST";
static NSString *const kJsonContentType = @"application/json";
static NSString *const kAccept = @"accept";
static NSString *const kContentType = @"content-type";

@implementation NSMutableURLRequest (Jukaela)

+(NSMutableURLRequest *)getRequestWithURL:(NSURL *)url timeout:(NSInteger)timeoutInterval
{
    if (!url) {
        return nil;
    }
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [request setHTTPMethod:kGetHttpRequest];
    [request setValue:kJsonContentType forHTTPHeaderField:kContentType];
    [request setValue:kJsonContentType forHTTPHeaderField:kAccept];
    [request setTimeoutInterval:timeoutInterval];
    
    return request;
}

+(NSMutableURLRequest *)postRequestWithURL:(NSURL *)url withData:(NSData *)data timeout:(NSInteger)timeoutInterval
{
    if (!url) {
        return nil;
    }
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    [request setHTTPMethod:kPostHttpRequest];
    [request setHTTPBody:data];
    [request setValue:kJsonContentType forHTTPHeaderField:kContentType];
    [request setValue:kJsonContentType forHTTPHeaderField:kAccept];
    [request setTimeoutInterval:timeoutInterval];
    
    return request;
}

@end
