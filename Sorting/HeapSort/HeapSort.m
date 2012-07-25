//
//  HeapSort.m
//  InterviewPrep
//
//  Created by Jennifer Wong on 12-07-22.
//  Copyright (c) 2012 Jennifer Wong. All rights reserved.
//

#import "HeapSort.h"

#import "Heap.h"

@implementation HeapSort

+ (NSArray*)heapSortWithArray:(NSArray*)aArray
{
	Heap* heap = [Heap new];
	
	for (NSNumber* number in aArray) {
		[heap addNode:number];
	}
	
	NSMutableArray* result = [NSMutableArray new];
	while ([heap count] > 0) {
		[result addObject:[heap pop]];
	}
	return result;
}

@end
