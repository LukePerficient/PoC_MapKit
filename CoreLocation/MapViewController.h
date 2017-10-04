//
//  MapViewController.h
//  CoreLocation
//
//  Created by DDC.Mac1 on 10/3/17.
//  Copyright © 2017 DDC.Mac1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController <CLLocationManagerDelegate>
{
    IBOutlet UIView *mapSub;
}
//@property (strong, nonatomic) CLLocationManager *locationManager;
//@property (strong, nonatomic) CLLocation *location;


@end
