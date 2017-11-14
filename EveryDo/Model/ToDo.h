//
//  ToDo.h
//  EveryDo
//
//  Created by Larry Luk on 2017-11-14.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *toDoDescription;
@property (nonatomic, assign) NSInteger priority;
@property (nonatomic, assign) BOOL isCompleted;


-(instancetype) initWithTitle:(NSString*)title Description:(NSString*)toDoDescription Priority:(NSInteger) priority isComplete:(BOOL)isCompleted;

@end
