//
//  NSArray+Jukaela.h
//  Core
//
//  Created by Josh on 8/21/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
//

/**
 NSArray helper methods that may be useful in social networking applications.
 */
@interface NSArray (Jukaela)

///---------------------------------------
/// @name Class Methods
///---------------------------------------

/** Creates and 'NSArray' of URLs as 'NSString's.  
 
 This method is good for checking a given 'NSString' for URLs.  This is quite useful in social networking circumstances.
 
 @param stringToCheck The 'NSString' to check for URLs
 @param error 'NSError' that will be populated by any errors.
 @return 'NSArray' of URLs as 'NSString's
 */
+(NSArray *)arrayOfURLsFromString:(NSString *)stringToCheck error:(NSError *)error;

/** Splits a given 'NSString' into multiple parts, no greater in length than 'maxLength'
 
 This method is useful in circumstances where a long string, such as one being posted to a social network that restricts character count, needs to be split into multiple strings.
 
 @param stringToSplit The 'NSString' that needs to be split into parts
 @param maxLength 'NSInteger' that specifies that maximum length that each 'NSString' the returned 'NSArray' can be
 @return 'NSArray' of 'NSString's that are no greater than 'maxLength'
 */
+(NSArray *)splitString:(NSString *)stringToSplit maxCharacters:(NSInteger)maxLength;

@end
