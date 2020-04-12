#import "FullBinaryTrees.h"
#import "TreeNode.h"

@implementation FullBinaryTrees
- (NSString *)stringForNodeCount:(NSInteger)count {
    
    if (count % 2 == 0) {
            return @"[]";
        }
        
        NSMutableString *final = [[NSMutableString alloc] initWithString:@""];
        
        NSMutableArray *result = [self possibleNodes:count];
        
        for (int i = 0; i < result.count; i++) {
            NSMutableString *stringNodes = [[NSMutableString alloc] initWithString:@"["];
            NSString *stringNodes2Part = [self stringForTreeNode:result[i] count:count];
            stringNodes2Part = [stringNodes2Part substringToIndex:stringNodes2Part.length-1];
            [stringNodes appendString:stringNodes2Part];
            [stringNodes appendString:@"] "];
            
            [final appendString:stringNodes];
        }
        
        NSString *finalResult = final;
        finalResult = [finalResult substringToIndex:finalResult.length-1];
        
        if (count == 1) {
            finalResult = @"[[0]]";
        }
        
        return finalResult;
    }

    - (NSMutableArray *)possibleNodes:(NSUInteger)value {
        NSMutableArray *arrayOfTreeNode = [[NSMutableArray alloc] init];
        
        if (value == 1) {
            TreeNode *newNode = [[TreeNode alloc] init:0];
            [arrayOfTreeNode addObject:newNode];
            return arrayOfTreeNode;
        }
        
        for (NSInteger i = 1; i < value; i+=2) {
            for (TreeNode *left in [self possibleNodes:i]) {
                NSInteger i2 = value - 1 - i;
                for (TreeNode *right in [self possibleNodes:i2]) {
                    TreeNode *root = [[TreeNode alloc] init:0];
                    root.left = left;
                    root.right = right;
                    [arrayOfTreeNode addObject:root];
                }
            }
        }
        
        
        
        return arrayOfTreeNode;
    }

    - (NSString *)stringForTreeNode:(TreeNode *)treeNode count:(NSInteger)count {
        NSMutableString *resultString = [[NSMutableString alloc] initWithString:@"0,"];
        
        NSMutableArray *arrayOfNode = [[NSMutableArray alloc] init];
        
        [arrayOfNode addObject:treeNode];
        NSInteger countOfNodeDidPutInArray = 1;
        
        NSInteger countOfCheck = 0;
        
        while (countOfCheck < count) {
            
            countOfCheck += 1;
            
            TreeNode *currentNode = [arrayOfNode firstObject];
            [arrayOfNode removeObjectAtIndex:0];
            
            if (currentNode.left && currentNode.right) {
                [resultString appendString:@"0,0,"];
                [arrayOfNode addObject:currentNode.left];
                [arrayOfNode addObject:currentNode.right];
                
                countOfNodeDidPutInArray += 2;
            } else {
                if (countOfNodeDidPutInArray < count) {
                    [resultString appendString:@"null,null,"];
                }
            }
        }
        
        return resultString;
}
@end
