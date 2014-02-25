//
//  ViewController.h
//  TechSensor
//
//  Created by Ken Tominaga on 2013/11/12.
//  Copyright (c) 2013年 Tommy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreMotion/CoreMotion.h>

@interface ViewController : UIViewController {
    
    // CoreMotionManegerにコンニチハ
    CMMotionManager *motionManager;
    
    // 加速度センサーの値を表示させるためのLabel
    IBOutlet UILabel *xLabel;
    IBOutlet UILabel *yLabel;
    IBOutlet UILabel *zLabel;
}

// 加速度センサーを起動するメソッド
-(IBAction)startUpdate;

// 加速度センサーを停止するメソッド
-(IBAction)stopUpdate;

@end
