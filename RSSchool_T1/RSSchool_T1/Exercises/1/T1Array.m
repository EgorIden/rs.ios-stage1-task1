#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    
    NSMutableArray *test = [NSMutableArray arrayWithArray:sadArray];
    
    if (test.count==0 || test.count<3) {
        return test;
    }
    
    int i = 1;
    
    while (i<test.count-1){
        if (([test[i-1] integerValue]+[test[i+1] integerValue])<[test[i] integerValue]) {
            [test removeObjectAtIndex:i];
            if ((i-1)!=0) {
                i--;
            }
        }else{
            i++;
        }
    }
    
    return test;
}

@end
