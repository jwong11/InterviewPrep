//
//  InsertionSort.m
//  InterviewPrep
//
//  Created by Jennifer Wong on 12-07-20.
//  Copyright (c) 2012 Jennifer Wong. All rights reserved.
//

#import "InsertionSort.h"

@implementation InsertionSort

+ (NSArray*)insertionSortWithArray:(NSArray*)aArray
{
	NSMutableArray* result = [NSMutableArray new];
	for (NSNumber* num in aArray) {
		BOOL inserted = NO;
		
		for (NSInteger i = 0; i + 1 < [result count]; i++) {
			if (!inserted) {
				NSComparisonResult nextNumberComparisonResult = [num compare:[result objectAtIndex:(i + 1)]];
				NSComparisonResult currentNumberComparisonResult = [num compare:[result objectAtIndex:i]];
				BOOL lessThanOrEqualNextNumber = (nextNumberComparisonResult == NSOrderedAscending || nextNumberComparisonResult == NSOrderedSame);
				BOOL greaterThanOrEqualToCurrentNumber = (currentNumberComparisonResult == NSOrderedDescending || currentNumberComparisonResult == NSOrderedSame);
				
				if (lessThanOrEqualNextNumber && greaterThanOrEqualToCurrentNumber) {
					[result insertObject:num atIndex:(i + 1)];
					inserted = YES;
				}
			}
		}
		
		if (!inserted) {
			BOOL insertAsSecondLast = ([result count] > 0? ([num compare:[result lastObject]] == NSOrderedAscending) : NO);

			if (insertAsSecondLast) {
				[result insertObject:num atIndex:([result count] - 1)];
			} else {
				[result addObject:num];
			}
		}
	}
	return result;
}

@end
