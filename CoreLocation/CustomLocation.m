//
//  CustomLocation.m
//  CoreLocation
//
//  Created by DDC.Mac1 on 10/4/17.
//  Copyright © 2017 DDC.Mac1. All rights reserved.
//

#import "CustomLocation.h"
#import <UIKit/UIKit.h>

@implementation CustomLocation 

-(id)init:(UIViewController<CLLocationManagerDelegate>*) viewCont{
    
    self = [super init];
    if (self) {
        self.locationManager = [[CLLocationManager alloc] init];
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        // Code to check if the app can respond to the new selector found in iOS 8. If so, request it.
        if([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
            [self.locationManager requestAlwaysAuthorization];
            // Or [self.locationManager requestWhenInUseAuthorization];
        }
        [self.locationManager startUpdatingLocation];
        [self.locationManager startUpdatingHeading];
        self.locationManager.delegate = viewCont;
        self.location = [[CLLocation alloc] init];
    }
    return self;
}



@end
