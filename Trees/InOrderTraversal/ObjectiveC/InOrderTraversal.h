//
//  InOrderTraversal.h
//  InterviewPrep
//
//  Created by Jennifer Wong on 12-07-26.
//  Copyright (c) 2012 Jennifer Wong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BinaryNode;

@interface InOrderTraversal : NSObject

+ (NSArray*)inorderTraverseTreeWithRootNode:(BinaryNode*)aRootNode;

@end
