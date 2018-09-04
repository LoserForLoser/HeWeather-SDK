//
//  ViewController.m
//  HeWeatherDemo
//
//  Created by 宋朝阳 on 2018/8/15.
//  Copyright © 2018年 宋朝阳. All rights reserved.
//

#import "ViewController.h"
#import "AllWeatherInquieirs.h"
#import "DataBaseClasses.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

{
    AllWeatherInquieirs *allWeather;
}
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, copy) NSArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    allWeather = [AllWeatherInquieirs sharedInstance];
    allWeather.userType = USER_TYPE_USER;
    allWeather.location = @"beijing";
    allWeather.date = @"20180526";
    allWeather.time = @"1200";
    allWeather.tz = @"8";
    allWeather.lat = @"40.063095";
    allWeather.lon = @"116.302532";
    allWeather.alt = @"43";
    allWeather.languageType = LANGUAGE_TYPE_EN;
    allWeather.modeType = MODE_TYPE_EQUAL;
    allWeather.group = @"world";
    allWeather.number = 10;
    
    self.dataSource = @[@"3-10天天气预报", @"实况天气", @"逐小时预报", @"生活指数", @"常规天气数据集合", @"分钟级降雨（邻近预报）", @"格点实况天气", @"格点7天预报", @"格点逐小时预报", @"天气灾害预警", @"天气灾害预警集合", @"景点天气预报", @"空气质量实况", @"空气质量7天预报", @"空气质量逐小时预报", @"空气质量数据集合", @"历史天气", @"日出日落", @"卫星云图", @"太阳高度", @"城市查询", @"城市搜索", @"热门城市列表"];
    
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
    self.table.tableHeaderView = [UIView new];
    self.table.tableFooterView = [UIView new];
    [self.table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.view addSubview:self.table];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    INQUIRE_TYPE inquireType = indexPath.row + 1;
    [self weatherRequestWithType:inquireType];
}

- (void)weatherRequestWithType:(INQUIRE_TYPE)inquireType {
    [allWeather weatherWithInquireType:inquireType WithSuccess:^(id responseObject) {
        
        switch (inquireType) {
            case INQUIRE_TYPE_WEATHER_FORECAST:{
                WeatherForecastBaseClass *weatherForecastBC = responseObject;
                NSLog(@"%@", weatherForecastBC);
            }
                break;
            case INQUIRE_TYPE_WEATHER_NOW:{
                WeatherNowBaseClass *weatherNowBC = responseObject;
                NSLog(@"%@", weatherNowBC);
            }
                break;
            case INQUIRE_TYPE_WEATHER_HOURLY:{
                WeatherHourlyBaseClass *weatherHourlyBC = responseObject;
                NSLog(@"%@", weatherHourlyBC);
            }
                break;
            case INQUIRE_TYPE_WEATHER_LIFESTYLE:{
                WeatherLifestyleBaseClass *weatherLifestyletBC = responseObject;
                NSLog(@"%@", weatherLifestyletBC);
            }
                break;
            case INQUIRE_TYPE_WEATHER:{
                WeatherBaseClass *weatherBC = responseObject;
                NSLog(@"%@", weatherBC);
            }
                break;
            case INQUIRE_TYPE_WEATHER_GRID_MINUTE:{
                WeatherGridMinuteBaseClass *weatherGridMinuteBC = responseObject;
                NSLog(@"%@", weatherGridMinuteBC);
            }
                break;
            case INQUIRE_TYPE_WEATHER_GRID_NOW:{
                WeatherGridNowBaseClass *weatherGridNowBC = responseObject;
                NSLog(@"%@", weatherGridNowBC);
            }
                break;
            case INQUIRE_TYPE_WEATHER_GRID_FORECAST:{
                WeatherGridForecastBaseClass *weatherGridForecastBC = responseObject;
                NSLog(@"%@", weatherGridForecastBC);
            }
                break;
            case INQUIRE_TYPE_WEATHER_GRID_HOURLY:{
                WeatherGridHourlyBaseClass *weatherGridHourlyBC = responseObject;
                NSLog(@"%@", weatherGridHourlyBC);
            }
                break;
            case INQUIRE_TYPE_ALARM:{
                AlarmBaseClass *alarmBC = responseObject;
                NSLog(@"%@", alarmBC);
            }
                break;
            case INQUIRE_TYPE_ALARM_ALL:{
                AlarmAllBaseClass *alarmAllBC = responseObject;
                NSLog(@"%@", alarmAllBC);
            }
                break;
            case INQUIRE_TYPE_SCENIC:{
                ScenicBaseClass *scenicBC = responseObject;
                NSLog(@"%@", scenicBC);
            }
                break;
            case INQUIRE_TYPE_AIR_NOW:{
                AirNowBaseClass *airNowBC = responseObject;
                NSLog(@"%@", airNowBC);
            }
                break;
            case INQUIRE_TYPE_AIR_FORECAST:{
                AirForecastBaseClass *airForecastBC = responseObject;
                NSLog(@"%@", airForecastBC);
            }
                break;
            case INQUIRE_TYPE_AIR_HOURLY:{
                AirHourlyBaseClass *airHourlyBC = responseObject;
                NSLog(@"%@", airHourlyBC);
            }
                break;
            case INQUIRE_TYPE_AIR:{
                AirBaseClass *airForecastBC = responseObject;
                NSLog(@"%@", airForecastBC);
            }
                break;
            case INQUIRE_TYPE_WEATHER_HISTORICAL:{
                WeatherHistoricalBaseClass *weatherHistoricalBC = responseObject;
                NSLog(@"%@", weatherHistoricalBC);
            }
                break;
            case INQUIRE_TYPE_SOLAR_SUNRISE_SUNSET:{
                SolarSunriseSunsetBaseClass *solarSunriseSunsetBC = responseObject;
                NSLog(@"%@", solarSunriseSunsetBC);
            }
                break;
            case INQUIRE_TYPE_MAP_CLOUD_MAP:{
                NSLog(@"图片URL：%@", responseObject);
            }
                break;
            case INQUIRE_TYPE_SOLAR_ELEVATION_ANGLR:{
                SolarElevationAngleBaseClass *solarElevationAngleBC = responseObject;
                NSLog(@"%@", solarElevationAngleBC);
            }
                break;
            case INQUIRE_TYPE_SEARCH:{
                SearchBaseClass *searchBC = responseObject;
                NSLog(@"%@", searchBC);
            }
                break;
            case INQUIRE_TYPE_FIND:{
                FindBaseClass *findBC = responseObject;
                NSLog(@"%@", findBC);
            }
                break;
            case INQUIRE_TYPE_TOP:{
                TopBaseClass *topBC = responseObject;
                NSLog(@"%@", topBC);
            }
                break;
                
            default: {
                NSLog(@"%@", responseObject);
            }
                break;
        }
        
    } faileureForError:^(NSError *error) {
        NSLog(@"%@", error.userInfo);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
