//
//  NewsTableViewCell.h
//  NY-Times-ObjC
//
//  Created by Atisha Poojary on 07/02/18.
//  Copyright © 2018 Atisha Poojary. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImage;
@property (weak, nonatomic) IBOutlet UILabel *imageByLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end
