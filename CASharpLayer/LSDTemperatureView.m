//
//  LSDTemperatureView.m
//  CASharpLayer
//
//  Created by 神州锐达 on 16/11/11.
//  Copyright © 2016年 OnePiece. All rights reserved.
//

#import "LSDTemperatureView.h"

@interface LSDTemperatureView ()


@end

@implementation LSDTemperatureView

-(instancetype)initWithFrame:(CGRect)frame
{

    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    
    return self;
}


-(void)setupUI
{
    
    self.backgroundColor = [UIColor clearColor];
    
    LSDTemperatureBackView *backView = [[LSDTemperatureBackView alloc]init];
    backView.backgroundColor = [UIColor clearColor];
    [self addSubview:backView];
    self.backView = backView;
    
    LSDTemperatureFrontView *frontView = [[LSDTemperatureFrontView alloc]init];
    frontView.backgroundColor = [UIColor clearColor];
    [self addSubview:frontView];
    self.frontView = frontView;

}

-(void)drawRect:(CGRect)rect
{

    [self drawTemperatureRect:rect];
    
}

-(void)drawTemperatureRect:(CGRect)rect
{
    self.frontView.frame = rect;
    self.backView.frame = rect;
    
    ///设置前后视图的宽度及值
    self.backView.backViewWidth = self.temperatureWidth;
    self.frontView.frontViewWidth = self.temperatureWidth;
    self.frontView.progressRate = self.temperatureValue / 300.0;

}

-(void)setTemperatureWidth:(CGFloat)temperatureWidth
{

    _temperatureWidth = temperatureWidth;
    
    _temperatureWidth = temperatureWidth > 10 ? 10:temperatureWidth;
    
    [self setNeedsDisplay];
    
}

-(void)setTemperatureValue:(CGFloat)temperatureValue
{
    _temperatureValue = temperatureValue;
    
    [self setNeedsDisplay];
    
}

-(void)setBackViewColor:(UIColor *)backViewColor
{

    _backViewColor = backViewColor;
    
    self.backView.backViewColor = backViewColor;
}

@end










