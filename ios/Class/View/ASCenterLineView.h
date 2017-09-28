//
//  ASCenterLineView.h
//  RNMovieSeats
//
//  Created by Ashoka on 23/09/2017.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASCenterLineView : UIView

/**
 true: horizontal, false(default): vertical
 */
@property (nonatomic, assign) BOOL horizontal;

- (instancetype)initWithHorizontal:(BOOL)horizontal;

@end
