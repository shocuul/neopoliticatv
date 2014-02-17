//
//  NewsManager.m
//  NeoPoliticaTV
//
//  Created by NeoPolitica TV on 17/02/14.
//  Copyright (c) 2014 NeoPolitica TV. All rights reserved.
//

#import "NewsManager.h"


@implementation NewsManager

-(void)newsWithSlug:(NSString *)slug{
    NSData *newsInCategory = [[NSData alloc]initWithContentsOfURL:[self urlforSlug:slug]];
    NSError *error;
    NSMutableDictionary *allNews = [NSJSONSerialization JSONObjectWithData:newsInCategory options:kNilOptions error:&error];
    
    if (error) {
        NSLog(@"%@",[error localizedDescription]);
    }else {
        NSArray *posts = allNews[@"posts"];
        for (NSDictionary *thenews in posts) {
            NSLog(@"-------");
            NSLog(@"id:%@", thenews[@"id"]);
            NSLog(@"title:%@",thenews[@"title"]);
            NSLog(@"contenido:%@",thenews[@"content"]);
            NSLog(@"---------");
        }
    }
}

+(NSArray *)validSlug{
    return @[@"local",@"regional",@"estatal",@"nacional",@"internacional",@"np-noticias",@"beat-70",@"neodeportes"];
}

-(NSURL *)urlforSlug:(NSString *)slug{
    if ([[NewsManager validSlug]containsObject:slug]) {
        NSString *validURL = [NSString stringWithFormat:@"http://neopoliticatv.org/?json=get_category_posts&slug=%@",slug];
        return [[NSURL alloc]initWithString:validURL];
    }else{
        return nil;
    }
}

@end
