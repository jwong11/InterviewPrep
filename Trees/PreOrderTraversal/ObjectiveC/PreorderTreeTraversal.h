//
//  PreorderTreeTraversal.h
//  InterviewPrep
//
//  Created by Jennifer Wong on 12-07-26.
//  Copyright (c) 2012 Jennifer Wong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BinaryNode;

@interface PreorderTreeTraversal : NSObject

+ (NSArray*)preorderTraverseTreeWithRootNode:(BinaryNode*)aRootNode;

@end
