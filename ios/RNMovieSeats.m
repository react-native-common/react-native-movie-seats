
#import "RNMovieSeats.h"
#import "ZFSeatsView.h"
#import "MJExtension.h"

@implementation RNMovieSeats

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    return self;
}

- (void)setupView {
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
        __weak typeof(self) weakSelf = self;
        _selectSeatsView = [[ZFSeatSelectionView alloc] initWithFrame:CGRectMake(0, 0, self.rctWidth, self.rctHeight) SeatsArray:seatsModelArray HallName:@"hello" seatBtnActionBlock:^(NSString *row, NSString *column, ActionType actionType) {
            NSDictionary *types = @{
                                    @(kSelect).stringValue: @"select",
                                    @(kUnSelect).stringValue: @"unselect",
                                    @(kError).stringValue: @"error"
                                    };
            NSString *type = types[@(actionType).stringValue];
            if (actionType == kError) {
                
            }
            weakSelf.onChange(@{
                                @"type": type,
                                @"data": @{@"row":row, @"column":column}
                                });
        }];
        _selectSeatsView.maxSelectedSeatsCount = self.maxSelectedSeatsCount;
        [self addSubview:_selectSeatsView];
    }
}

@end
  
