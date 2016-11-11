//
//  LSDTemperatureFrontView.h
//  CASharpLayer
//
//  Created by 神州锐达 on 16/11/11.
//  Copyright © 2016年 OnePiece. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSDTemperatureFrontView : UIView

///
@property(strong,nonatomic)CAShapeLayer *shapeLayer;

///进度条线条宽度
@property(assign,nonatomic)CGFloat frontViewWidth;
///进度条半径
@property(assign,nonatomic)CGFloat frontViewRadius;
///圆点
@property(assign,nonatomic)CGPoint centerPoint;

///渐变左图层
@property(strong,nonatomic)CAGradientLayer *leftGradientLayer;
///渐变右图层
@property(strong,nonatomic)CAGradientLayer *rightGradientLayer;
///新图层
@property(strong,nonatomic)CALayer *topLayer;

///左渐变色数组
@property(strong,nonatomic)NSArray *leftColorArray;
///右渐变色数组
@property(strong,nonatomic)NSArray *rightColorArray;

///左渐变区域
@property(assign,nonatomic)CGRect leftRect;
///右渐变区域
@property(assign,nonatomic)CGRect rightRect;

///进度比率
@property(assign,nonatomic)CGFloat progressRate;


@end
