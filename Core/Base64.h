//
//  Base64.h
//  JukaelaCore
//
//  Created by Josh Barrow on 3/6/12.
//  Copyright (c) 2012 Jukaela Enterprises.
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

@import Foundation;

/**
 Base64 implementation
 */
@interface Base64 : NSObject

///---------------------------------------
/// @name Class Methods
///---------------------------------------

/**
 Initialization of the class
 */
+(void)initialize;

/** Encode to base64 string
 
 This method takes a const unsigned char pointer as the input. 
 
 @param input const unsigned char pointer
 @param length Length of input
 @return 'NSString' of Base64 encoded text
 */
+(NSString *)encode:(const unsigned char *)input length:(NSInteger)length;

/** Encode to base64 string
 
 This method takes NSData as the intput
 
 @param rawBytes 'NSData' input.  Usually from a webservice, or by converting an NSString to NSDate.
 @return 'NSString' of base64 encoded text
 */
+(NSString *)encode:(NSData *)rawBytes;

/** Decode base64 text to 'NSData'
 
 This method takes a const char pointer for the input string.
 
 @param string const char pointer of input string
 @param inputLength Length of 'string'
 @return 'NSData' of decoded base64 information
 */
+(NSData *)decode:(const char *)string length:(NSInteger)inputLength;

/** Decode base64 text to 'NSData'
 
 This method takes an 'NSString' as the input
 
 @param string 'NSString' of base64 data
 @return 'NSData' of decoded base64 information
 */
+(NSData *)decode:(NSString *)string;

@end
