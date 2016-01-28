//
//  SideBySideViewA.m
//  HorizontalScalingDemo
//
//  Created by Thomas Elliott on 1/23/16.
//  Copyright © 2016 Tom Elliott. All rights reserved.
//

#import "SideBySideView.h"

@implementation SideBySideView

- (id) initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        [self configureView];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]){
        [self configureView];
    }
    return self;
}

- (void) configureView {
    
    UILabel *widthLabel = [[UILabel alloc] init];
    
    UIView *leftView = [[UIView alloc] init];
    UIView *rightView = [[UIView alloc] init];
    
    leftView.translatesAutoresizingMaskIntoConstraints = NO;
    rightView.translatesAutoresizingMaskIntoConstraints = NO;

    leftView.backgroundColor = [UIColor greenColor];
    rightView.backgroundColor = [UIColor blueColor];
    
    [self addSubview:leftView];
    [self addSubview:rightView];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[leftView]|" options:0 metrics:nil views:@{@"leftView" : leftView}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[rightView]|" options:0 metrics:nil views:@{@"rightView" : rightView}]];
    
    self.leftView = leftView;
    self.rightView = rightView;
    
    [self setupHorizontalConstraint];
    
}

- (void) setupHorizontalConstraint {
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[leftView(==100)][rightView(==100)]|" options:0 metrics:nil views:@{@"leftView" : self.leftView, @"rightView" : self.rightView}]];
}

- (void) layoutSubviews {
    [super layoutSubviews];
    
    if([self hasAmbiguousLayout] || [self.leftView hasAmbiguousLayout] || [self.rightView hasAmbiguousLayout]){
        self.layer.borderColor = [UIColor orangeColor].CGColor;
        self.layer.borderWidth = 2.0;
    }
    
}

- (IBAction)exerciseAmbiguityForAll:(id)sender {
    [self.leftView exerciseAmbiguityInLayout];
    [self.rightView exerciseAmbiguityInLayout];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
