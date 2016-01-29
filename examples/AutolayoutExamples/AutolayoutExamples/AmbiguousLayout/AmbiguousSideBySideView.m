//
//  AmbiguousSideBySideView.m
//  AutolayoutExamples
//
//  Created by Thomas Elliott on 1/28/16.
//  Copyright © 2016 Tom Elliott. All rights reserved.
//

#import "AmbiguousSideBySideView.h"

@implementation AmbiguousSideBySideView

- (void) setupHorizontalConstraint {
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[leftView(>=5)][rightView(>=5)]" options:0 metrics:nil views:@{@"leftView" : self.leftView, @"rightView" : self.rightView}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[leftView(<=100)][rightView(<=100)]" options:0 metrics:nil views:@{@"leftView" : self.leftView, @"rightView" : self.rightView}]];
}

@end
