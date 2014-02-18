//
//  NewsManager.m
//  NeoPoliticaTV
//
//  Created by NeoPolitica TV on 17/02/14.
//  Copyright (c) 2014 NeoPolitica TV. All rights reserved.
//

#import "NewsManager.h"
#import "News.h"

@interface NewsManager()
@property (nonatomic,strong) NSMutableArray *newsList;

@end
@implementation NewsManager

-(NSMutableArray *)newsList{
    if (!_newsList) {
        _newsList = [[NSMutableArray alloc]init];
    }
    return _newsList;
}

-(instancetype)initWithSlug:(NSString *)slug{
    self = [super init];
    if (self) {
        NSData *newsInCategory = [[NSData alloc]initWithContentsOfURL:[self urlforSlug:slug]];
        NSError *error;
        NSMutableDictionary *allNews = [NSJSONSerialization JSONObjectWithData:newsInCategory options:kNilOptions error:&error];
        
        if (error) {
            NSLog(@"%@",[error localizedDescription]);
        }else {
            NSArray *posts = allNews[@"posts"];
            for (NSDictionary *thenews in posts) {
                News *temp = [[News alloc]init];
                temp.idNew = [thenews[@"id"]integerValue];
                temp.title = thenews[@"title"];
                temp.content = thenews[@"content"];
                temp.url = thenews[@"url"];
                
                
                //NSLog(@"-------");
                //NSLog(@"id:%@", thenews[@"id"]);
                //NSLog(@"title:%@",thenews[@"title"]);
                //NSLog(@"contenido:%@",thenews[@"content"]);
                // NSLog(@"Extra:%@",thenews[@"attachments"]);
                //NSLog(@"---------");
                for (NSDictionary *images in thenews[@"attachments"]) {
                  //  NSLog(@"Images:%@",images[@"images"]);
                   // NSLog(@"URL:%@",images[@"url"]);
                    temp.image = images[@"url"];
                }
                [self.newsList addObject:temp];
            }
        }
    }
    for (News *log in self.newsList) {
        NSLog(@"%lu",(unsigned long)log.idNew);
    }
    return self;
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
