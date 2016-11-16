//
//  EMWaveView.m
//  waveAnimation
//
//  Created by 苏亮 on 2016/11/15.
//  Copyright © 2016年 Emir. All rights reserved.
//

#import "EMWaveView.h"

@interface EMWaveView ()

//定时器
@property (strong, nonatomic) CADisplayLink *timer;

//浪的layer动画层
@property (strong, nonatomic) CAShapeLayer *waveLayer;

//浪的偏移量
@property (assign, nonatomic) CGFloat offset;

@end
@implementation EMWaveView

#pragma mark - init
- (void)awakeFromNib{
    
    [super awakeFromNib];
    [self initData];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData{

    //默认值
    self.waveSpeed = 10.0;
    self.waveCurvature = 1.0;
    self.waveHeight = 10.0;
    
    [self.layer addSublayer:self.waveLayer];
}

#pragma mark - lazy load
- (CAShapeLayer *)waveLayer{
    
    if (!_waveLayer) {
        _waveLayer = [CAShapeLayer layer];

        [self calulatorWaveFrame];
        _waveLayer.fillColor = [UIColor blueColor].CGColor;
        
    }
    return _waveLayer;
}

#pragma mark - setter
- (void)setWaveHeight:(CGFloat)waveHeight{
    _waveHeight = waveHeight;
    
    [self calulatorWaveFrame];
}


/**
 计算浪在容器内大小
 */
- (void)calulatorWaveFrame {
    
    CGRect frame = self.bounds;
    frame.origin.y = frame.size.height-self.waveHeight;
    frame.size.height = self.waveHeight;
    _waveLayer.frame = frame;
}

#pragma mark - Public Methods
- (void)startAnimation{

    self.timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(wave)];
    [self.timer addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

#pragma mark - Private Methods
- (void)wave{
    
    self.offset += self.waveSpeed;
    
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = self.waveHeight;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, height);
    CGFloat y = 0.f;
    
    //做出sin曲线，让x不断右移，最大为width， 让y不断右移动，路径是sin曲线路径。加个0.01的参数。防止数值过大。影响试图
    for (CGFloat x = 0.f; x <= width ; x++) {
        y = height * sinf((self.waveCurvature * x + self.offset) * 0.01);
        CGPathAddLineToPoint(path, NULL, x, y);
    }
    
    //画了两条线让图形封闭
    CGPathAddLineToPoint(path, NULL, width, height);
    CGPathAddLineToPoint(path, NULL, 0, height);
    CGPathCloseSubpath(path);
    
    self.waveLayer.path = path;
    self.waveLayer.fillColor = [UIColor blueColor].CGColor;
    CGPathRelease(path);
}

@end
