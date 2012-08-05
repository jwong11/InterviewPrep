//
//  InOrderTraversal.m
//  InterviewPrep
//
//  Created by Jennifer Wong on 12-07-26.
//  Copyright (c) 2012 Jennifer Wong. All rights reserved.
//

#import "InOrderTraversal.h"

#import "BinaryNode.h"

@implementation InOrderTraversal

+ (NSArray*)inorderTraverseTreeWithRootNode:(BinaryNode*)aRootNode
{
	NSMutableArray* result = [NSMutableArray new];
	
	if (aRootNode != nil) {
		if (aRootNode.leftChild != nil) {
			NSArray* leftTreeTraversalResult = [InOrderTraversal inorderTraverseTreeWithRootNode:aRootNode.leftChild];
			[result addObjectsFromArray:leftTreeTraversalResult];
		}
		
		[result addObject:aRootNode.nodeContent];
		
		if (aRootNode.rightChild != nil) {
			NSArray* rightTreeTraversalResult = [InOrderTraversal inorderTraverseTreeWithRootNode:aRootNode.rightChild];
			[result addObjectsFromArray:rightTreeTraversalResult];
		}
	}
	
	return result;
}

@end
