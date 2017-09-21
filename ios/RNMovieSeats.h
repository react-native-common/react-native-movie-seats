
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#else
#import <React/RCTBridgeModule.h>
#endif

#import <UIKit/UIKit.h>
#import "ZFSeatSelectionView.h"

@interface RNMovieSeats : UIView

@property (nonatomic, strong) ZFSeatSelectionView* selectSeatsView;

@property (nonatomic, assign) float rctWidth;
@property (nonatomic, assign) float rctHeight;

- (void)setupViewWidth:(CGFloat)width height:(CGFloat)height;

@end
  
