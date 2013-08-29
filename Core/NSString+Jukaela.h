//
//  NSString+Jukaela.h
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

@import Foundation;

/**
 NSString helper methods.
 */
@interface NSString (Jukaela)

///---------------------------------------
/// @name Class Methods
///---------------------------------------

/** The home folder for the current application on iOS, or the user's home folder on Macintosh.
 @return 'NSString' of the path of the home folder.
 */
+(NSString *)documentsPath;

/** The app's support folder
 @return 'NSString' of the path of the support folder.
 */
+(NSString *)applicationSupportPath;

/** Is the string nil or empty?
 @param string The 'NSString' to check
 @return true if the 'NSString' is nil or empty, false if it is not.
 */
+(BOOL)isNilOrEmpty:(NSString *)string;

///---------------------------------------
/// @name Instance Methods
///---------------------------------------

/** Read string and escape any characters that might throw issues
 @return 'NSString' that has been escaped.
 */
-(NSString *)stringWithSlashEscapes;

/** Check to see if the string contains the string that the user passed.
 @param string The string to search the current string for
 @return 'BOOL' true if the string contains the substring.
 */
-(BOOL)contains:(NSString *)string;
@end
