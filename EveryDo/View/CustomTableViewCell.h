//
//  CustomTableViewCell.h
//  EveryDo
//
//  Created by Larry Luk on 2017-11-14.
//  Copyright © 2017 Larry Luk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;

@end
