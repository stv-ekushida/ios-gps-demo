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
    func updateLocation(lat: CLLocationDegrees, lng: CLLocationDegrees)
}

final class LocationUtil: NSObject {

    let locationManager = CLLocationManager()
    var delegete: GpsDelegate?

    func setup() {

        locationManager.delegate = self

        // 取得精度の設定.
        locationManager.desiredAccuracy = kCLLocationAccuracyBest

        // 取得頻度の設定.
        locationManager.distanceFilter = 100

        let status = CLLocationManager.authorizationStatus()

        if(status == .notDetermined) {
            locationManager.requestWhenInUseAuthorization()
        }
    }

    func start() {
        locationManager.startUpdatingLocation()
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
        print("error")
    }
}
