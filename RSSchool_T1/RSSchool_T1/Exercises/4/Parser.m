#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    
    NSString *searchText = string;

    NSError *error = NULL;
    
    NSArray *pattern = @[@"\\<(.*?)\\>",@"\\[(.*?)\\]",@"\\((.*?)\\)",@"\\(\\[(.*?)\\]\\)"];
    
    NSMutableArray *matches = [[NSMutableArray alloc] init];
    
    for (int i = 0; i<pattern.count; i++) {
        
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern[i]
                                                            options:NSRegularExpressionCaseInsensitive
                                                            error:&error];
        
        NSArray *myArray = [regex matchesInString:searchText options:0 range:NSMakeRange(0, [searchText length])];

        for (NSTextCheckingResult *match in myArray) {
             NSRange matchRange = [match rangeAtIndex:1];
             [matches addObject:[searchText substringWithRange:matchRange]];
             NSLog(@"matches %@", [matches lastObject]);
        }
        
    }
    return matches;
}

@end
