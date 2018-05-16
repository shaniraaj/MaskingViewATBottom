//
//  ViewController.m
//  MaskingBottomCorners
//
//  Created by Undecimo on 16/05/18.
//  Copyright © 2018 SampleMaskingProject. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    [self.sampleView setNeedsLayout];
    [self.sampleView layoutIfNeeded];
    UIBezierPath *maskPath = [UIBezierPath
                              bezierPathWithRoundedRect:self.sampleView.bounds
                              byRoundingCorners:(UIRectCornerBottomLeft| UIRectCornerBottomRight)
                              cornerRadii:CGSizeMake(self.sampleView.frame.size.width/2+50, self.sampleView.frame.size.width/2+50)
                              ];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    
    maskLayer.frame = self.sampleView.bounds;
    maskLayer.path = maskPath.CGPath;
    
    self.sampleView.layer.mask = maskLayer;



}

@end
