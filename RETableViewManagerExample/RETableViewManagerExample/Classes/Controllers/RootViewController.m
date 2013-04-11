//
//  RootViewController.m
//  RETableViewManagerExample
//
//  Created by Roman Efimov on 2/28/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "RootViewController.h"
#import "ControlsViewController.h"
#import "ListViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"RETableViewManager";
    __typeof (&*self) __weak weakSelf = self;
	
    // Create manager
    //
    _manager = [[RETableViewManager alloc] init];
    _manager.delegate = self;
    
    // Set delegate and datasource
    //
    self.tableView.dataSource = _manager;
    self.tableView.delegate =  _manager;
    
    // Add sections and items
    //
    RETableViewSection *section = [[RETableViewSection alloc] init];
    [_manager addSection:section];
    
    [section addItem:[RETableViewItem itemWithTitle:@"Forms" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        [weakSelf.tableView deselectRowAtIndexPath:item.indexPath animated:YES];
        [weakSelf.navigationController pushViewController:[[ControlsViewController alloc] initWithStyle:UITableViewStyleGrouped] animated:YES];
    }]];
    
    [section addItem:[RETableViewItem itemWithTitle:@"List" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        [weakSelf.tableView deselectRowAtIndexPath:item.indexPath animated:YES];
        [weakSelf.navigationController pushViewController:[[ListViewController alloc] initWithStyle:UITableViewStylePlain] animated:YES];
    }]];
    
    RETextItem *fullLengthField = [RETextItem itemWithTitle:nil value:nil placeholder:@"Full length text field"];
    [section addItem:fullLengthField];
    
    [section addItem:[RELongTextItem itemWithValue:@"Full length text field" placeholder:@"Enter text"]];
}

@end
