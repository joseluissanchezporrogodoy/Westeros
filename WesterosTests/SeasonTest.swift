//
//  SeasonTest.swift
//  Westeros
//
//  Created by jose luis sanchez-porro godoy on 27/07/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import XCTest
@testable import Westeros

class SeasonTest: XCTestCase {
    var season1 : Season!
    var season2 : Season!
    var e1s1 : Episode!
    var e2s1 : Episode!
    var e1s2 : Episode!
    var e2s2 : Episode!
    
    override func setUp() {
        super.setUp()
        season1 = Season(name: "1", releaseDate: Date.stringToDate(dateString: "11-11-1984"))
        season2 = Season(name: "2", releaseDate: Date.stringToDate(dateString: "12-11-1984"))
        e1s1 = Episode(title: "1", date: Date.stringToDate(dateString:"11-11-1984"), season: season1)
        e2s1 = Episode(title: "2", date: Date.stringToDate(dateString:"12-11-1984"), season: season1)
        e1s2 = Episode(title: "1", date: Date.stringToDate(dateString: "13-11-1984"), season: season2)
        e2s2 = Episode(title: "2", date: Date.stringToDate(dateString:"14-11-1984"), season: season2)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSeasonExistance(){
        let seasonTest = Season(name: "1", releaseDate: Date.stringToDate(dateString: "11-11-1984"))
        XCTAssertNotNil(seasonTest)
    }
    
    func testAddEpisodesToSeason(){
        XCTAssertEqual(season1.count, 0)
        
        // Añado un capítulo
        season1.add(episode: e1s1)
        XCTAssertEqual(season1.count, 1)
        
        season1.add(episode: e2s1)
        XCTAssertEqual(season1.count, 2)
        
        season1.add(episode: e1s2)
        XCTAssertEqual(season1.count, 2)
        
    }
    
    func testSeasonEquality(){
        // Identidad 
        XCTAssertEqual(season1, season1)
        
        // Igualdad
        let seasonTest = Season(name: "1", releaseDate: Date.stringToDate(dateString: "11-11-1984"))
        XCTAssertEqual(season1, seasonTest)
        
        // Desigualdad
         XCTAssertNotEqual(season1, season2)
        
    }
    
    func testSeasonComparation(){
        XCTAssertLessThan(season1, season2)
        XCTAssertGreaterThan(season2, season1)
    }
    
    
    func testSeasonHashable(){
        XCTAssertNotNil(season1.hashValue)
    }
    
    func testSeasonCustomStringConvertible(){
        XCTAssertNotNil(season1.description)
    }
 
    
}
