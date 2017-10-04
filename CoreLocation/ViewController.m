//
//  ViewController.m
//  CoreLocation
//
//  Created by DDC.Mac1 on 10/3/17.
//  Copyright © 2017 DDC.Mac1. All rights reserved.
//

#import "ViewController.h"
#import "CustomLocation.h"

@interface ViewController ()
//AIzaSyDiBafK76n0Vl2DK-_n_zU0ZBMZOBVAaOw
@property CustomLocation *cL;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _cL = [[CustomLocation alloc] init:self];
    
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    
    _cL.location = locations.lastObject;
    self.latitude.text = [NSString stringWithFormat:@"%.04f", _cL.location.coordinate.latitude];
    self.longitude.text = [NSString stringWithFormat:@"%.04f", _cL.location.coordinate.longitude];
    self.altitude.text = [NSString stringWithFormat:@"%.04f", _cL.location.altitude];
    self.haccuracy.text = [NSString stringWithFormat:@"%.04f", _cL.location.horizontalAccuracy];
    self.vaccuracy.text = [NSString stringWithFormat:@"%.04f", _cL.location.verticalAccuracy];
    self.speed.text = [NSString stringWithFormat:@"%.04f", _cL.location.speed];
    self.course.text = [NSString stringWithFormat:@"%.04f", _cL.location.course];
    
    CLHeading *newHeading;
    
    self.magHeading.text = [NSString stringWithFormat:@"%f", newHeading.magneticHeading];
    self.trueHeading.text = [NSString stringWithFormat:@"%f", newHeading.trueHeading];
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
    //NSLog(@"Heading Update");
    double heading = newHeading.trueHeading;
    double bearing = [self calculating_bearing];

    
    self.magHeading.text = [NSString stringWithFormat:@"%f", newHeading.magneticHeading];
    self.trueHeading.text = [NSString stringWithFormat:@"%f", newHeading.trueHeading];
    double rotationInDegree = (bearing - heading);
    rotationInDegree = fmod((rotationInDegree + 360), 360);

    self.compass.transform = CGAffineTransformMakeRotation(DegreesToRadians(rotationInDegree));
}

CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;}
CGFloat RadiansToDegrees(CGFloat radians) {return radians * 180 / M_PI;}

- (int)calculating_bearing {

    float lat1 = DegreesToRadians(_cL.location.coordinate.latitude);
    float lng1 = DegreesToRadians(_cL.location.coordinate.longitude);
    float lat2 = DegreesToRadians(64.7511);
    float lng2 = DegreesToRadians(147.3494);
    float deltalng = lng2 - lng1;
    double y = sin(deltalng) * cos(lat2);
    double x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(deltalng);
    double bearing = atan2(y, x) + 2 * M_PI;
    float bearingDegrees = RadiansToDegrees(bearing);
    bearingDegrees = (int)bearingDegrees % 360;
    
    return bearingDegrees;
}

@end
