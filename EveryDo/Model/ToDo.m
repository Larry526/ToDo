//
//  ToDo.m
//  EveryDo
//
//  Created by Larry Luk on 2017-11-14.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

-(instancetype)initWithTitle:(NSString *)title Description:(NSString *)toDoDescription Priority:(NSInteger)priority isComplete:(BOOL)isCompleted {
    if (self = [super init]) {
        _title = title;
        _toDoDescription = toDoDescription;
        _priority = priority;
        _isCompleted = isCompleted;
    }
    return self;
}




@end
