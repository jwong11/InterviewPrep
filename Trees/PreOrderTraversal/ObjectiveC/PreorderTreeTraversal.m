//
//  PreorderTreeTraversal.m
//  InterviewPrep
//
//  Created by Jennifer Wong on 12-07-26.
//  Copyright (c) 2012 Jennifer Wong. All rights reserved.
//

#import "PreorderTreeTraversal"

#import "BinaryNode.h"

@implementation PreorderTreeTraversal

+ (NSArray*)preorderTraverseTreeWithRootNode:(BinaryNode*)aRootNode
{
	NSMutableArray* result = [NSMutableArray new];
	
	if (aRootNode != nil) {
		[result addObject:aRootNode.nodeContent];
		
		if (aRootNode.leftChild != nil) {
			NSArray* leftTreeTraversalResult = [TreeTraversal preorderTraverseTreeWithRootNode:aRootNode.leftChild];
			[result addObjectsFromArray:leftTreeTraversalResult];
		}
		
		if (aRootNode.rightChild != nil) {
			NSArray* rightTreeTraversalResult = [TreeTraversal preorderTraverseTreeWithRootNode:aRootNode.rightChild];
			[result addObjectsFromArray:rightTreeTraversalResult];
		}
	}
	
	return result;
}

@end
