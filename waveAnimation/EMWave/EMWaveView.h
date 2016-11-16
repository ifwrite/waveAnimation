//
//  EMWaveView.h
//  waveAnimation
//
//  Created by 苏亮 on 2016/11/15.
//  Copyright © 2016年 Emir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EMWaveView : UIView

/**
 浪弯度
 */
@property (assign, nonatomic) CGFloat waveCurvature;

/**
 浪速
 */
@property (assign, nonatomic) CGFloat waveSpeed;

/**
 浪高
 */
@property (assign, nonatomic) CGFloat waveHeight;


/**
 开始动画
 */
- (void)startAnimation;

@end
