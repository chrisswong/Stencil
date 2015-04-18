//
//  NSObject+StencilAdditions.m
//  XcodeCustomFileTemplates
//
//  Created by Sam Dods on 18/04/2015.
//  Copyright (c) 2015 Sam Dods. All rights reserved.
//

#import "NSObject+Additions.h"
#import <objc/runtime.h>

@implementation NSObject (StencilAdditions)

+ (NSArray *)stencil_printMethods
{
  uint numberOfMethods;
  Method *methods = class_copyMethodList(self, &numberOfMethods);
  NSMutableArray *methodNames = [NSMutableArray new];
  for (uint m = 0; m < numberOfMethods; m++) {
    Method method = methods[m];
    SEL name = method_getName(method);
    [methodNames addObject:NSStringFromSelector(name)];
  }
  return methodNames.copy;
}

@end
