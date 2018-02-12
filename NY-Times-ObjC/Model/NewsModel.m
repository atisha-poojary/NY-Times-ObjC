//
//  NewsModel.m
//  NY-Times-ObjC
//
//  Created by Atisha Poojary on 07/02/18.
//  Copyright © 2018 Atisha Poojary. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel

@synthesize format = _format;
@synthesize publishedDate = _publishedDate;
@synthesize byline = _byline;
@synthesize title = _title;
@synthesize abstract = _abstract;
@synthesize url = _url;

//synthesized instance variables
- (id)initWithTitle:(NSString*)title publishedDate:(NSString*)publishedDate byline:(NSString*)byline format:(NSString*)format abstract:(NSString*)abstract url:(NSString*)url{
    if ((self = [super init])) {
        self.title = _title;
        self.format = _format;
        self.publishedDate = _publishedDate;
        self.byline = _byline;
        self.abstract = _abstract;
        self.url = _url;
    }
    return self;
}

@end
