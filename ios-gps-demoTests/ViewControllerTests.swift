//
//  ViewControllerTests.swift
//  ios-gps-demo
//
//  Created by Eiji Kushida on 2017/03/22.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import XCTest
import CoreLocation
@testable import ios_gps_demo

final class ViewControllerTests: XCTestCase {
    
    var vc: ViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(
            withIdentifier: "ViewController")
        vc = viewController as! ViewController
        
        _ = vc.view
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    /// check : 測位の精度が最高精度であることを確認する
    func testViewDidLoad_desiredAccuracy_WhenLocationAccuracuyBest() {        
        XCTAssertEqual(vc.manager.locationManager.desiredAccuracy, kCLLocationAccuracyBest)
    }
    
    /// check : 位置情報取得間隔が100mであることを確認する
    func testViewDidLoad_distanceFilter_WhenDistanceFilter100() {
        XCTAssertEqual(vc.manager.locationManager.distanceFilter, 100)
    }
    
    /// check : LocationManagerのDelegateの値が設定されていることを確認する
    func testViewDidLoad_LocationUtilDelegate_WhenNotNil() {
        XCTAssertNotNil(vc.manager.locationManager.delegate)
    }
}
