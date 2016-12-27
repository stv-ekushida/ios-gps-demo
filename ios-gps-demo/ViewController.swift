//
//  ViewController.swift
//  ios-gps-demo
//
//  Created by Eiji Kushida on 2016/12/27.
//  Copyright © 2016年 Eiji Kushida. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    let manager = LocationUtil()

    override func viewDidLoad() {
        super.viewDidLoad()

        manager.setup()
        manager.delegete = self
        manager.start()
    }
}

//MARK:- GpsDelegate
extension ViewController: GpsDelegate {

    func updateLocation(lat: CLLocationDegrees,
                        lng: CLLocationDegrees) {
        print("緯度:\(lat) / 経度:\(lng)")
    }
}

