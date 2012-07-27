//
//  BinaryNode.h
//  InterviewPrep
//
//  Created by Jennifer Wong on 12-07-25.
//  Copyright (c) 2012 Jennifer Wong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BinaryNode;

@interface BinaryNode : NSObject

@property (nonatomic,strong) BinaryNode* parent;
@property (nonatomic,strong) BinaryNode* leftChild;
@property (nonatomic,strong) BinaryNode* rightChild;
@property (nonatomic,strong) id nodeContent;

+ (BinaryNode*)nodeWithObject:(id)aNodeContent;

@end
