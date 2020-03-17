#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    
    NSMutableArray *test = [NSMutableArray arrayWithArray:array];
    NSMutableArray *currentSumm = [[NSMutableArray alloc]init];
    NSMutableArray *final = [[NSMutableArray alloc]init];
    
    int summ = 0;
    
    for(int i = 0; i < [test count]; i++){
        summ = summ+[test[i] intValue];
    }
    
    for(int i = 0; i < [test count]; i++) {
        
        int summWithoutCurrentElement = summ-[test[i] intValue];
        NSNumber *nsNumberWrap = [NSNumber numberWithInt:(summWithoutCurrentElement)];
        [currentSumm addObject:(nsNumberWrap)];
    }
    
    int max = [currentSumm[0] intValue];
    int min = [currentSumm[0] intValue];
    
    for (int i = 0; i < [currentSumm count]; i++) {
        if (max<[currentSumm[i] intValue]) {
            max = [currentSumm[i] intValue];
            NSLog(@"max is %d", max);
        }
        if (min>[currentSumm[i] intValue]) {
            min = [currentSumm[i] intValue];
            NSLog(@"min is %d", min);
        }
    }
    
    NSNumber *maxFinal = [NSNumber numberWithInt:(max)];
    NSNumber *minFinal = [NSNumber numberWithInt:(min)];
    
    [final addObject:(minFinal)];
    [final addObject:(maxFinal)];
    
    return final;
}

@end
