//
//  BounceViewController.h
//  CoreLocation
//
//  Created by DDC.Mac1 on 10/4/17.
//  Copyright © 2017 DDC.Mac1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BounceViewController : UIViewController {
    CGPoint position;
   
    __weak IBOutlet UIImageView *img;
    __weak IBOutlet UILabel *coordinateLabel;
}
-(void)bounce;

@property (nonatomic, weak) UIImageView *img;
    

@end
