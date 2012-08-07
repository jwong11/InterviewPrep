//
//  BinarySearchTree.h
//  InterviewPrep
//
//  Created by Jennifer Wong on 12-08-04.
//  Copyright (c) 2012 Jennifer Wong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BinaryNode;

@interface BinarySearchTree : NSObject

- (void)addContent:(NSNumber*)aContent;
- (void)removeNodeWithContent:(NSNumber*)aContent;
- (BinaryNode*)findNodeWithContent:(NSNumber*)aContent;

@end
