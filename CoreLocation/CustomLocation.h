//
//  CustomLocation.h
//  CoreLocation
//
//  Created by DDC.Mac1 on 10/4/17.
//  Copyright © 2017 DDC.Mac1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@interface CustomLocation : NSObject <CLLocationManagerDelegate>

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *location;
-(id)init:(UIViewController<CLLocationManagerDelegate>*) viewCont;
@end
