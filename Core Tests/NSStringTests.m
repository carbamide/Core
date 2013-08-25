//
//  NSStringTests.m
//  JukaelaCore
//
//  Created by Josh on 8/25/13.
//  Copyright (c) 2013 Jukaela Enterprises. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+Jukaela.h"

@interface NSStringTests : XCTestCase

@end

@implementation NSStringTests

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

-(void)testAValidFolderIsBeingReturnedForTheDocumentsDirectory
{
    NSString *homeFolder = [NSString documentsPath];
    
    XCTAssertTrue([[NSFileManager defaultManager] fileExistsAtPath:homeFolder], @"The folder being returned is not an actual on the local drive");
}

-(void)testNotNilStatusOfDocumentsPath
{
    NSString *homefolder = [NSString documentsPath];
    
    XCTAssertNotNil(homefolder, @"The returned NSString is nil");
}

@end
