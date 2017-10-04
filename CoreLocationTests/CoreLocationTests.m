//
//  CoreLocationTests.m
//  CoreLocationTests
//
//  Created by DDC.Mac1 on 10/3/17.
//  Copyright © 2017 DDC.Mac1. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "CustomLocation.h"
#import "ViewController.h"

@interface CoreLocationTests : XCTestCase

@property CustomLocation *cL;
@property ViewController *vc;
@end

@implementation CoreLocationTests

- (void)setUp {
    [super setUp];
    _vc = [[ViewController alloc] init];
    _cL = [[CustomLocation alloc] init:_vc];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    _vc locationManager:(_cL.locationManager ) didUpdateLocations:<#(nonnull NSArray<CLLocation *> *)#>
    NSLog(@"LatTest: %f", _cL.location.coordinate.latitude);
    
    
}

-(void)testDegreesToRadians {
    
   // CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;}
   // CGFloat RadiansToDegrees(CGFloat radians) {return radians * 180 / M_PI;}
    
    
}


@end
