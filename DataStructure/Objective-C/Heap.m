//
//  Heap.m
//  InterviewPrep
//
//  Created by Jennifer Wong on 12-07-22.
//  Copyright (c) 2012 Jennifer Wong. All rights reserved.
//

#import "Heap.h"

@interface Heap()
@property (nonatomic,strong) NSMutableArray* heap;
@end

@implementation Heap

@synthesize heap;

- (id)init
{
	self = [super init];
	if (self != nil) {
		heap = [NSMutableArray new];
	}
	return self;
}

#pragma mark

- (void)addNode:(NSNumber*)aNode
{
	[self.heap addObject:aNode];
	[self bubbleUpNode:aNode];
}

- (NSNumber*)pop
{
	NSNumber* result = nil;
	if ([self.heap count] > 1) {
		[self.heap exchangeObjectAtIndex:0 withObjectAtIndex:([self.heap count] - 1)];
		
		result = [self.heap lastObject];
		[self.heap removeLastObject];
		
		[self bubbleDown:[self.heap objectAtIndex:0]];
	} else if ([self.heap count] > 0) {
		result = [self.heap lastObject];
		[self.heap removeLastObject];
	}
	return result;
}

#pragma mark

- (void)bubbleUpNode:(NSNumber*)aNode
{
	if ([self.heap indexOfObject:aNode] != 0) {
		NSUInteger parentIndex = [self parentIndexOfNode:aNode];
		NSNumber* parentNode = [self.heap objectAtIndex:parentIndex];
		if ([parentNode compare:aNode] == NSOrderedDescending) {
			NSUInteger aNodeIndex = [self.heap indexOfObject:aNode];
			[self.heap exchangeObjectAtIndex:parentIndex withObjectAtIndex:aNodeIndex];
			[self bubbleUpNode:aNode];
		}
	}
}

- (void)bubbleDown:(NSNumber*)aNode
{
	NSUInteger aNodeIndex = [self.heap indexOfObject:aNode];
	NSUInteger leftChildIndex = [self leftChildIndexOfNode:aNode];
	NSUInteger rightChildIndex = [self rightChildIndexOfNode:aNode];
	
	BOOL leftChildExist = ([self.heap count] > leftChildIndex);
	BOOL rightChildExist = ([self.heap count] > rightChildIndex);
	
	BOOL swapHappened = NO;
	
	
	if (leftChildExist && rightChildExist) {
		NSNumber* leftChild = [self.heap objectAtIndex:leftChildIndex];
		NSNumber* rightChild = [self.heap objectAtIndex:rightChildIndex];
		
		if ([leftChild compare:rightChild] == NSOrderedAscending) {
			if ([leftChild compare:aNode] == NSOrderedAscending) {
				[self.heap exchangeObjectAtIndex:leftChildIndex withObjectAtIndex:aNodeIndex];
				swapHappened = YES;
			}
		} else {
			if ([rightChild compare:aNode] == NSOrderedAscending) {
				[self.heap exchangeObjectAtIndex:rightChildIndex withObjectAtIndex:aNodeIndex];
				swapHappened = YES;
			}
		}
	} else if (leftChildExist) {
		NSNumber* leftChild = [self.heap objectAtIndex:leftChildIndex];
		if ([leftChild compare:aNode] == NSOrderedAscending) {
			[self.heap exchangeObjectAtIndex:leftChildIndex withObjectAtIndex:aNodeIndex];
			swapHappened = YES;
		}
	}
	
	if (swapHappened) {
		[self bubbleDown:aNode];
	}
}

#pragma mark - Parent and Child Index

- (NSUInteger)parentIndexOfNode:(NSNumber*)aNode
{
	NSUInteger aNodeIndex = [self.heap indexOfObject:aNode];
	return ((aNodeIndex - 1) / 2);
}

- (NSUInteger)leftChildIndexOfNode:(NSNumber*)aNode
{
	NSUInteger aNodeIndex = [self.heap indexOfObject:aNode];
	return (2 * aNodeIndex + 1);
}

- (NSUInteger)rightChildIndexOfNode:(NSNumber*)aNode
{
	NSUInteger aNodeIndex = [self.heap indexOfObject:aNode];
	return (2 * aNodeIndex + 2);
}

#pragma mark

- (NSUInteger)count
{
	return [self.heap count];
}

@end
