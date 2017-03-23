//
//  LocationUtil.swift
//  ios-gps-demo
//
//  Created by Eiji Kushida on 2016/12/27.
//  Copyright © 2016年 Eiji Kushida. All rights reserved.
//

import UIKit
import CoreLocation

protocol GpsDelegate {
    func updateLocation(lat: Double, lng: Double)
    func failure(error: Error)
}

final class LocationUtil: NSObject {

    let locationManager = CLLocationManager()
    var delegete: GpsDelegate?
    
    func setup() {
        
        locationManager.delegate = self
        updatedesiredAccuracy(desiredAccuracy: kCLLocationAccuracyBest)
        updateDistanceFilter(distanceFilter: 100.0)
        
        let status = CLLocationManager.authorizationStatus()
        
        if(status == .notDetermined) {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func start() {
        locationManager.startUpdatingLocation()
    }
    
    /// 取得精度を設定する
    func updatedesiredAccuracy(desiredAccuracy: CLLocationAccuracy) {
        locationManager.desiredAccuracy = desiredAccuracy
    }
    
    /// 取得頻度を設定する
    func updateDistanceFilter(distanceFilter: CLLocationDistance) {
        locationManager.distanceFilter = distanceFilter
    }
}

//MARK: - CLLocationManagerDelegate
extension LocationUtil: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {

        guard let location = manager.location else {
            fatalError("locationがni.")
        }

        let lat = location.coordinate.latitude
        let lng = location.coordinate.longitude
        delegete?.updateLocation(lat: lat, lng: lng)
    }

    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error){
        delegete?.failure(error: error)
    }
}
