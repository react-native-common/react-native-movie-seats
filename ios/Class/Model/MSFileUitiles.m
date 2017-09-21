//
//  FileUitiles.m
//  RNMovieSeats
//
//  Created by Ashoka on 21/09/2017.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import "MSFileUitiles.h"

@implementation MSFileUitiles

+ (NSString *)movieSeatsBundlePathForResource:(NSString *)name type:(NSString *)type {
    NSBundle *msBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"movie-seats" ofType:@"bundle"]];
    NSString *path = [msBundle pathForResource:name ofType:type];
    return path;
}

+ (UIImage *)imageInMovieSeatsBundle:(NSString *)name {
    NSBundle *msBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"movie-seats" ofType:@"bundle"]];
    UIImage *image = [UIImage imageNamed:name inBundle:msBundle compatibleWithTraitCollection:nil];
    return image;
}

@end
