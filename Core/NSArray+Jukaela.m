//
//  NSArray+Jukaela.m
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

#import "NSArray+Jukaela.h"
#import "NSString+Jukaela.h"

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

+(NSArray *)availableFilesForFileType:(NSArray *)fileTypes
{
	NSMutableArray *tempArray = [[NSMutableArray alloc] init];
	
	NSString *documentsDirectoryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
	
	NSArray *documentsDirectoryContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:[NSString documentsPath] error:NULL];
	
    for (NSString *curFileName in [documentsDirectoryContents objectEnumerator]) {
        NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:curFileName];
        
        if (!([curFileName isEqualToString:@"Inbox"])) {
            for (NSString *tempPathComponentString in fileTypes) {
                if ([[curFileName lastPathComponent] rangeOfString:tempPathComponentString options:NSCaseInsensitiveSearch].location != NSNotFound) {
                    [tempArray addObject:filePath];
                }
            }
			
			BOOL isDirectory = NO;
			
			[[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory];
			
			if (isDirectory) {
				[tempArray addObject:filePath];
			}
        }
	}
    
    return tempArray;
}


@end
