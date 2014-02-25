//
//  ViewController.m
//  TechSensor
//
//  Created by Ken Tominaga on 2013/11/12.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // インスタンスの生成
    motionManager = [[CMMotionManager alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    // CoreMotionManagerにサヨナラ
    motionManager = nil;
    
}

//-(void)viewDidUnload{
//    
//    // CoreMotionManagerにサヨナラ
//    motionManager = nil;
//    
//}

-(IBAction)startUpdate{
    
    if ([motionManager isAccelerometerAvailable] == YES) {
        
        // 加速度センサーの更新間隔を設定する
        motionManager.accelerometerUpdateInterval = 0.01;
        
        // 加速度センサーの更新を開始する
        [motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
            
            // 加速度センサーの各値を取得する
            double x = accelerometerData.acceleration.x;  // X軸 : 加速度
            double y = accelerometerData.acceleration.y;  // Y軸 : 加速度
            double z = accelerometerData.acceleration.z;  // Z軸 : 加速度
            
            // 加速度センサーの値をLabelに表示する
            xLabel.text = [NSString stringWithFormat:@"x = %f", x];
            yLabel.text = [NSString stringWithFormat:@"y = %f", y];
            zLabel.text = [NSString stringWithFormat:@"z = %f", z];
            
        }];
    }
}

-(IBAction)stopUpdate{
    
    // 加速度センサーが動いている(Active)の場合
    if (motionManager.accelerometerActive == YES) {
        
        // 加速度センサーの更新を停止させる
        [motionManager stopAccelerometerUpdates];
        
    }
    
}



@end
