//
//  TreeNode.m
//  RSSchool_T4
//
//  Created by Artemy Podlessky on 4/13/20.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import "TreeNode.h"

@implementation TreeNode

-(instancetype)init:(int)value {
    
    self = [super init];
    if (self) {
        _value = value;
        _left = NULL;
        _right = NULL;
    }
    return self;
}

@end
