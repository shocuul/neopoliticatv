//
//  NewsManager.h
//  NeoPoliticaTV
//
//  Created by NeoPolitica TV on 17/02/14.
//  Copyright (c) 2014 NeoPolitica TV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "News.h"

@interface NewsManager : NSObject
-(void)newsWithSlug:(NSString *)slug;
+(NSArray *)validSlug;

@end
