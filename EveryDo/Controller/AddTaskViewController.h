//
//  AddTaskViewController.h
//  EveryDo
//
//  Created by Larry Luk on 2017-11-14.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@protocol AddToDoDelegate <NSObject>

-(void)addToDo:(ToDo*) td;

@end


@interface AddTaskViewController : UIViewController

@property (nonatomic, weak) id<AddToDoDelegate> delegate;

@end
