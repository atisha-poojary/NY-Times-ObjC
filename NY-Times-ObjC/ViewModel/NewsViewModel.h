//
//  NewsViewModel.h
//  NY-Times-ObjC
//
//  Created by Atisha Poojary on 07/02/18.
//  Copyright © 2018 Atisha Poojary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsModel.h"

@interface NewsViewModel : NSObject

@property (nonatomic, strong) NSMutableArray *newsArray;

- (void)initWithNews:(NSMutableArray *)newsArray;
- (void)getNews:(NSString *)urlString completionHandler:(void (^)(NSArray *array))completionHandler ;
- (NSInteger)numberOfItemsInSection:(NSInteger)section;
- (void)downloadImageWithURL:(NSString *)urlString completionHandler:(void (^)(NSData *data))completionHandler;

@end
