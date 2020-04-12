#import "TelephoneFinder.h"

@implementation TelephoneFinder
- (NSArray <NSString*>*)findAllNumbersFromGivenNumber:(NSString*)number {
    
    NSMutableArray <NSString*> *final = [[NSMutableArray alloc] init];
    
    NSArray *neighborsOfNumbers = @[ @[@8], @[@2, @4], @[@1, @3, @5], @[@2, @6], @[@1, @5, @7], @[@2, @4, @6, @8], @[@3, @5, @9], @[@4, @8], @[@5, @7, @9, @0], @[@6, @8]];
    
    int numberOnNegativeCheck = [number intValue];
    
    if (numberOnNegativeCheck < 0) {
        return nil;
    }
    
    NSMutableArray *numbers = [[NSMutableArray alloc] init];
    
    int n = numberOnNegativeCheck;
    
    while (n != 0){
        NSNumber *number = [NSNumber numberWithInt:n % 10];
        [numbers addObject:number];
        n = n / 10;
    }
    
    NSArray *finalArray = [[numbers reverseObjectEnumerator] allObjects];
    
    for (int i = 0; i < finalArray.count; i++) {
        int finalNumber = [finalArray[i] intValue];
        
        NSArray *neighborsOfNumber = [[NSArray alloc] initWithArray:neighborsOfNumbers[finalNumber]];
        
        for (int k = 0; k < neighborsOfNumber.count; k++) {
            NSRange range = NSMakeRange(i, 1);
            NSString *replacing = [neighborsOfNumber[k] stringValue];
            NSString *options = number;
            options = [options stringByReplacingCharactersInRange: range withString:replacing];
            
            [final addObject:options];
        }
    }
    
    NSArray <NSString*> *result = [[NSArray alloc] initWithArray:final];

    return result;
}
@end
