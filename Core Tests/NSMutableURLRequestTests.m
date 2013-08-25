//
//  NSMutableURLRequestTests.m
//  JukaelaCore
//
//  Created by Josh on 8/25/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSMutableURLRequest+Jukaela.h"

@interface NSMutableURLRequestTests : XCTestCase

@end

@implementation NSMutableURLRequestTests

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

-(void)testNotNilStatusOfPOSTNSMutableURLRequest
{
    NSURL *appleURL = [NSURL URLWithString:@"http://www.apple.com/"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest postRequestWithURL:appleURL withData:[NSData dataWithBytesNoCopy:nil length:100] timeout:60];
    
    XCTAssertNotNil(request, @"Could not create POST NSMutableURLRequest");
}

-(void)testNotNilStatusOfGETNSMutableURLRequest
{
    NSURL *appleURL = [NSURL URLWithString:@"http://www.apple.com/"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest getRequestWithURL:appleURL timeout:60];
    
    XCTAssertNotNil(request, @"Could not create GET NSMutableURLRequest");
}

@end
