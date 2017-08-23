//
//  DateExtensionTest.swift
//  Westeros
//
//  Created by jose luis sanchez-porro godoy on 22/08/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import XCTest
@testable import Westeros
class DateExtensionTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDateFormater(){
        
        let dateTest = Date.stringToDate(dateString: "11-11-1984")
        
        let stringDate = Date.dateToString(date:dateTest)
        
        XCTAssertEqual("11-11-1984", stringDate)
        
    }
}
