//
//  MasterViewController.m
//  EveryDo
//
//  Created by Larry Luk on 2017-11-14.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDo.h"
#import "CustomTableViewCell.h"

@interface MasterViewController () <UITableViewDataSource>

@property NSMutableArray *objects;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    ToDo *toDo1 = [[ToDo alloc]initWithTitle:@"Kill some aliens." Description:@"Use pew pew gun." Priority:1 isComplete:YES];
    ToDo *toDo2 = [[ToDo alloc]initWithTitle:@"Kill some monsters." Description:@"Use rocket launcher." Priority:3 isComplete:NO];
    ToDo *toDo3 = [[ToDo alloc]initWithTitle:@"Kill some vampires." Description:@"Use holy water." Priority:5 isComplete:YES];
    ToDo *toDo4 = [[ToDo alloc]initWithTitle:@"Kill some bandits." Description:@"Use stun gun." Priority:4 isComplete:NO];
    ToDo *toDo5 = [[ToDo alloc]initWithTitle:@"Kill some ghosts." Description:@"Use proton pack." Priority:2 isComplete:NO];

    self.objects = [@[toDo1, toDo2, toDo3, toDo4, toDo5]mutableCopy];
    
}

- (void)viewWillAppear:(BOOL)animated {
}

- (void)insertNewObject:(id)sender {
    [self performSegueWithIdentifier:@"addTask" sender:self];

}

-(void)addToDo:(ToDo *)td {
    [self.objects addObject:td];
    [self.tableView reloadData];
    
    
    
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDo *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:object];
    } else if ([[segue identifier] isEqualToString:@"addTask"]){
        AddTaskViewController *controller = (AddTaskViewController *)[segue destinationViewController];
        controller.delegate = self;
    }
    
}



#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    ToDo *object = self.objects[indexPath.row];
    cell.titleLabel.text = object.title;
    cell.descriptionLabel.text = object.toDoDescription;
    cell.priorityLabel.text = [NSString stringWithFormat:@"Priority: %ld", object.priority];
    cell.backgroundColor = [UIColor grayColor];
    
    if (object.isCompleted == YES) {
        
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:object.toDoDescription];
        [attributedString addAttribute:NSStrikethroughStyleAttributeName
                                      value:@2
                                      range:NSMakeRange(0, [attributedString length])];
        cell.descriptionLabel.attributedText = attributedString;
        
        
        attributedString = [[NSMutableAttributedString alloc] initWithString:object.title];
        [attributedString addAttribute:NSStrikethroughStyleAttributeName
                                value:@2
                                range:NSMakeRange(0, [attributedString length])];
        cell.titleLabel.attributedText = attributedString;
    }
    return cell;
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewRowAction *editAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Strike" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        ToDo *object = self.objects[indexPath.row];
        object.isCompleted = YES;
        [self.tableView reloadData];
    }];
    editAction.backgroundColor = [UIColor blueColor];
    
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Delete"  handler:^(UITableViewRowAction *action, NSIndexPath *indexPath){
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }];
    deleteAction.backgroundColor = [UIColor redColor];
    return @[deleteAction,editAction];
}


@end
