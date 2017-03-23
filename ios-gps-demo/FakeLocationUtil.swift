//
//  FakeLocationUtil.swift
//  ios-gps-demo
//
//  Created by Eiji Kushida on 2017/03/23.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

final class FakeLocationUtil {
    
    var delegete: GpsDelegate?
    
    func setup() {}
    
    func start() {
        
        /// 東京タワーの緯度・経度を返す
        delegete?.updateLocation(lat: 35.658581, lng: 139.745433)
    }
}
