//
//  LessAmbiguousSideBySideView.m
//  AutolayoutExamples
//
//  Created by Thomas Elliott on 1/28/16.
//  Copyright © 2016 Tom Elliott. All rights reserved.
//

#import "LessAmbiguousSideBySideView.h"

@implementation LessAmbiguousSideBySideView

- (void) setupHorizontalConstraint {
    UIView *spacer = [[UIView alloc] init];
    spacer.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:spacer];
    
    UIView *leftView = self.leftView;
    UIView *rightView = self.rightView;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(leftView, rightView, spacer);
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[leftView(==rightView)]" options:0 metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[leftView(<=100)][spacer(==leftView@999)][rightView(<=100)]|" options:0 metrics:nil views:views]];
}

@end
