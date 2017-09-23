//
//  ASCenterLineView.m
//  RNMovieSeats
//
//  Created by Ashoka on 23/09/2017.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "ASCenterLineView.h"
#import "UIView+Extension.h"

@implementation ASCenterLineView

- (instancetype)initWithHorizontal:(BOOL)horizontal {
    self = [super init];
    if (self) {
        self.horizontal = horizontal;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

-(void)setHeight:(CGFloat)height{
    
    [super setHeight:height];
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);
    CGFloat lengths[] = {6,3};
    CGContextSetLineDash(context, 0, lengths,2);
    CGContextMoveToPoint(context, 0, 0);
    if (!_horizontal)
        CGContextAddLineToPoint(context, 0, self.bounds.size.height);
    else
        CGContextAddLineToPoint(context, self.bounds.size.width, 0);
    CGContextStrokePath(context);
}

@end
