//
//  NPSidebarViewController.m
//  NeoPoliticaTV
//
//  Created by NeoPolitica TV on 19/02/14.
//  Copyright (c) 2014 NeoPolitica TV. All rights reserved.
//

#import "NPSidebarViewController.h"
#import "SWRevealViewController.h"
#import "NPNewsViewController.h"

@interface NPSidebarViewController ()
@property (nonatomic,strong)NSArray *menuItems;
@end

@implementation NPSidebarViewController

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
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"menubackground"]];
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"menubackground"]];
    self.tableView.separatorColor = [UIColor colorWithWhite:0.15f alpha:0.2f];
    _menuItems = @[@"title",@"noticias",@"videos",@"extracoatza"];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.menuItems count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier = [self.menuItems objectAtIndex:indexPath.row];
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    return cell;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
