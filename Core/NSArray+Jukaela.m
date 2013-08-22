//
//  NSArray+Jukaela.m
//  Core
//
//  Created by Josh on 8/21/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
//

#import "NSArray+Jukaela.h"

static NSString *const kRegularExpression = @"http?://([-\\w\\.]+)+(:\\d+)?(/([\\w/_\\.]*(\\?\\S+)?)?)?";

@implementation NSArray (Jukaela)

+(NSArray *)arrayOfURLsFromString:(NSString *)stringToCheck error:(NSError *)error
{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:kRegularExpression options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSArray *arrayOfAllMatches = [regex matchesInString:stringToCheck options:0 range:NSMakeRange(0, [stringToCheck length])];
    
    NSMutableArray *arrayOfURLs = [[NSMutableArray alloc] init];
    
    for (NSTextCheckingResult *match in arrayOfAllMatches) {
        NSString *substringForMatch = [stringToCheck substringWithRange:match.range];
        
        [arrayOfURLs addObject:substringForMatch];
    }

    return [NSArray arrayWithArray:arrayOfURLs];
}

+(NSArray *)splitString:(NSString *)stringToSplit maxCharacters:(NSInteger)maxLength
{
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:1];
    
    NSArray *wordArray = [stringToSplit componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    NSInteger numberOfWords = [wordArray count];
    NSInteger index = 0;
    NSInteger lengthOfNextWord = 0;
    
	while (index < numberOfWords) {
		NSMutableString *line = [NSMutableString stringWithCapacity:1];
        
		while ((([line length] + lengthOfNextWord + 5) <= maxLength) && (index < numberOfWords)) {
	        lengthOfNextWord = [[wordArray objectAtIndex:index] length];
            
	        [line appendString:[wordArray objectAtIndex:index]];
            
	        index++;
            
            if (index < numberOfWords) {
                [line appendString:@" "];
            }
	    }
        
		[tempArray addObject:line];
	}
    
    return tempArray;
}

@end
