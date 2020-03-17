#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    
    NSMutableArray *test = [NSMutableArray arrayWithArray:(bill)];
   
    [test removeObjectAtIndex:(index)];
    
    int summ = 0;
    
    for(int i = 0; i < [test count]; i++){
        summ = summ+[test[i] intValue];
    }
    
    int calculatedSumm = summ/2;
    
    if (calculatedSumm==[sum intValue]) {
        return @"Bon Appetit";
    }else{
        NSString *difference = [NSString stringWithFormat:@"%i",[sum intValue]-calculatedSumm];
        return difference;
    }
}

@end
