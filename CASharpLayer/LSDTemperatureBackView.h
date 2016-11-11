//
//  LSDTemperatureBackView.h
//  CASharpLayer
//
//  Created by 神州锐达 on 16/11/11.
//  Copyright © 2016年 OnePiece. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSDTemperatureBackView : UIView

@property(strong,nonatomic)CAShapeLayer *shapeLayer;

///背景颜色
@property(strong,nonatomic)UIColor *backViewColor;

///背景线条宽度
@property(assign,nonatomic)CGFloat backViewWidth;

///背景半径
@property(assign,nonatomic)CGFloat backViewRadius;

///圆点
@property(assign,nonatomic)CGPoint centerPoint;

@end
