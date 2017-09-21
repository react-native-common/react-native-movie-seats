
#import "RNMovieSeats.h"
#import "ZFSeatsView.h"
#import "MJExtension.h"

@implementation RNMovieSeats

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    return self;
}

- (void)setupViewWidth:(CGFloat)width height:(CGFloat)height {
    if(!_selectSeatsView) {
        NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"movie-seats" ofType:@"bundle"]];
        NSString *path = [bundle pathForResource:[NSString stringWithFormat:@"seats %zd.plist",arc4random_uniform(5)] ofType:nil];
        NSLog(@"path...%@", path);
        //模拟网络加载数据
        NSDictionary *seatsDic = [NSDictionary dictionaryWithContentsOfFile:path];
        __block  NSMutableArray *  seatsArray = seatsDic[@"seats"];
        
        __block  NSMutableArray *seatsModelArray = [NSMutableArray array];
        
        [seatsArray enumerateObjectsUsingBlock:^(NSArray *obj, NSUInteger idx, BOOL *stop) {
            ZFSeatsModel *seatModel = [ZFSeatsModel mj_objectWithKeyValues:obj];
            [seatsModelArray addObject:seatModel];
        }];
        _selectSeatsView = [[ZFSeatSelectionView alloc] initWithFrame:CGRectMake(0, 0, width, height) SeatsArray:seatsModelArray HallName:@"hello" seatBtnActionBlock:^(NSMutableArray *selecetedSeats, NSMutableDictionary *allAvailableSeats, NSString *errorStr) {
            NSLog(@"=====%zd个选中按钮===========%zd个可选座位==========errorStr====%@=========",selecetedSeats.count,allAvailableSeats.count,errorStr);
            if (errorStr) {
                //错误信息
                NSLog(@"error.....%@", errorStr);
            }
        }];
        [self addSubview:_selectSeatsView];
    }
}

@end
  
