//
//  ViewController.h
//  CoreLocation
//
//  Created by DDC.Mac1 on 10/3/17.
//  Copyright © 2017 DDC.Mac1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *latitude;
@property (weak, nonatomic) IBOutlet UILabel *longitude;
@property (weak, nonatomic) IBOutlet UILabel *altitude;
@property (weak, nonatomic) IBOutlet UILabel *speed;
//@property (strong, nonatomic) CLLocationManager *locationManager;
//@property (strong, nonatomic) CLLocation *location;
@property (weak, nonatomic) IBOutlet UILabel *haccuracy;
@property (weak, nonatomic) IBOutlet UILabel *vaccuracy;
@property (weak, nonatomic) IBOutlet UILabel *course;
@property (weak, nonatomic) IBOutlet UILabel *magHeading;
@property (weak, nonatomic) IBOutlet UILabel *trueHeading;
@property (weak, nonatomic) IBOutlet UIImageView *compass;

- (int)calculating_bearing;

@end




