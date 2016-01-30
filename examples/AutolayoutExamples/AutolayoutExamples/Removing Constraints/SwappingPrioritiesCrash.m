//
//  SwappingPriorities.m
//  AutolayoutExamples
//
//  Created by Thomas Elliott on 1/29/16.
//  Copyright © 2016 Tom Elliott. All rights reserved.
//

#import "SwappingPrioritiesCrash.h"

@interface SwappingPrioritiesCrash ()

@property NSLayoutConstraint *heightConstraintCollapsed;
@property NSLayoutConstraint *heightConstraintExpanded;
@property BOOL isExpanded;

@end

@implementation SwappingPrioritiesCrash

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
    self.isExpanded = NO;
    
    self.content = [[UIView alloc] init];
    self.content.translatesAutoresizingMaskIntoConstraints = NO;
    self.content.backgroundColor = [UIColor greenColor];
    
    [self addSubview:self.content];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[content]|" options:0 metrics:nil views:@{@"content" : self.content}]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[content]" options:0 metrics:nil views:@{@"content" : self.content}]];
    
    
    self.heightConstraintCollapsed = [NSLayoutConstraint constraintWithItem:self.content
                                                                                      attribute:NSLayoutAttributeHeight
                                                                                      relatedBy:NSLayoutRelationEqual
                                                                                         toItem:nil 
                                                                                      attribute:NSLayoutAttributeNotAnAttribute 
                                                                                     multiplier:1.0 
                                                                                       constant:20];
    [self addConstraint:self.heightConstraintCollapsed];
    
    self.heightConstraintExpanded = [NSLayoutConstraint constraintWithItem:self.content
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1.0
                                                                   constant:300];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.isExpanded = !self.isExpanded;
    [self setNeedsUpdateConstraints];
}

- (void) updateConstraints {
    if(self.isExpanded){
        [self removeConstraint:self.heightConstraintCollapsed];
        [self addConstraint:self.heightConstraintExpanded];
    } else {
        [self removeConstraint:self.heightConstraintExpanded];
        [self addConstraint:self.heightConstraintCollapsed];
    }
    [super updateConstraints];
}

@end
