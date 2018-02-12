//
//  NewsModel.h
//  NY-Times-ObjC
//
//  Created by Atisha Poojary on 07/02/18.
//  Copyright © 2018 Atisha Poojary. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

@property (strong) NSString *title;
@property (strong) NSString *format;
@property (strong) NSString *publishedDate;
@property (strong) NSString *byline;
@property (strong) NSString *abstract;
@property (strong) NSString *url;

- (id)initWithTitle:(NSString*)title publishedDate:(NSString*)publishedDate byline:(NSString*)byline format:(NSString*)format abstract:(NSString*)abstract url:(NSString*)url;

@end
