//
//  LSDTemperatureView.h
//  CASharpLayer
//
//  Created by 神州锐达 on 16/11/11.
//  Copyright © 2016年 OnePiece. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSDTemperatureBackView.h"
#import "LSDTemperatureFrontView.h"
@interface LSDTemperatureView : UIView

///前部进度动态视图
@property(weak,nonatomic)LSDTemperatureFrontView *frontView;

///后部背景视图
@property(weak,nonatomic)LSDTemperatureBackView *backView;

///背景颜色
@property(strong,nonatomic)UIColor *backViewColor;


///温度计宽度
@property(assign,nonatomic)CGFloat temperatureWidth;

///温度计数值
@property(assign,nonatomic)CGFloat temperatureValue;

///进度
@property(assign,nonatomic)CGFloat progress;

@end
