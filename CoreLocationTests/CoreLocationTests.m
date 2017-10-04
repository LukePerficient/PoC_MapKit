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
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testWithInitializedData {
    _vc = [[ViewController alloc] init];
    _cL = [[CustomLocation alloc] init:_vc];
    
    NSLog(@"Lat: %f", _cL.location.coordinate.latitude);
    NSLog(@"Long: %f", _cL.location.coordinate.longitude);
    NSLog(@"Altitude: %f", _cL.location.altitude);
    
    NSLog(@"HorAcc: %f", _cL.location.horizontalAccuracy);
    NSLog(@"VertAcc: %f", _cL.location.verticalAccuracy);
    NSLog(@"Speed: %f", _cL.location.speed);
    NSLog(@"Course: %f", _cL.location.course);
    
    XCTAssertEqual(_cL.location.coordinate.latitude, 0.000000);
    XCTAssertEqual(_cL.location.coordinate.longitude, 0.000000);
    XCTAssertEqual(_cL.location.altitude, 0.000000);
    XCTAssertEqual(_cL.location.horizontalAccuracy, 0.000000);
    XCTAssertEqual(_cL.location.verticalAccuracy, -1.000000);
    XCTAssertEqual(_cL.location.speed, -1.000000);
    XCTAssertEqual(_cL.location.course, -1.000000);
}

- (void)testCalculateBearingDegrees {
    _vc = [[ViewController alloc] init];
    _cL = [[CustomLocation alloc] init:_vc];
    
    double expectedBearing = 14.000000;
    double actualBearing = [_vc calculating_bearing];
    
    XCTAssert(expectedBearing == actualBearing);
}

/*
- (void)testWithCustomData {
    
}

-(void)testDegreesToRadians {
    
   // CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;}
   // CGFloat RadiansToDegrees(CGFloat radians) {return radians * 180 / M_PI;}
    
    
}
*/

@end
