//
//  RepositoryTest.swift
//  Westeros
//
//  Created by jose luis sanchez-porro godoy on 11/07/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTests: XCTestCase {
    
    var localHouses : [House]!
    var localSeasons : [Season]!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        localHouses = Repository.local.houses
        localSeasons = Repository.local.seasons
        dump(localSeasons)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLocalRepositoryCreation(){
        XCTAssertNotNil(Repository.local)
    }
    
    func testLocalRepositoryHousesCreation(){
        let houses = Repository.local.houses
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 3)
    }
    
    func testLocalRepositoryReturnsSortedArrayofHouses(){
        
        XCTAssertEqual(localHouses, localHouses.sorted())
    }
    
    func testLocalRepoReturnsHousesByNameCaseInsensitively(){
        let stark = Repository.local.house(named: "sTarK")
        XCTAssertEqual(stark?.name, "Stark")
        
        let grijander = Repository.local.house(named: "Grijander")
        XCTAssertNil(grijander)
        
    }
    
    func testHouseFiltering(){
        let filtered = Repository.local.houses(filteredBy: {$0.count == 1})
        
        XCTAssertEqual(filtered.count, 1)
    }
    
    func testLocalRepositorySeasonsCreation(){
        let seasons = Repository.local.seasons
        XCTAssertNotNil(seasons)
        XCTAssertEqual(seasons.count, 6)
    }
    
    func testLocalRepositoryReturnsSortedArrayofSeasons(){
        
        XCTAssertEqual(localSeasons, localSeasons.sorted())
    }
    
    func testSeasonFiltering(){
        
        let filtered = Repository.local.seasons(filteredBy: {$0.count == 2})
        
        XCTAssertEqual(filtered.count, 6)
    }

    
}
