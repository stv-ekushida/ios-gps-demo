//
//  ios_gps_demoTests.swift
//  ios-gps-demoTests
//
//  Created by Eiji Kushida on 2016/12/27.
//  Copyright © 2016年 Eiji Kushida. All rights reserved.
//

import XCTest
@testable import ios_gps_demo

class ios_gps_demoTests: XCTestCase {
    
    let manager = FakeLocationUtil()
    let delegate = SpyLocationDelegate()
    
    override func setUp() {
        super.setUp()
        manager.create(delegate: delegate)
    }
    
    override func tearDown() {
        super.tearDown()
        manager.delegate = nil
    }
    
    /// check: LocationUtilのsetupが呼ばれたことを確認する
    func testSetup_OK_WhenCalled() {
        XCTAssertTrue(manager.wasCalledSetup)
    }
    
    /// check: LocationUtilのstartが呼ばれたことを確認する
    func testStart_OK_WhenCalled() {
        
        whenCondition(description: "東京タワーの緯度・経度を取得するテストケース")
        manager.start()
        
        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("waitForExpectationsエラー: \(error)")
                return
            }
            XCTAssertTrue(self.manager.wasCalledStart)
        }
    }
    
    /// check: 緯度 35.658581 - 経度 139.745433
    func testStart_OK_WhenTokyoTower() {
        
        whenCondition(description: "東京タワーの緯度・経度を取得するテストケース")
        manager.start()
        
        waitForExpectations(timeout: 1) { error in
            if let error = error {
                XCTFail("waitForExpectationsエラー: \(error)")
                return
            }
            
            XCTAssertEqual(35.658581, self.delegate.lastLat)
            XCTAssertEqual(139.745433, self.delegate.lastLng)
        }
    }
    
    //MARK:- Helpers
    private func whenCondition(description: String) {
        let exp = expectation(description: description)
        delegate.asyncExpectation = exp
    }
}
