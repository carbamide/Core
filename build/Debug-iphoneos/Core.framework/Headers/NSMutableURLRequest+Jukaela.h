//
//  NSMutableURLRequest+Jukaela.h
//  Core
//
//  Created by Josh on 8/21/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
//

/**
 NSMutableURLRequest helper methods.  These methods make it easy to form POST and GET requests.
 */

@interface NSMutableURLRequest (Jukaela)

///---------------------------------------
/// @name Class Methods
///---------------------------------------

/** Creates GET request
 
 The method will return nil if the 'NSURL' passed is nil
 
 @param url The 'NSURL' to from the request to
 @param timeoutInterval The 'NSInteger' time, in whole seconds, to wait until failing the connection
 @return 'NSMutableURLRequest'
 */
+(NSMutableURLRequest *)getRequestWithURL:(NSURL *)url timeout:(NSInteger)timeoutInterval;

/** Creates POST request
 
 The method will return nil if the 'NSURL' passed is nil
 
 @param url The 'NSURL' to from the request to
 @param data 'NSData' to pass in the POST request
 @param timeoutInterval The 'NSInteger' time, in whole seconds, to wait until failing the connection
 @return 'NSMutableURLRequest'
 */
+(NSMutableURLRequest *)postRequestWithURL:(NSURL *)url withData:(NSData *)data timeout:(NSInteger)timeoutInterval;

@end
