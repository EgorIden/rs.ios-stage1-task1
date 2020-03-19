#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    
    NSMutableArray *final = [[NSMutableArray alloc] init];
    
    unichar startBrackets[] = { '<', '(', '[' };
    unichar endBrackets[] = { '>', ')', ']' };
    
    NSUInteger strLength = string.length;
    
    unichar buffer[strLength + 1];
    
    [string getCharacters:buffer range:NSMakeRange(0, strLength)];
    
    NSMutableOrderedSet *results = [NSMutableOrderedSet orderedSet];
    
    NSInteger depth = 0;
    
    for (int string = 0; string < strLength; string++){
        for(int bracket = 0; bracket < 3; bracket++){
            if (buffer[string] == startBrackets[bracket]){
                for (int i = string + 1; i < strLength ; i++) {
                    if (buffer[i] == startBrackets[bracket]) {
                        depth++; continue;
                    }
                    if (buffer[i] == endBrackets[bracket] && depth != 0) {
                        depth--; continue;
                    }
                    if (buffer[i] == endBrackets[bracket] && depth == 0) {
                        [results addObject:[NSValue valueWithRange:NSMakeRange(string + 1, i - string - 1)]]; break;
                        }
                    }
                }
            }
        }

    for (NSUInteger i = 0; i < [results count]; i++) {
        NSValue *value = [results objectAtIndex:i];
        NSRange range = [value rangeValue];
        NSString *subString = [string substringWithRange:range];
        [final addObject:subString];
    }
    return final;
}

@end
