#import "ArrayCalculator.h"

@implementation ArrayCalculator
+ (NSInteger)maxProductOf:(NSInteger)numberOfItems itemsFromArray:(NSArray *)array {
    
    NSMutableArray *inputArray = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < array.count; i++) {
        if ([array[i] isKindOfClass: [NSNumber class]]) {
            [inputArray addObject:array[i]];
        }
    }
    
    int final = 1;
    NSInteger countOfProduct = numberOfItems;
    
    NSInteger countOfElement = [inputArray count];
    
    if (countOfElement == 0) {
        NSInteger final = 0;
        return final;
    }
    
    if (numberOfItems > countOfElement) {
        countOfProduct = countOfElement;
    }
    
    NSMutableArray *positiveNumbers = [[NSMutableArray alloc] init];
    NSMutableArray *negativeNumbers = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < inputArray.count; i++) {
        int element = [inputArray[i] intValue];
        if (element < 0) {
            NSNumber *negativeNumber = [NSNumber numberWithInt:element];
            [negativeNumbers addObject:negativeNumber];
        }
        NSNumber *positiveNumber = [NSNumber numberWithInt:element];
        [positiveNumbers addObject:positiveNumber];
    }
    
    NSUInteger countOfNegative = negativeNumbers.count;
    NSUInteger countOfPositive = positiveNumbers.count;
    
    if (countOfNegative == 1 && countOfPositive == 1) {
        NSNumber *first = negativeNumbers[0];
        NSNumber *second = positiveNumbers[0];
        
        int value = [first intValue] * [second intValue];
        
        final = final * value;
        
    }
    
    
    while (countOfProduct > 1 && countOfNegative > 1 ) {
        NSNumber *maxNumber = [positiveNumbers valueForKeyPath:@"@max.self"];
        NSUInteger index = [positiveNumbers indexOfObject:maxNumber];
        [positiveNumbers removeObjectAtIndex:index];
        
        NSNumber *maxNumber2 = [positiveNumbers valueForKeyPath:@"@max.self"];
        NSUInteger index2 = [positiveNumbers indexOfObject:maxNumber2];
        [positiveNumbers removeObjectAtIndex:index2];
        
        int maxPositiveValue = [maxNumber intValue] * [maxNumber2 intValue];
        
        
        NSNumber *minNumber = [negativeNumbers valueForKeyPath:@"@min.self"];
        NSUInteger minIndex = [negativeNumbers indexOfObject:minNumber];
        [negativeNumbers removeObjectAtIndex:minIndex];
            
        NSNumber *minNumber2 = [negativeNumbers valueForKeyPath:@"@min.self"];
        NSUInteger minIndex2 = [negativeNumbers indexOfObject:minNumber2];
        [negativeNumbers removeObjectAtIndex:minIndex2];
            
        int maxNegativeValue = [minNumber intValue] * [minNumber2 intValue];
            
        if (maxPositiveValue > maxNegativeValue) {
            final = final * maxPositiveValue;
            [negativeNumbers addObject:minNumber];
            [negativeNumbers addObject:minNumber2];
            countOfProduct -= 2;
        } else {
            final = final * maxNegativeValue;
            [positiveNumbers addObject:maxNumber];
            [positiveNumbers addObject:maxNumber2];
            countOfProduct -= 2;
            countOfNegative -= 2;
        }
    }
    
    while (countOfProduct > 0) {
        NSNumber *maxNumber = [positiveNumbers valueForKeyPath:@"@max.self"];
        NSUInteger index = [positiveNumbers indexOfObject:maxNumber];
        [positiveNumbers removeObjectAtIndex:index];
        
        final = final * [maxNumber intValue];
        countOfProduct -= 1;
    }
    
    
    return final;
}
@end
