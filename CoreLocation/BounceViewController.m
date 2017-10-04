//
//  BounceViewController.m
//  CoreLocation
//
//  Created by DDC.Mac1 on 10/4/17.
//  Copyright © 2017 DDC.Mac1. All rights reserved.
//

#import "BounceViewController.h"

@interface BounceViewController ()

@end

@implementation BounceViewController
@synthesize img;

- (void)viewDidLoad {
    
   // Do any additional setup after loading the view.
    position = CGPointMake(10, 3);
    [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(bounce) userInfo:nil repeats:YES];
   
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)bounce {
    img.center = CGPointMake(img.center.x+position.x, img.center.y+position.y);
    
    if ((img.center.x > 400) || (img.center.x < 0)){
        position.x = -position.x;
        GPUImageSepiaFilter *stillImageFilter2 = [[GPUImageSepiaFilter alloc] init];
        img.image = [stillImageFilter2 imageByFilteringImage:img.image];
    }
    
    if (img.center.y > 600 || img.center.y < 0){
        position.y = -position.y;
        GPUImageHueFilter *stillImageFilter2 = [[GPUImageHueFilter alloc] init];
        img.image = [stillImageFilter2 imageByFilteringImage:img.image];
    }
    
    coordinateLabel.text = [NSString stringWithFormat:@"Center: %.02f, %.02f",img.center.x, img.center.y];
    
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
