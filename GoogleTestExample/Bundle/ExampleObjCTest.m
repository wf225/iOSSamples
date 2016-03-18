#import <XCTest/XCTest.h>

/**
 * Demonstrates that standard Objective-C test cases can be included alongside Google Test.
 */
@interface ExampleObjCTest : XCTestCase
@end

@implementation ExampleObjCTest

- (void)testExample {
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
	XCTAssert(YES, @"Well this is awkward.");
}

- (void)testExample2 {
    XCTAssert(YES, @"Well this is awkward 2.");
}

@end
