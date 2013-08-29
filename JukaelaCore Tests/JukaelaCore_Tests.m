//
//  JukaelaCore_Tests.m
//  JukaelaCore Tests
//
//  Created by Josh on 8/25/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
//

@import XCTest;

#import "NSMutableURLRequest+Jukaela.h"
#import "NSArray+Jukaela.h"
#import "NSString+Jukaela.h"
#import "Base64.h"
#import "NSDate+Jukaela.h"
#import "NSNull+Jukaela.h"
#import "NSUserDefaults+Jukeala.h"
#import "UIColor+Jukaela.h"

@interface JukaelaCore_Tests : XCTestCase

@end

@implementation JukaelaCore_Tests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

#pragma mark -
#pragma mark NSMutableURLRequest Tests
-(void)testNSMutableURLRequestPOSTNotNil
{
    NSURL *appleURL = [NSURL URLWithString:@"http://www.apple.com/"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest postRequestWithURL:appleURL withData:[NSData dataWithBytesNoCopy:nil length:100] timeout:60];
    
    XCTAssertNotNil(request, @"Could not create POST NSMutableURLRequest");
}

-(void)testNSMutableURLRequestGETNotNil
{
    NSURL *appleURL = [NSURL URLWithString:@"http://www.apple.com/"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest getRequestWithURL:appleURL timeout:60];
    
    XCTAssertNotNil(request, @"Could not create GET NSMutableURLRequest");
}

#pragma mark -
#pragma mark NSString Tests
-(void)testNSStringDocumentsPathExists
{
    NSString *homeFolder = [NSString documentsPath];
    
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:homeFolder], @"The folder being returned is not an actual on the local drive");
}

-(void)testNSStringDocumentPathNotNil
{
    NSString *homefolder = [NSString documentsPath];
    
    XCTAssertNotNil(homefolder, @"The returned NSString is nil");
}

-(void)testNSStringStringWithSlashEscapesNotNil
{
    NSString *testString = @"\\";
    
    XCTAssertNotNil(testString, @"The returns NSString is nil");
}

-(void)testEmptyNSStringIsNilOrEmpty_Empty_IsCorrect
{
    NSString *testString = @"";
    
    XCTAssert([NSString isNilOrEmpty:testString], @"The NSString is nil or empty");
}

-(void)testEmptyNSStringIsNilOrEmpty_Nil_IsCorrect
{
    NSString *testString = nil;
    
    XCTAssert([NSString isNilOrEmpty:testString], @"The NSString is nil or empty");
}

-(void)testNSStringContainsNotNil
{
    NSString *testString = @"This is a test string";
    
    XCTAssertNotNil(testString, @"The return NSString is nil");
}

-(void)testNSStringContainsIsCorrect
{
    NSString *testString = @"This is a test string";
    
    XCTAssert([testString contains:@"test"], @"The return NSString is not correct");
}

#pragma mark -
#pragma mark NSArray Tests
-(void)testNSArrayArrayOfURLsNotNil
{
    NSString *stringThatContainsUrls = @"This is a string http://www.apple.com that contains one url";
    
    NSArray *testArray = [NSArray arrayOfURLsFromString:stringThatContainsUrls error:nil];
    
    XCTAssertNotNil(testArray, @"The returned array of URLs is nil");
}

-(void)testNSArrayArrayOfURLsCount
{
    NSString *stringThatContainsUrls = @"This is a string http://www.apple.com http://www.jukaela.com that contains one url";
    
    NSArray *testArray = [NSArray arrayOfURLsFromString:stringThatContainsUrls error:nil];
    
    XCTAssert([testArray count] == 2, @"The number of URLs in the testArray is incorrect.");
}

-(void)testNSArraySplitStringNotNil
{
    NSString *stringThatIsLong = @"This is a really long string, yes it is.  It is a really strong string, yes it is.  This is a really long string, yes it is.";
    
    NSArray *testArray = [NSArray splitString:stringThatIsLong maxCharacters:15];
    
    XCTAssertNotNil(testArray, @"The returned array of the split string is nil");
}

