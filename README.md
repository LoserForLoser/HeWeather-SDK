# HeWeather-SDK
一个仿和风天气SDK的代码，附有demo

Pod 支持正在开发中……

 * 当前版本 2018-07-06 1.4.2

 * 写在前面的（废）话

   此项目中用到了 AFN 进行网络请求

   使用时请确保你的项目中有 AFN

   （我网络请求不好，这能求助于第三方了，另外model也是软件生成的，所以整个项目会炒鸡大，如有高人请不吝赐教）

 * 使用时请仔细阅读相关文档

   其他内容这里不做赘述，祝你写 BUG 愉快

 * 友情提示：如果用 .framework 时遇到错误

   dyld: Library not loaded: @rpath/HeWeather.framework/HeWeather
   Referenced from: /var/containers/Bundle/Application/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/xxxx.app/xxxx
   Reason: image not found

   Target ->Build Phases -> Link Binary With Libraries 找到 HEWEATHER.framework，将其默认 "Required" 状态更改为 "Optional" 即可

####声明：本工程 key username 为本人开发及工程Demo所用，开发者需自行申请相关 key username ，严禁使用本Demo中的 key username 用于你自己项目，否则若被官方发现，后续使用出现各类问题需自行承担全部责任，本人概不负责！
