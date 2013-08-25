//
//  NSArrayTests.m
//  JukaelaCore
//
//  Created by Josh on 8/25/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSArray+Jukaela.h"

@interface NSArrayTests : XCTestCase

@end

@implementation NSArrayTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

-(void)testNotNilStatusOfArrayOfURLs
{
    NSString *stringThatContainsUrls = @"This is a string http://www.apple.com that contains one url";
    
    NSArray *testArray = [NSArray arrayOfURLsFromString:stringThatContainsUrls error:nil];
    
    XCTAssertNotNil(testArray, @"The returned array of URLs is nil");
}

-(void)testNumberOfURLsInArrayOfURLs
{
    NSString *stringThatContainsUrls = @"This is a string http://www.apple.com http://www.jukaela.com that contains one url";
    
    NSArray *testArray = [NSArray arrayOfURLsFromString:stringThatContainsUrls error:nil];
    
    XCTAssert([testArray count] == 2, @"The number of URLs in the testArray is incorrect.");
}

-(void)testNotNilStatusOfSplitString
{
    NSString *stringThatIsLong = @"This is a really long string, yes it is.  It is a really strong string, yes it is.  This is a really long string, yes it is.";
    
    NSArray *testArray = [NSArray splitString:stringThatIsLong maxCharacters:15];
    
    XCTAssertNotNil(testArray, @"The returned array of the split string is nil");
}

-(void)testEachSegmentOfSplitStringIsNotLongerThanMaxCharacters
{
    NSString *stringThatIsLong = @"t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).";
    
    NSInteger maxCount = 160;
    
    NSArray *testArray = [NSArray splitString:stringThatIsLong maxCharacters:maxCount];
    
    for (NSString *tempString in testArray) {
        NSLog(@"Current line length is - %li\n", (unsigned long)[tempString length]);
        
        XCTAssert([tempString length] <= maxCount, @"The strings inside the NSArray of split strings is too long.");
    }
}

@end
