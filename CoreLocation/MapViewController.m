//
//  MapViewController.m
//  CoreLocation
//
//  Created by DDC.Mac1 on 10/3/17.
//  Copyright © 2017 DDC.Mac1. All rights reserved.
//

#import "MapViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "CustomLocation.h"

@interface MapViewController ()
@property (weak, nonatomic) IBOutlet UILabel *perficientDistanceText;

@property CustomLocation *cL;
@end

@implementation MapViewController

GMSMapView *googleMapView;

- (void)viewDidLoad {
    [super viewDidLoad];
   /* self.locationManager = [[CLLocationManager alloc] init];
    
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    // Code to check if the app can respond to the new selector found in iOS 8. If so, request it.
    if([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [self.locationManager requestAlwaysAuthorization];
        // Or [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    [self.locationManager startUpdatingHeading];
    self.locationManager.delegate = self;
    self.location = [[CLLocation alloc] init];
*/
    
    _cL = [[CustomLocation alloc] init:self];
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
                                                            longitude:151.20
                                                                 zoom:6];
    googleMapView = [GMSMapView mapWithFrame:mapSub.bounds camera:camera];
    
    googleMapView.camera = [GMSCameraPosition cameraWithTarget:_cL.location.coordinate
                                                          zoom:14];
    googleMapView.myLocationEnabled = YES;
    googleMapView.settings.myLocationButton = YES;
    googleMapView.settings.compassButton = YES;
    //Add map to subview
    [mapSub addSubview:googleMapView];
    
/*    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(LatX, LongY);
    //marker.title = @"Sydney";
    marker.snippet = [NSString stringWithFormat:@"Lat: %f, Long:%f",LatX, LongY];
    marker.map = googleMapView;
*/
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    _cL.location = locations.lastObject;
    float LatX =_cL.location.coordinate.latitude;
    float LongY = _cL.location.coordinate.longitude;
    float perfLat = 30.224760;
    float perfLong = -92.019114;
    
    googleMapView.camera = [GMSCameraPosition cameraWithLatitude:(LatX)
                                                       longitude:(LongY)
                                                          zoom:14];
    

    
    //NSLog(@"LocationDid Update Lat:%f", self.location.coordinate.latitude);
    //NSLog(@"LocationDid Update Long:%f", self.location.coordinate.longitude);
    
    CLLocation *locA = [[CLLocation alloc] initWithLatitude:perfLat longitude:perfLong];
    CLLocation *locB = [[CLLocation alloc] initWithLatitude:LatX longitude:LongY];
    CLLocationDistance distance = [locA distanceFromLocation:locB];

    float ftCalc = distance * .000621371;
    _perficientDistanceText.text = [NSString stringWithFormat:@"Distance to Perficient Lafayette %.02f Miles!",ftCalc];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
