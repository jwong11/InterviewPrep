//
//  BinaryNode.m
//  InterviewPrep
//
//  Created by Jennifer Wong on 12-07-25.
//  Copyright (c) 2012 Jennifer Wong. All rights reserved.
//

#import "BinaryNode.h"

@implementation BinaryNode

+ (BinaryNode*)nodeWithObject:(id)aNodeContent
{
	BinaryNode* result = [BinaryNode new];
	result.nodeContent = aNodeContent;
	return result;
}

@end
