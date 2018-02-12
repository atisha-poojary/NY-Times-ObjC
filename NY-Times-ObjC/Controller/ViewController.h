//
//  ViewController.h
//  NY-Times-ObjC
//
//  Created by Atisha Poojary on 06/02/18.
//  Copyright © 2018 Atisha Poojary. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsViewModel;
@class NewsModel;

@interface ViewController : UIViewController

@property (nonatomic, strong) NewsViewModel *viewModel;
@property (nonatomic, strong) NewsModel *newsModel;

@end

