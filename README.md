# ios-gps-demo

## Table Of Contents
ターゲットをios-gps-demo(FAKE)を選択して実行すると、FakeLocationUtilが呼ばれる

| クラス名 | 説明 |
|---|---|
| LocationUtil | 位置情報を取得するクラス郡 |
| [FakeLocationUtil](https://github.com/stv-ekushida/ios-gps-demo/blob/master/ios-gps-demo/FakeLocationUtil.swift) | 位置情報を取得するクラス郡（東京タワーの位置情報を静的に返す） |

## 備忘録
1. CoreLocation.frameworkを追加する
2. Info.plistにNSLocationAlwaysUsageDescriptionとNSLocationWhenInUseUsageDescriptionを追加する

```
	<key>NSLocationAlwaysUsageDescription</key>
	<string>位置情報の取得を、常に許可しますか？</string>
	<key>NSLocationWhenInUseUsageDescription</key>
	<string>位置情報の取得を、このアプリ使用時のみ許可しますか？</string>
  ```

## 開発環境

|category | Version| 
|---|---|
| Swift | 3.0.2 |
| XCode | 8.2 |
| iOS | 10.0〜 |
