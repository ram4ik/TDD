//
//  TDDTests.swift
//  TDDTests
//
//  Created by ramil on 17.12.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import XCTest
@testable import TDD

class TestedRegister {
    var availableFunds: Decimal
    var transactionTotal: Decimal = 0
    
    init(availableFunds: Decimal = 0) {
        self.availableFunds = availableFunds
    }
    
    func addItem(_ cost: Decimal) {
        transactionTotal += cost
    }
}

class TDDTests: XCTestCase {
    var availableFunds: Decimal!
    var sut: TestedRegister!
    var itemCost: Decimal!

    override func setUp() {
        super.setUp()
        itemCost = 42
        availableFunds = 100
        sut = TestedRegister(availableFunds: availableFunds)
    }

    override func tearDown() {
        itemCost = nil
        availableFunds = nil
        sut = nil
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testInit_createsCashRegister() {
        XCTAssertNotNil(TestedRegister())
    }
    
    func testInitAvailableFunds_setsAvailableFunds() {
        // given
        let avaiableFunds = Decimal(100)
        
        // when
        let sut = TestedRegister(availableFunds: avaiableFunds)
        
        // then
        XCTAssertEqual(sut.availableFunds, avaiableFunds)
    }
    
    func testAddItem_oneItem_addsCostToTransactionTotal() {
        
        // when
        sut.addItem(itemCost)
        
        // then
        XCTAssertEqual(sut.transactionTotal, itemCost)
    }
    
    func testAddItem_twoItems_addsCostsToTransactionTotal() {
        
        let itemCost2 = Decimal(20)
        let expectedTotal = itemCost + itemCost2
        
        // when
        sut.addItem(itemCost)
        sut.addItem(itemCost2)
        
        // then
        XCTAssertEqual(sut.transactionTotal, expectedTotal)
    }

}
