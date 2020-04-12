#import "SquareDecomposer.h"

@implementation SquareDecomposer
- (NSArray <NSNumber*>*)decomposeNumber:(NSNumber*)number {
    
    long int goal = 0;
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:number, nil];

    
    while (array.count > 0) {
        int current = [[array lastObject] intValue];
        long int current2 = [[array lastObject] intValue];
        [array removeLastObject];
        
        goal = goal + current2 * current2;
        
        for (long int i = current - 1; i > 0; i--) {
            if (goal - i * i >= 0) {
                goal -= i * i;
                NSNumber *someNumber = [NSNumber numberWithLong:i];
                [array addObject:someNumber];
                
                if (goal == 0) {
                    NSArray *finalArray = [[NSArray alloc] initWithArray:array];
                    
                    finalArray = [finalArray sortedArrayUsingSelector: @selector(compare:)];
                    return finalArray;
                }
            }
        }
        
    }
    
    return nil;
}
@end
