//
//  NPMenuViewController.m
//  NeoPoliticaTV
//
//  Created by NeoPolitica TV on 18/02/14.
//  Copyright (c) 2014 NeoPolitica TV. All rights reserved.
//

#import "NPMenuViewController.h"
#import "UIViewController+ECSlidingViewController.h"

@interface NPMenuViewController ()
@property (nonatomic,strong)NSArray *menuItems;
@property (nonatomic,strong)UINavigationController *transitionNavigationController;
@end

@implementation NPMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.transitionNavigationController = (UINavigationController *)self.slidingViewController.topViewController;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}


#pragma mark - Propiedades

-(NSArray *)menuItems{
    if (_menuItems) return _menuItems;
    
    _menuItems = @[@"Transitions",@"Settings"];
    
    return _menuItems;
    
}
#pragma - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.menuItems.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"MenuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSString *menuItem = self.menuItems[indexPath.row];
    
    cell.textLabel.text = menuItem;
    [cell setBackgroundColor:[UIColor clearColor]];
    return cell;
}

@end
