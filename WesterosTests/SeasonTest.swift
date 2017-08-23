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
        season1 = Season(name: "1", releaseDate: Date.stringToDate(dateString: "17-04-2011"),image: #imageLiteral(resourceName: "season1.jpg"),synopsis: "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring.")
        season2 = Season(name: "2", releaseDate: Date.stringToDate(dateString: "01-04-2012"), image: #imageLiteral(resourceName: "season2.jpg"), synopsis: "The cold winds of winter are rising in Westeros...war is coming...and five kings continue their savage quest for control of the all-powerful Iron Throne. With winter fast approaching, the coveted Iron Throne is occupied by the cruel Joffrey, counseled by his conniving mother Cersei and uncle Tyrion. But the Lannister hold on the Throne is under assault on many fronts. Meanwhile, a new leader is rising among the wildings outside the Great Wall, adding new perils for Jon Snow and the order of the Night's Watch.")

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
        let seasonTest = Season(name: "1", releaseDate: Date.stringToDate(dateString: "17-04-2011"),image: #imageLiteral(resourceName: "season1.jpg"),synopsis: "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring.")
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
        let seasonTest = Season(name: "1", releaseDate: Date.stringToDate(dateString: "17-04-2011"),image: #imageLiteral(resourceName: "season1.jpg"),synopsis: "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring.")
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
