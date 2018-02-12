//
//  ViewController.m
//  NY-Times-ObjC
//
//  Created by Atisha Poojary on 06/02/18.
//  Copyright © 2018 Atisha Poojary. All rights reserved.
//

#import "ViewController.h"
#import "NewsViewModel.h"
#import "NewsTableViewCell.h"
@class NewsModel;

static NSString *apiKey = @"4ff00b29642f478cb1e55487aa7dd1f7";
static NSString *limit = @"2";
static NSString *offset = @"2";
static NSString *cellIdentifier = @"customCell";

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *newsTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewModel = [[NewsViewModel alloc] init];
    NSMutableArray *newsArray = [[NSMutableArray alloc] init];
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@%@%@%@%@", @"http://api.nytimes.com/svc/news/v3/content/all/all.json?limit=", limit, @"&offset=", offset, @"&api-key=", apiKey];
    
    //__weak typeof (self) weakSelf = self;
    
    [self.viewModel getNews:urlString completionHandler:^(NSArray *array){
        for(int i = 0; i < array.count; i++){
            NSDictionary *dict = [array objectAtIndex:i];
            
            self.newsModel = [[NewsModel alloc] init];
            
            if(![[dict objectForKey:@"title"] isEqual:nil]){
               self.newsModel.title =  [dict objectForKey:@"title"];
            }
            else{
                self.newsModel.title = @"";
            }
            
            if(![[dict objectForKey:@"multimedia"] isEqual:nil]){
                NSArray *multimediaArray = [dict objectForKey:@"multimedia"];
                for(int j = 0; j < multimediaArray.count; j++){
                    NSDictionary *multimediaDict = [multimediaArray objectAtIndex:j];
                    
                    if(![[multimediaDict objectForKey:@"format"] isEqual:nil]){
                        NSString *format = [multimediaDict objectForKey:@"format"];
                        if ([format isEqual: @"mediumThreeByTwo440"]) {
                            self.newsModel.url = [multimediaDict objectForKey:@"url"];
                        }
                    }
                }
            }
            else{
                self.newsModel.url = @"";
            }
            [newsArray addObject:self.newsModel];
        }
        [self.viewModel initWithNews:newsArray];
        dispatch_async(dispatch_get_main_queue(),^{[self.newsTableView reloadData];});
    }];
}


#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsTableViewCell *cell = (NewsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.tag = indexPath.row;
    if (cell != nil){
        [self configureCell:cell atIndexPath:indexPath];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfItemsInSection:section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)configureCell:(NewsTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath{
    self.newsModel = (NewsModel *)[[self.viewModel newsArray] objectAtIndex:indexPath.row];
    cell.descriptionLabel.text = self.newsModel.title;

    if (![self.newsModel.url isEqualToString:@""]){
        [self.viewModel downloadImageWithURL:self.newsModel.url completionHandler:^(NSData *data){
            dispatch_async(dispatch_get_main_queue(),^{
                if (cell.tag == indexPath.row) {
                    cell.thumbnailImage.image = [UIImage imageWithData:data];
                    [cell setNeedsLayout];
                }
            });
        }];
    }
}

@end
