//
//  StationsFeedTableViewCell.m
//  StationFinder
//
//  Created by Takomborerwa Mazarura on 16/11/2017.
//  Copyright © 2017 SuperAwesomeInc. All rights reserved.
//

#import "StationsFeedTableViewCell.h"

NSString * const kStationsFeedTableViewCellID           = @"StationsFeedTableViewCellId";
NSString * const kStationsFeedTableViewCellCellNibName  = @"StationsFeedTableViewCellNibName";

@implementation StationsFeedTableViewCell

#pragma mark - Configure View (Private)

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (!self) return nil;
    
    [self setupView];
    
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setupView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

- (void)setupView
{
    [self setupMainView];
    
    [self setupSubviews];
}

- (void)setupMainView
{
    [self setBackgroundColor:[UIColor clearColor]];
}

- (void)setupSubviews
{
    [self setupContainerView];
    
    [self setupStationNameLabel];
    
    [self setupDistanceLabel];
}

- (void)setupContainerView
{
    self.containerView = UIView.new;
    
    self.containerView.backgroundColor = kAppWhite;
    
    self.containerView.clipsToBounds = YES;
    
    self.containerView.layer.masksToBounds = YES;
    
    self.containerView.layer.cornerRadius = 4.0f;
    
    [self addSubview:self.containerView];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.left.equalTo(self.mas_left).offset(GenericDistance);
        make.right.equalTo(self.mas_right).offset(-GenericDistance);
        make.bottom.equalTo(self.mas_bottom).offset(-GenericDistance);
    }];
}

- (void)setupStationNameLabel
{
    self.stationName = UILabel.new;

    self.stationName.textColor = kAppDarkGray;
    
    self.stationName.text = @"Station Name";
    
    self.stationName.font = font(kAppFontRegular, 14);
    
    self.stationName.textAlignment = NSTextAlignmentLeft;
    
    self.stationName.numberOfLines = 1;
    
    self.stationName.minimumScaleFactor = 0.5;
    
    self.stationName.adjustsFontSizeToFitWidth = YES;
    
    [self addSubview:self.stationName];
    
    [self.stationName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.containerView.mas_centerY);
        make.left.equalTo(self.containerView.mas_left).offset(GenericDistance);
        make.right.equalTo(self.containerView.mas_centerX);
    }];
}

- (void)setupDistanceLabel
{
    self.distance = UILabel.new;
    
    self.distance.textColor = kAppDarkGray;
    
    self.distance.text = @"0 meters away";
    
    self.distance.font = font(kAppFontRegular, 12);
    
    self.distance.textAlignment = NSTextAlignmentRight;
    
    self.distance.numberOfLines = 1;
    
    self.distance.minimumScaleFactor = 0.5;
    
    self.distance.adjustsFontSizeToFitWidth = YES;
    
    [self addSubview:self.distance];
    
    [self.distance mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.stationName.mas_centerY);
        make.right.equalTo(self.containerView.mas_right).offset(-GenericDistance);
        make.left.equalTo(self.stationName.mas_centerX).offset(GenericDistance);
    }];
}

#pragma mark - Configure View

- (void)configureWithStation:(TubeStation*)station
{
    if (station) {
        
        self.stationName.text   = station.name;
        
        self.distance.text      = [NSString stringWithFormat:@"%d meters away", (int)station.distance];
    }
}

@end
