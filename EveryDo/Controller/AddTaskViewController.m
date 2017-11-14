//
//  AddTaskViewController.m
//  EveryDo
//
//  Created by Larry Luk on 2017-11-14.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

#import "AddTaskViewController.h"

@interface AddTaskViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleInput;
@property (weak, nonatomic) IBOutlet UITextField *descriptionInput;
@property (weak, nonatomic) IBOutlet UITextField *priorityInput;

@end

@implementation AddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addTaskPressed:(UIButton *)sender {
    ToDo *tdAdd = [[ToDo alloc]initWithTitle:self.titleInput.text Description:self.descriptionInput.text Priority:[self.priorityInput.text intValue] isComplete:NO];
    [self.delegate addToDo:tdAdd];
    [self.navigationController popViewControllerAnimated:YES];
}



@end