-(void)testNSArraySplitStringLength
{
    NSString *stringThatIsLong = @"t is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).";
    
    NSInteger maxCount = 160;
    
    NSArray *testArray = [NSArray splitString:stringThatIsLong maxCharacters:maxCount];
    
    for (NSString *tempString in testArray) {
        NSLog(@"Current line length is - %li\n", (unsigned long)[tempString length]);
        
        XCTAssert([tempString length] <= maxCount, @"The strings inside the NSArray of split strings is too long.");
    }
}

#pragma mark -
#pragma mark Base64 Tests

-(void)testBase64EncodeFromNSDataNotNil
{
    NSData *data = [@"This is a test." dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *testString = [Base64 encode:data];
    
    XCTAssertNotNil(testString, @"The base64 result when encoding from NSData is nil");
}

-(void)testBase64DecodeToNSString
{
    NSString *base64String = @"VGhpcyBpcyBhIHRlc3Qu";
    
    NSData *base64Data = [Base64 decode:base64String];
    
    XCTAssertNotNil(base64Data, @"The base 64 result when decoding from NSString is nil");
}

-(void)testBase64EncodeFromNSDataCorrectValue
{
    NSData *data = [@"This is a test." dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *testString = [Base64 encode:data];
    
    XCTAssert([testString isEqualToString:@"VGhpcyBpcyBhIHRlc3Qu"], @"The base 64 result is incorrect");
}

-(void)testBase64DecodeFromNSStringCorrectValue
{
    NSString *base64String = @"VGhpcyBpcyBhIHRlc3Qu";
    
    NSData *base64Data = [Base64 decode:base64String];

    NSString *finalString = [[NSString alloc] initWithData:base64Data encoding:NSUTF8StringEncoding];
    
    XCTAssert([finalString isEqualToString:@"This is a test."], @"The base 64 result is incorrect.");
}

#pragma mark -
#pragma mark NSDate Tests

-(void)testNSDateWithISO8601StringNotNil
{
    NSDate *testDate = [NSDate dateWithISO8601String:@"1994-11-05T13:15:30Z" withFormatter:[[NSDateFormatter alloc] init]];
    
    XCTAssertNotNil(testDate, @"The returned NSDate from ISO8601 string is nil");
}

-(void)testNSDateFromStringNotNil
{
    NSDate *testDate = [NSDate dateFromString:@"2008-08-18T14:32:22.1875000+01:00" withFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZZZZ" withFormatter:[[NSDateFormatter alloc] init]];
    
    XCTAssertNotNil(testDate, @"The returned NSDate from string is nil");
}

-(void)testNSDateDaysBetweenDatesIsCorrect
{
    NSDate *today = [NSDate date];
    NSDate *yesterday = [today dateByAddingTimeInterval: -86300];
    
    int daysBetween = [NSDate daysBetweenDate:yesterday andDate:today options:0];
    
    XCTAssert(daysBetween == 1, @"The returns time spam from NSDate is incorrect.");
}

#pragma mark -
#pragma mark NSNull Tests

-(void)testNSNullBoolValueIsCorrect
{
    BOOL boolValue = [[NSNull null] boolValue];
    
    XCTAssert(boolValue == false, @"The boolValue is not false");
}

-(void)testNSNullCharValueIsCorrect
{
    char value = [[NSNull null] charValue];
    
    XCTAssert(value == '\0', @"The charValue is not correct");
}

-(void)testNSNullDoubleValueIsCorrect
{
    double value = [[NSNull null] doubleValue];
    
    XCTAssert(value == 0.0, @"The doubleValue is not correct.");
}

-(void)testNSNullFloatValueIsCorrect
{
    float value = [[NSNull null] floatValue];
    
    XCTAssert(value == 0.0, @"The floatValue is not correct.");
}

-(void)testNSNullIntValueIsCorrect
{
    int value = [[NSNull null] intValue];
    
    XCTAssert(value == 0, @"The intValue is not correct.");
}

-(void)testNSNullIntegerValueIsCorrect
{
    NSInteger value = [[NSNull null] integerValue];
    
    XCTAssert(value == 0, @"The integerValue is not correct.");
}

-(void)testNSNullLongLongValueIsCorrect
{
    long long value = [[NSNull null] longLongValue];
    
    XCTAssert(value == 0, @"The longLongValue is not correct.");
}

-(void)testNSNullLongValueIsCorrect
{
    long value = [[NSNull null] longValue];
    
    XCTAssert(value == 0, @"The longValue is not correct.");
}

-(void)testNSNullShortValueIsCorrect
{
    short value = [[NSNull null] shortValue];
    
    XCTAssert(value == 0, @"The shortValue is not correct.");
}

-(void)testNSNullUnsignedCharValueIsCorrect
{
    unsigned char value = [[NSNull null] unsignedCharValue];
    
    XCTAssert(value == '\0', @"The unsignedChar is not correct");
}

-(void)testNSNullUnsignedIntegerValueIsCorrect
{
    NSUInteger value = [[NSNull null] unsignedIntegerValue];
    
    XCTAssert(value == 0, @"The unsignedIntegerValue is not correct.");
}

-(void)testNSNullUnsignedIntValueIsCorrect
{
    unsigned int value = [[NSNull null] unsignedIntValue];
    
    XCTAssert(value == 0, @"The unsignedIntValue is not correct.");
}

-(void)testNSNullUnsignedLongLongValueIsCorrect
{
    unsigned long long value = [[NSNull null] unsignedLongLongValue];
    
    XCTAssert(value == 0, @"The unsignedLongLongValue is not correct.");
}

-(void)testNSNullUnsignedLongValueIsCorrect
{
    unsigned long value = [[NSNull null] unsignedLongValue];
    
    XCTAssert(value == 0, @"The unsignedLongValue is not correct.");
}

-(void)testNSNullUnsignedShortValueIsCorrect
{
    unsigned short value = [[NSNull null] unsignedShortValue];
    
    XCTAssert(value == 0, @"The unsignedShortValue is not correct.");
}

-(void)testNSNullValueForKeyIsCorrect
{
    id value = [[NSNull null] valueForKey:@"testKey"];
    
    XCTAssertNil(value, @"The valueForKey is not nil");
}

-(void)testNSNullObjectAtIndexIsCorrect
{
    id value = [[NSNull null] objectAtIndex:0];
    
    XCTAssertNil(value, @"The objectAtIndex is not nil");
}

-(void)testNSNullObjectAtIndexedSubscriptIsCorrect
{
    id value = [NSNull null][0];
    
    XCTAssertNil(value, @"The objectAtIndexedSubscript is not nil");
}

-(void)testNSNullCountIsCorrect
{
    NSUInteger value = [[NSNull null] count];
    
    XCTAssert(value == 0, @"The count is incorrect");
}

-(void)testNSNullObjectForKeyIsCorrect
{
    id value = [[NSNull null] objectForKey:@"testKey"];
    
    XCTAssertNil(value, @"The objecdtForKey is not nil");
}

-(void)testNSNullObjectForKeyedSubscriptIsCorrect
{
    id value = [NSNull null][@"testKey"];
    
    XCTAssertNil(value, @"The objectForKeyedSubscript is not nil");
}

-(void)testNSNullLengthIsCorrect
{
    NSUInteger value = [[NSNull null] length];
    
    XCTAssert(value == 0, @"The length is incorrect");
}

#pragma mark -
#pragma mark NSUserDefaults Tests

-(void)testNSUserDefaultsSaveObjectForKey
{
    [NSUserDefaults saveObject:[NSNumber numberWithBool:YES] forKey:@"test"];
    
    XCTAssert([[NSUserDefaults standardUserDefaults] boolForKey:@"test"] == YES, @"The NSNumber object was not saved correctly.");
}

-(void)testNSUserDefaultsDeleteObjectForKey
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"test"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [NSUserDefaults deleteObjectForKey:@"test"];
    
    NSNumber *testNumber = [[NSUserDefaults standardUserDefaults] objectForKey:@"test"];
    
    XCTAssertNil(testNumber, @"The returned number should be nil");
}


#pragma mark -
#pragma mark UIColor Tests

-(void)testUIColorColorWithHexNotNil
{
    UIColor *testColor = [UIColor colorWithHex:0xdeadbeef];
    
    XCTAssertNotNil(testColor, @"The UIColor should not be nil");
}

@end
