//
//  PhoneKeypadView.m
//  AutolayoutExamples
//
//  Created by Thomas Elliott on 1/27/16.
//  Copyright © 2016 Tom Elliott. All rights reserved.
//

#import "PhoneKeypadView.h"

@implementation PhoneKeypadView

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

- (UIButton *) createButtonWithTitle:(NSString *) title {
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    button.backgroundColor = [UIColor darkGrayColor];
    return button;
}

- (void) configureView {
    
    self.backgroundColor = [UIColor greenColor];
    
    NSMutableArray *digits = [NSMutableArray array];
    for(int i = 0; i < 10; i++){
        UIButton *button = [self createButtonWithTitle:[NSString stringWithFormat:@"%d",i]];
        [self addSubview:button];
        digits[i] = button;
    }
    
    UIButton *star = [self createButtonWithTitle:@"*"];
    [self addSubview:star];
    UIButton *hash = [self createButtonWithTitle:@"#"];
    [self addSubview:hash];
    
    NSDictionary *views = @{
                            @"star" : star,
                            @"hash" : hash,
                            @"zero" : digits[0],
                            @"one" : digits[1],
                             @"two" : digits[2],
                            @"three" : digits[3],
                            @"four" : digits[4], @"five" : digits[5], @"six" : digits[6],
                            @"seven" : digits[7], @"eight" : digits[8], @"nine" : digits[9]
                       };
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[one][two(==one)][three(==one)]|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[four(==one)][five(==one)][six(==one)]|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[seven(==one)][eight(==one)][nine(==one)]|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[star(==one)][zero(==one)][hash(==one)]|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[one][four(==one)][seven(==one)][star(==one)]|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[two(==one)][five(==one)][eight(==one)][zero(==one)]|" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[three(==one)][six(==one)][nine(==one)][hash(==one)]|" options:0 metrics:nil views:views]];
    
    
}

@end
