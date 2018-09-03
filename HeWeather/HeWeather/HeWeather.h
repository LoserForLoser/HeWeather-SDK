//
//  HeWeather.h
//  HeWeather
//
//  Created by 宋朝阳 on 2018/5/28.
//  Copyright © 2018年 Song. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for HeWeather.
FOUNDATION_EXPORT double HeWeatherVersionNumber;

//! Project version string for HeWeather.
FOUNDATION_EXPORT const unsigned char HeWeatherVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <HeWeather/PublicHeader.h>

/* 当前版本 2018-07-06 1.4.2 */

/**
 * 写在前面的（废）话
 *
 * 此项目中用到了 AFN 进行网络请求
 *
 * 使用时请确保你的项目中有 AFN
 */

/**
 * 使用时请仔细阅读相关文档
 *
 * 其他内容这里不做赘述，祝你写 BUG 愉快
 */

/**
 * 友情提示：如果遇到错误
 * dyld: Library not loaded: @rpath/HeWeather.framework/HeWeather
 * Referenced from: /var/containers/Bundle/Application/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/xxxx.app/xxxx
 * Reason: image not found
 *
 * Target ->Build Phases -> Link Binary With Libraries 找到 HEWEATHER.framework，将其默认 "Required" 状态更改为 "Optional" 即可
 */

#import <HEWEATHER/AllWeatherInquieirs.h>
#import <HEWEATHER/DataBaseClasses.h>


