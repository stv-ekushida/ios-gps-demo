# ios-gps-demo

|category | Version| 
|---|---|
| Swift | 3.0.2 |
| XCode | 8.2 |
| iOS | 10.0〜 |

#### 備忘録
1. CoreLocation.frameworkを追加する
2. Info.plistにNSLocationAlwaysUsageDescriptionとNSLocationWhenInUseUsageDescriptionを追加する

```
	<key>NSLocationAlwaysUsageDescription</key>
	<string>位置情報の取得を、常に許可しますか？</string>
	<key>NSLocationWhenInUseUsageDescription</key>
	<string>位置情報の取得を、このアプリ使用時のみ許可しますか？</string>
  ```
