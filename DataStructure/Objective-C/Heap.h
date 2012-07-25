//
//  Heap.h
//  InterviewPrep
//
//  Created by Jennifer Wong on 12-07-22.
//  Copyright (c) 2012 Jennifer Wong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Heap : NSObject

- (NSUInteger)count;

- (void)addNode:(NSNumber*)aNode;
- (NSNumber*)pop;

@end
