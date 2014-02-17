//
//  News.h
//  NeoPoliticaTV
//
//  Created by NeoPolitica TV on 17/02/14.
//  Copyright (c) 2014 NeoPolitica TV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject
//Se Agregan los campos que tiene una noticia
@property (nonatomic)NSUInteger idNew;
@property (strong,nonatomic)NSURL *url;
@property (strong,nonatomic)NSString *title;
@property (strong,nonatomic)NSString *content;
@property (strong,nonatomic)NSURL *image;




@end
