//
//  LSDTemperatureFrontView.m
//  CASharpLayer
//
//  Created by 神州锐达 on 16/11/11.
//  Copyright © 2016年 OnePiece. All rights reserved.
//

#import "LSDTemperatureFrontView.h"
#import "UIColor+Hex.h"

@implementation LSDTemperatureFrontView

-(instancetype)initWithFrame:(CGRect)frame
{

    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
        
    }
    return self;
}

-(void)setupUI
{
    
    ///设置渐变色
    _leftGradientLayer = [CAGradientLayer layer];
    _rightGradientLayer = [CAGradientLayer layer];
    
    _leftGradientLayer.startPoint = CGPointMake(0, 0);
    _leftGradientLayer.endPoint = CGPointMake(0, 1);
    _rightGradientLayer.startPoint = CGPointMake(1, 0);
    _rightGradientLayer.endPoint = CGPointMake(1,1);
    
    
     _leftColorArray = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:254.0/255.0 green:207.0/255.0 blue:47.0/255.0 alpha:1.0] CGColor],(id)[[UIColor yellowColor] CGColor],(id)[[UIColor greenColor] CGColor],nil];

     _rightColorArray = [NSArray arrayWithObjects:(id)[[UIColor yellowColor] CGColor],(id)[[UIColor redColor] CGColor], nil];
    
    _leftGradientLayer.colors = _leftColorArray;
    _rightGradientLayer.colors = _rightColorArray;

    _rightGradientLayer.locations = @[@(-0.2)];
    
    
    ///将两个渐变层添加到一个新图层上
    _topLayer = [CALayer layer];
    [_topLayer insertSublayer:_leftGradientLayer atIndex:0];
    [_topLayer insertSublayer:_rightGradientLayer atIndex:0];
    
    ///蒙版图层
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.fillColor = [UIColor clearColor].CGColor;
    _shapeLayer.strokeColor = [UIColor redColor].CGColor;
    _shapeLayer.backgroundColor = [UIColor clearColor].CGColor;
    _shapeLayer.frame = CGRectMake(0, 0, 0, 0);
    
    
}

- (void)drawRect:(CGRect)rect {
    ///绘制frontView
    [self setcanshu:rect];

}

-(void)setcanshu:(CGRect)rect
{

    _frontViewRadius = (rect.size.height>rect.size.width?rect.size.width/2:rect.size.height/2)-self.frontViewWidth/2;
    
    _centerPoint = CGPointMake(rect.size.width* 0.5, rect.size.height* 0.5);

    _leftRect = CGRectMake(rect.size.width/2-_frontViewRadius-_frontViewWidth/2, rect.size.height/2-_frontViewRadius-_frontViewWidth/2, _frontViewRadius+_frontViewWidth/2, 2*_frontViewRadius+_frontViewWidth);
    _rightRect = CGRectMake(rect.size.width/2,rect.size.height/2-_frontViewRadius-_frontViewWidth/2,_frontViewRadius+_frontViewWidth/2, 2*_frontViewRadius+_frontViewWidth);
    
    _leftGradientLayer.frame = _leftRect;
    _rightGradientLayer.frame = _rightRect;
    
    if(_shapeLayer.frame.origin.x==0||
       _shapeLayer.frame.origin.y==0||
       _shapeLayer.frame.size.width==0||
       _shapeLayer.frame.size.height==0){
        _shapeLayer.frame = rect;
        //旋转角度
        _shapeLayer.transform = CATransform3DMakeRotation(M_PI/2, 0, 0, 1);
    }
    _shapeLayer.lineWidth = self.frontViewWidth;
    
    ///绘制贝塞尔曲线
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:_centerPoint radius:_frontViewRadius startAngle:0  endAngle:M_PI*2 clockwise:YES];
    _shapeLayer.path = path.CGPath;
    
    _shapeLayer.strokeEnd = self.progressRate;
    
    _topLayer.frame = rect;
    
    [_topLayer setMask:_shapeLayer];
    
    [self.layer addSublayer:_topLayer];

}


-(void)setProgressRate:(CGFloat)progressRate
{

    _progressRate = progressRate;
    
    [self setNeedsDisplay];
}


@end
