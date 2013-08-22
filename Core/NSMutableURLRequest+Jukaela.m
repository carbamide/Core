//
//  NSMutableURLRequest+Jukaela.m
//  Core
//
//  Created by Josh on 8/21/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
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
