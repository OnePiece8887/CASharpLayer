//
//  LSDTemperatureBackView.m
//  CASharpLayer
//
//  Created by 神州锐达 on 16/11/11.
//  Copyright © 2016年 OnePiece. All rights reserved.
//

#import "LSDTemperatureBackView.h"

@implementation LSDTemperatureBackView

-(instancetype)initWithFrame:(CGRect)frame
{

    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI
{
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.fillColor = [UIColor clearColor].CGColor;
    _shapeLayer.backgroundColor = [UIColor clearColor].CGColor;
    _shapeLayer.lineCap = kCALineCapRound;
    _shapeLayer.lineJoin = kCALineJoinRound;
    _shapeLayer.frame = CGRectMake(0, 0, 0, 0);
    [self.layer addSublayer:_shapeLayer];
    
    
}

- (void)drawRect:(CGRect)rect {
   ///绘制backView
    [self setcanshu:rect];
    
}

-(void)setcanshu:(CGRect)rect
{
    _backViewRadius = (rect.size.width - self.backViewWidth) * 0.5;
    
    _centerPoint = CGPointMake(rect.size.width* 0.5, rect.size.height* 0.5);
    
    _shapeLayer.frame = rect;
    _shapeLayer.lineWidth = self.backViewWidth;
    
    if(_shapeLayer.frame.origin.x==0||
       _shapeLayer.frame.origin.y==0||
       _shapeLayer.frame.size.width==0||
       _shapeLayer.frame.size.height==0)
    {
        ///绘制贝塞尔曲线
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path addArcWithCenter:_centerPoint radius:_backViewRadius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
        _shapeLayer.path = path.CGPath;
        _shapeLayer.strokeEnd = 1;
    
    }
 
}

-(void)setBackViewWidth:(CGFloat)backViewWidth
{
    _backViewWidth = backViewWidth;
    
     [self setNeedsDisplay];
    
}

-(void)setBackViewColor:(UIColor *)backViewColor
{

    _backViewColor = backViewColor;
    
    _shapeLayer.strokeColor = backViewColor.CGColor;
    
}

@end
