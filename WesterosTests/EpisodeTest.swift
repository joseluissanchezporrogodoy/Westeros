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
        season1 = Season(name: "1", releaseDate: Date.stringToDate(dateString: "17-04-2011"),image: #imageLiteral(resourceName: "season1.jpg"),synopsis: "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring.")
        season2 = Season(name: "2", releaseDate: Date.stringToDate(dateString: "01-04-2012"), image: #imageLiteral(resourceName: "season2.jpg"), synopsis: "The cold winds of winter are rising in Westeros...war is coming...and five kings continue their savage quest for control of the all-powerful Iron Throne. With winter fast approaching, the coveted Iron Throne is occupied by the cruel Joffrey, counseled by his conniving mother Cersei and uncle Tyrion. But the Lannister hold on the Throne is under assault on many fronts. Meanwhile, a new leader is rising among the wildings outside the Great Wall, adding new perils for Jon Snow and the order of the Night's Watch.")
        
        e1s1 = Episode(title: "Winter is coming", date: Date.stringToDate(dateString:"17-04-2011"), season: season1, image: #imageLiteral(resourceName: "episode1x01.jpg"), synopsis:"Jon Arryn, the Hand of the King, is dead. King Robert Baratheon plans to ask his oldest friend, Eddard Stark, to take Jon's place. Across the sea, Viserys Targaryen plans to wed his sister to a nomadic warlord in exchange for an army.")
        e2s1 = Episode(title: "The Kingsroad", date: Date.stringToDate(dateString:"24-04-2011"), season: season1,image: #imageLiteral(resourceName: "episode1x02.jpg"),synopsis: "While Bran recovers from his fall, Ned takes only his daughters to Kings Landing. Jon Snow goes with his uncle Benjen to The Wall. Tyrion joins them.")
        
        e1s2 = Episode(title: "The North Remembers", date: Date.stringToDate(dateString:"01-04-2012"), season: season2, image: #imageLiteral(resourceName: "episode2x01.jpg"), synopsis: "As Robb Stark and his northern army continue the war against the Lannisters, Tyrion arrives in King’s Landing to counsel Joffrey and temper the young king’s excesses.  On the island of Dragonstone, Stannis Baratheon plots an invasion to claim his late brother’s throne, allying himself with the fiery Melisandre, a strange priestess of a stranger god.  Across the sea, Daenerys, her three young dragons, and the khalasar trek through the Red Waste in search of allies, or water.  In the North, Bran presides over a threadbare Winterfell, while beyond the Wall, Jon Snow and the Night’s Watch must shelter with a devious wildling.")
        e2s2 = Episode(title: "The Night Lands", date: Date.stringToDate(dateString:"08-04-2012"), season: season2,image: #imageLiteral(resourceName: "episode2x02.jpg"),synopsis: "In the wake of a bloody purge in the capital, Tyrion chastens Cersei for alienating the king’s subjects.  On the road north, Arya shares a secret with Gendry, a Night’s Watch recruit.  With supplies dwindling, one of Dany’s scouts returns with news of their position.  After nine years as a Stark ward, Theon Greyjoy reunites with his father Balon, who wants to restore the ancient Kingdom of the Iron Islands.  Davos enlists Salladhor Saan, a pirate, to join forces with Stannis and Melisandre for a naval invasion of King’s Landing.")
        
        
    
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEpisodeExistence(){
        let episode = Episode(title: "Winter is coming", date: Date.stringToDate(dateString:"17-04-2011"), season: season1, image: #imageLiteral(resourceName: "episode1x01.jpg"), synopsis:"Jon Arryn, the Hand of the King, is dead. King Robert Baratheon plans to ask his oldest friend, Eddard Stark, to take Jon's place. Across the sea, Viserys Targaryen plans to wed his sister to a nomadic warlord in exchange for an army.")

        XCTAssertNotNil(episode)
    }
    
    func testEpisodeEquality(){
        // Identidad
        XCTAssertEqual(e1s1, e1s1)
        
        // Igualdad 
        let episode = Episode(title: "Winter is coming", date: Date.stringToDate(dateString:"17-04-2011"), season: season1, image: #imageLiteral(resourceName: "episode1x01.jpg"), synopsis:"Jon Arryn, the Hand of the King, is dead. King Robert Baratheon plans to ask his oldest friend, Eddard Stark, to take Jon's place. Across the sea, Viserys Targaryen plans to wed his sister to a nomadic warlord in exchange for an army.")

        XCTAssertEqual(e1s1, episode)
        
        // Desigualdad
        
        XCTAssertNotEqual(e1s1, e1s2)
    }
    
    func testEpisodesComparation(){
        XCTAssertLessThan(e1s2, e1s1)
        XCTAssertGreaterThan(e1s1, e1s2)

    }
    
    func testEpisodeHashable(){
        XCTAssertNotNil(e1s1.hashValue)
    }
    func testEpisodeCustomStringConvertible(){
        XCTAssertNotNil(e1s1.description)
    }
}
