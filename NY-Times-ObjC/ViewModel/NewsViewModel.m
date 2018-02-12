//
//  NewsViewModel.m
//  NY-Times-ObjC
//
//  Created by Atisha Poojary on 07/02/18.
//  Copyright © 2018 Atisha Poojary. All rights reserved.
//

#import "NewsViewModel.h"

@implementation NewsViewModel

- (void)initWithNews:(NSMutableArray *)newsArray{
    self.newsArray = newsArray;
}

#pragma mark - Public Methods
- (void)getNews:(NSString *)urlString completionHandler:(void (^)(NSArray *array))completionHandler {
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if(!error){
            NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*) response;
            if (httpResp.statusCode == 200) {
                NSMutableDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                NSArray *resultArray = [jsonObject objectForKey:@"results"];
                completionHandler(resultArray);
            }
        }
        completionHandler(nil);
    }];
    [dataTask resume];
}

- (void)downloadImageWithURL:(NSString *)urlString completionHandler:(void (^)(NSData *data))completionHandler{
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
        if (imageData) {
            completionHandler(imageData);
        }
    });
}

-(NSInteger)numberOfItemsInSection:(NSInteger)section {
    return self.newsArray.count;
}

@end



