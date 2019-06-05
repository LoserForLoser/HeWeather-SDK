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
    allWeather.userType = USER_TYPE_FREE_USER;
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
    [allWeather weatherWithInquireType:inquireType response:^(id  _Nullable responseObject, NSError * _Nullable error) {
        switch (inquireType) {
            case INQUIRE_TYPE_WEATHER_FORECAST:{
                WeatherForecastModel *weatherForecastModel = responseObject;
                NSLog(@"%@", weatherForecastModel);
            }
                break;
            case INQUIRE_TYPE_WEATHER_NOW:{
                WeatherNowModel *weatherNowModel = responseObject;
                NSLog(@"%@", weatherNowModel);
            }
                break;
            case INQUIRE_TYPE_WEATHER_HOURLY:{
                WeatherHourlyModel *weatherHourlyModel = responseObject;
                NSLog(@"%@", weatherHourlyModel);
            }
                break;
            case INQUIRE_TYPE_WEATHER_LIFESTYLE:{
                WeatherLifestyleModel *weatherLifestyleModel = responseObject;
                NSLog(@"%@", weatherLifestyleModel);
            }
                break;
            case INQUIRE_TYPE_WEATHER:{
                WeatherModel *weatherModel = responseObject;
                NSLog(@"%@", weatherModel);
            }
                break;
            case INQUIRE_TYPE_WEATHER_GRID_MINUTE:{
                WeatherGridMinuteModel *weatherGridMinuteModel = responseObject;
                NSLog(@"%@", weatherGridMinuteModel);
            }
                break;
            case INQUIRE_TYPE_WEATHER_GRID_NOW:{
                WeatherGridNowModel *weatherGridNowModel = responseObject;
                NSLog(@"%@", weatherGridNowModel);
            }
                break;
            case INQUIRE_TYPE_WEATHER_GRID_FORECAST:{
                WeatherGridForecastModel *weatherGridForecastModel = responseObject;
                NSLog(@"%@", weatherGridForecastModel);
            }
                break;
            case INQUIRE_TYPE_WEATHER_GRID_HOURLY:{
                WeatherGridHourlyModel *weatherGridHourlyModel = responseObject;
                NSLog(@"%@", weatherGridHourlyModel);
            }
                break;
            case INQUIRE_TYPE_ALARM:{
                AlarmModel *alarmModel = responseObject;
                NSLog(@"%@", alarmModel);
            }
                break;
            case INQUIRE_TYPE_ALARM_ALL:{
                AlarmAllModel *alarmAllModel = responseObject;
                NSLog(@"%@", alarmAllModel);
            }
                break;
            case INQUIRE_TYPE_SCENIC:{
                ScenicModel *scenicModel = responseObject;
                NSLog(@"%@", scenicModel);
            }
                break;
            case INQUIRE_TYPE_AIR_NOW:{
                AirNowModel *airNowModel = responseObject;
                NSLog(@"%@", airNowModel);
            }
                break;
            case INQUIRE_TYPE_AIR_FORECAST:{
                AirForecastModel *airForecastModel = responseObject;
                NSLog(@"%@", airForecastModel);
            }
                break;
            case INQUIRE_TYPE_AIR_HOURLY:{
                AirHourlyModel *airHourlyModel = responseObject;
                NSLog(@"%@", airHourlyModel);
            }
                break;
            case INQUIRE_TYPE_AIR:{
                AirModel *airModel = responseObject;
                NSLog(@"%@", airModel);
            }
                break;
            case INQUIRE_TYPE_WEATHER_HISTORICAL:{
                WeatherHistoricalModel *weatherHistoricalModel = responseObject;
                NSLog(@"%@", weatherHistoricalModel);
            }
                break;
            case INQUIRE_TYPE_SOLAR_SUNRISE_SUNSET:{
                SolarSunriseSunsetModel *solarSunriseSunsetModel = responseObject;
                NSLog(@"%@", solarSunriseSunsetModel);
            }
                break;
            case INQUIRE_TYPE_MAP_CLOUD_MAP:{
                NSLog(@"图片URL：%@", responseObject);
            }
                break;
            case INQUIRE_TYPE_SOLAR_ELEVATION_ANGLR:{
                SolarElevationAngleModel *solarElevationAngleModel = responseObject;
                NSLog(@"%@", solarElevationAngleModel);
            }
                break;
            case INQUIRE_TYPE_SEARCH:{
                SearchModel *searchModel = responseObject;
                NSLog(@"%@", searchModel);
            }
                break;
            case INQUIRE_TYPE_FIND:{
                FindModel *findModel = responseObject;
                NSLog(@"%@", findModel);
            }
                break;
            case INQUIRE_TYPE_TOP:{
                TopModel *topModel = responseObject;
                NSLog(@"%@", topModel);
            }
                break;
                
            default: {
                NSLog(@"%@", responseObject);
            }
                break;
        }
        
        NSLog(@"%@", error.userInfo);

    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
