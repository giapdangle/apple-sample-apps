#import <UIKit/UIKit.h> // Apple
#import <XCTest/XCTest.h>

@interface iOSSamplesTests : XCTestCase

@end

@implementation iOSSamplesTests

- (void)setUp
{
  [super setUp];
}

- (void)tearDown
{
  [super tearDown];
}

- (void)testExample
{
  XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample
{
  [self measureBlock:^{
  
    // Put the code you want to measure the time of here.
  }];
}

@end
