//
//  SimpleSteppedView.m
//  THY
//
//  Created by zdmr on 7.03.2019.
//  Copyright © 2019 T.A.O. All rights reserved.
//

#import "SimpleSteppedView.h"

@interface SimpleSteppedView ()
@property (nonatomic, assign) CGFloat lineHeight;
@end

@implementation SimpleSteppedView

- (void)setNumberOfPoints:(NSInteger)numberOfPoints {
    _numberOfPoints = numberOfPoints;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {

    CGFloat width = CGRectGetWidth(rect);
    CGFloat height = CGRectGetHeight(rect);
    CGFloat _circleHeight = CGRectGetHeight(rect);

    CGContextRef context = UIGraphicsGetCurrentContext();

    CGFloat distanceBetweenCircles = (width - _numberOfPoints * _circleHeight) / (_numberOfPoints - 1) * 1.0;

    CGFloat xCursor = 0;

    CGContextSetLineWidth(context, _lineHeight);
    CGContextSetStrokeColorWithColor(context, _color.CGColor);
    CGContextMoveToPoint(context, _circleHeight / 2.0, height / 2.0);
    CGContextAddLineToPoint(context, width - _circleHeight / 2.0, height / 2.0);
    CGContextStrokePath(context);

    CGPoint centerPoints[_numberOfPoints];

    for (int i = 0; i < _numberOfPoints; i++) {
        centerPoints[i] = CGPointMake(xCursor, (height - _circleHeight) / 2);
        xCursor += _circleHeight + distanceBetweenCircles;
    }

    for (int i = 0; i < _numberOfPoints; i++) {

        CGRect rectangle = {centerPoints[i], CGSizeMake(_circleHeight, _circleHeight)};
        CGContextAddEllipseInRect(context, rectangle);

        if (i == 0 || i == _numberOfPoints - 1) {

            CGContextSetFillColorWithColor(context, _color.CGColor);
            CGContextFillPath(context);
        } else {

            CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
            CGContextFillPath(context);

            CGContextSetLineWidth(context, 1);
            CGRect circle = CGRectInset(rectangle, 1, 1);
            CGContextAddEllipseInRect(context, circle);
            CGContextStrokePath(context);
        }
    }
}

- (void)commonInit {
    [self setBackgroundColor:[UIColor clearColor]];
    [self setLineHeight:2.0];
    [self setContentMode:UIViewContentModeRedraw];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}
@end
