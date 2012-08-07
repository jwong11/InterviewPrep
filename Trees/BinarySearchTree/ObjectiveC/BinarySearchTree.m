//
//  BinarySearchTree.m
//  InterviewPrep
//
//  Created by Jennifer Wong on 12-08-04.
//  Copyright (c) 2012 Jennifer Wong. All rights reserved.
//

#import "BinarySearchTree.h"

#import "BinaryNode.h"

@interface BinarySearchTree()
@property (nonatomic,strong) BinaryNode* rootNode;
@end

@implementation BinarySearchTree

@synthesize rootNode;

#pragma mark - add

- (void)addContent:(NSNumber*)aContent
{
	if (self.rootNode == nil) {
		self.rootNode = [BinaryNode nodeWithObject:aContent];
	} else {
		[self addChildNode:[BinaryNode nodeWithObject:aContent] toNode:self.rootNode];
	}
}

- (void)addChildNode:(BinaryNode*)aChildNode toNode:(BinaryNode*)aNode
{
	if ([((NSNumber*)aNode.nodeContent) compare:((NSNumber*)aChildNode.nodeContent)] == NSOrderedDescending) {
		if (aNode.leftChild == nil) {
			aChildNode.parent = aNode.leftChild;
			aNode.leftChild = aChildNode;
		} else {
			[self addChildNode:aChildNode toNode:aNode.leftChild];
		}
	} else {
		if (aNode.rightChild == nil) {
			aChildNode.parent = aNode.rightChild;
			aNode.rightChild = aChildNode;
		} else {
			[self addChildNode:aChildNode toNode:aNode.rightChild];
		}
	}
}

#pragma mark - Remove

- (void)removeNodeWithContent:(NSNumber*)aContent
{
	[self removeNodeWithContent:aContent fromNode:self.rootNode];
}

- (void)removeNodeWithContent:(NSNumber*)aContent fromNode:(BinaryNode*)aNode
{
	NSComparisonResult nodeCompareToContent = [((NSNumber*)aNode.nodeContent) compare:aContent];
	if (nodeCompareToContent == NSOrderedSame) {
		if (aNode.leftChild != nil) {
			[self replaceNode:aNode withNode:[self biggestNodeOfTree:aNode.leftChild]];
		} else {
			[self replaceNode:aNode withNode:aNode.rightChild];
		}
	} else if (nodeCompareToContent == NSOrderedAscending) {
		[self removeNodeWithContent:aContent fromNode:aNode.rightChild];
	} else {
		[self removeNodeWithContent:aContent fromNode:aNode.leftChild];
	}
}

- (void)replaceNode:(BinaryNode*)aNodeToReplace withNode:(BinaryNode*)aReplaceWithNode
{
	aReplaceWithNode.parent = aNodeToReplace.parent;
	if (aNodeToReplace.parent.leftChild == aNodeToReplace) {
		aNodeToReplace.parent.leftChild = aReplaceWithNode;
	} else {
		aNodeToReplace.parent.rightChild = aReplaceWithNode;
	}
	aReplaceWithNode.parent = nil;
}

- (BinaryNode*)biggestNodeOfTree:(BinaryNode*)aNode
{
	BinaryNode* result = aNode;
	while (result.rightChild != nil) {
		result = result.rightChild;
	}
	return result;
}

#pragma mark - Find

- (BinaryNode*)findNodeWithContent:(NSNumber*)aContent
{
	return [self findNodeWithContent:aContent fromNode:self.rootNode];
}

- (BinaryNode*)findNodeWithContent:(NSNumber*)aContent fromNode:(BinaryNode*)aNode
{
	BinaryNode* result = nil;
	
	NSComparisonResult nodeCompareToContent = [((NSNumber*)aNode.nodeContent) compare:aContent];
	if (nodeCompareToContent == NSOrderedSame) {
		result = aNode;
	} else if (nodeCompareToContent == NSOrderedAscending) {
		result = [self findNodeWithContent:aContent fromNode:aNode.rightChild];
	} else {
		result = [self findNodeWithContent:aContent fromNode:aNode.leftChild];
	}
	
	return result;
}

@end
