//
//  EpisodeTest.swift
//  Westeros
//
//  Created by jose luis sanchez-porro godoy on 27/07/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import XCTest
@testable import Westeros

class EpisodeTest: XCTestCase {
    
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
        e1s1 = Episode(title: "1", date: Date.stringToDate(dateString: "11-11-1984"), season: season1)
        e2s1 = Episode(title: "2", date: Date.stringToDate(dateString: "12-11-1984"), season: season1)
        e1s2 = Episode(title: "1", date: Date.stringToDate(dateString: "13-11-1984"), season: season2)
        e2s2 = Episode(title: "2", date: Date.stringToDate(dateString: "14-11-1984"), season: season2)
        
        
    
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEpisodeExistence(){
        let episode = Episode(title: "1", date: Date.stringToDate(dateString: "11-11-1984"), season: season1)
        XCTAssertNotNil(episode)
    }
    
    func testEpisodeEquality(){
        // Identidad
        XCTAssertEqual(e1s1, e1s1)
        
        // Igualdad 
        let episode = Episode(title: "1", date: Date.stringToDate(dateString: "11-11-1984"), season: season1)
        XCTAssertEqual(e1s1, episode)
        
        // Desigualdad
        
        XCTAssertNotEqual(e1s1, e1s2)
    }
    
    func testEpisodesComparation(){
        XCTAssertLessThan(e1s1, e1s2)
        XCTAssertGreaterThan(e1s2, e1s1)
    }
    
    func testEpisodeHashable(){
        XCTAssertNotNil(e1s1.hashValue)
    }
    func testEpisodeCustomStringConvertible(){
        XCTAssertNotNil(e1s1.description)
    }
}
