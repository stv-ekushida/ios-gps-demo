//
//  ViewController.swift
//  ios-gps-demo
//
//  Created by Eiji Kushida on 2016/12/27.
//  Copyright © 2016年 Eiji Kushida. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

#if FAKE
    let manager = FakeLocationUtil()
#else
    let manager = LocationUtil()
#endif

    override func viewDidLoad() {
        super.viewDidLoad()
        manager.setup()
        manager.delegete = self
        manager.start()
    }
}

//MARK:- GpsDelegate
extension ViewController: GpsDelegate {

    func updateLocation(lat: Double,
                        lng: Double) {
        
        print(lat,lng)
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}

