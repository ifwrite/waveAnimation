//
//  ViewController.m
//  waveAnimation
//
//  Created by 苏亮 on 2016/11/15.
//  Copyright © 2016年 Emir. All rights reserved.
//

#import "ViewController.h"
#import "EMWaveView.h"

@interface ViewController ()

@property (strong, nonatomic) EMWaveView *waveView;

@end

@implementation ViewController

- (EMWaveView *)waveView{
    
    if (!_waveView) {
        _waveView = [[EMWaveView alloc] initWithFrame:self.view.bounds];

        [_waveView startAnimation];
    }
    return _waveView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.waveView];
}

@end
