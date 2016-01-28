//
//  PhoneKeypadImprovedView.m
//  AutolayoutExamples
//
//  Created by Thomas Elliott on 1/27/16.
//  Copyright © 2016 Tom Elliott. All rights reserved.
//

#import "PhoneKeypadImprovedView.h"

@interface PhoneKeypadRowView : UIView

- (id) initWithButtonLeft:(UIButton *)left middle:(UIButton *)middle right:(UIButton *)right;

@end

@implementation PhoneKeypadImprovedView

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
    
    PhoneKeypadRowView *row1 = [self createRowWithButtonLeft:digits[7] middle:digits[8] right:digits[9]];
    [self addSubview:row1];
    PhoneKeypadRowView *row2 = [self createRowWithButtonLeft:digits[4] middle:digits[5] right:digits[6]];
    [self addSubview:row2];
    PhoneKeypadRowView *row3 = [self createRowWithButtonLeft:digits[1] middle:digits[2] right:digits[3]];
    [self addSubview:row3];
    PhoneKeypadRowView *row4 = [self createRowWithButtonLeft:hash middle:digits[0] right:star];
    [self addSubview:row4];
    
    NSDictionary *views = @{ @"row1" : row1, @"row2" : row2, @"row3" : row3, @"row4" : row4 };
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[row1][row2(==row1)][row3(==row1)][row4(==row1)]|" options:0 metrics:nil views:views]];
    
    [self addConstraints:[self fullWidthConstraints:row1]];
    [self addConstraints:[self fullWidthConstraints:row2]];
    [self addConstraints:[self fullWidthConstraints:row3]];
    [self addConstraints:[self fullWidthConstraints:row4]];
}

- (PhoneKeypadRowView *) createRowWithButtonLeft:(UIButton *)left middle:(UIButton *)middle right:(UIButton *)right {
    PhoneKeypadRowView *row = [[PhoneKeypadRowView alloc] initWithButtonLeft:left middle:middle right:right];
    row.translatesAutoresizingMaskIntoConstraints = NO;
    row.layer.borderColor = [UIColor redColor].CGColor;
    row.layer.borderWidth = 2.0;
    return row;
}

- (NSArray<__kindof NSLayoutConstraint *> *) fullWidthConstraints:(UIView *)view {
    return [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:@{ @"view" : view }];
}

@end

@implementation PhoneKeypadRowView

- (id) initWithButtonLeft:(UIButton *)left middle:(UIButton *)middle right:(UIButton *)right {
    if(self = [super init]){
        [self addSubview:left];
        [self addSubview:middle];
        [self addSubview:right];
        
        NSDictionary *views = NSDictionaryOfVariableBindings(left,middle,right);
        
        [self addConstraints:[self fullHeightConstraints:left]];
        [self addConstraints:[self fullHeightConstraints:middle]];
        [self addConstraints:[self fullHeightConstraints:right]];
        
        [self addConstraints: [NSLayoutConstraint
          constraintsWithVisualFormat:@"H:|[left][middle(==left)][right(==left)]|"
          options:0 metrics:nil views:views]];
    }
    return self;
}

- (NSArray<__kindof NSLayoutConstraint *> *) fullHeightConstraints:(UIView *)view {
    return [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:@{ @"view" : view }];
}

@end

