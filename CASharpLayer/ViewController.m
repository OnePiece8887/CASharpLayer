//
//  ViewController.m
//  CASharpLayer
//
//  Created by 神州锐达 on 16/11/10.
//  Copyright © 2016年 OnePiece. All rights reserved.
//

#import "ViewController.h"
#import "LSDTemperatureView.h"

@interface ViewController ()

///
@property(weak,nonatomic)LSDTemperatureView *temperatureView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    LSDTemperatureView *temperatureView = [[LSDTemperatureView alloc]initWithFrame:CGRectMake(0, 100, 200, 200)];
    temperatureView.backViewColor = [UIColor grayColor];
    temperatureView.temperatureWidth = 10;
    temperatureView.temperatureValue = 20;
    [self.view addSubview:temperatureView];
    self.temperatureView = temperatureView;
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeTemperature) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
    
}

-(void)changeTemperature
{
    if (self.temperatureView.temperatureValue < 260) {
         self.temperatureView.temperatureValue += 20;
    }else
    {
            self.temperatureView.temperatureValue = 100;
    }
   
    
}

@end
