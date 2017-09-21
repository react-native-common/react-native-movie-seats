//
//  FileUitiles.h
//  RNMovieSeats
//
//  Created by Ashoka on 21/09/2017.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MSFileUitiles : NSObject

+ (NSString *)movieSeatsBundlePathForResource:(NSString *)name type:(NSString *)type;

+ (UIImage *)imageInMovieSeatsBundle:(NSString *)name;

@end
