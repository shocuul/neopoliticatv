//
//  NPFirstViewController.m
//  NeoPoliticaTV
//
//  Created by NeoPolitica TV on 04/02/14.
//  Copyright (c) 2014 NeoPolitica TV. All rights reserved.
//

#import "NPFirstViewController.h"
#import "NewsManager.h"


@interface NPFirstViewController ()

@end

@implementation NPFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NewsManager *news = [[NewsManager alloc]init];
    
    [news newsWithSlug:@"local"];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
