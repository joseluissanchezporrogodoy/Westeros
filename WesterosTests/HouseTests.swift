//
//  HouseTests.swift
//  Westeros
//
//  Created by jose luis sanchez-porro godoy on 06/07/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//


import XCTest
@testable import Westeros

class HouseTests: XCTestCase {
    
    var starkImage : UIImage!
    var lannisterImage : UIImage!
    
    var starkSigil : Sigil!
    var lannisterSigil : Sigil!
    
    var starkHouse : House!
    var lannisterHouse : House!
    
    var robb : Person!
    var arya : Person!
    var tyrion : Person!
    
    
    override func setUp() {
        super.setUp()
        
        starkImage = #imageLiteral(resourceName: "codeIsComing.png")
        lannisterImage = #imageLiteral(resourceName: "lannister.jpg")
        
        starkSigil = Sigil(description: "Direwolf", image: starkImage)
        lannisterSigil = Sigil(description: "Rampant Lion", image: lannisterImage)
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", wikiURL:URL(string:"http://awoiaf.westeros.org/index.php/House_Stark")!)
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!", wikiURL:URL(string:"http://awoiaf.westeros.org/index.php/House_Lannister")!)
        
        robb = Person(name: "Robb", alias: "The young wolf", house: starkHouse)
        arya = Person(name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testHouseExistence(){
        
        let starkSigil = Sigil(description: "Direwolf", image: #imageLiteral(resourceName: "codeIsComing.png"))
        let stark = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", wikiURL:URL(string:"http://awoiaf.westeros.org/index.php/House_Stark")!)
        
        
        XCTAssertNotNil(stark)
    }
    
    func testSigilExistence(){
        
        let starkSigil = Sigil(description: "Direwolf", image: #imageLiteral(resourceName: "codeIsComing.png"))
        XCTAssertNotNil(starkSigil)
        
        let lannisterSigil = Sigil(description: "Rampant Lion", image: #imageLiteral(resourceName: "lannister.jpg"))
        
        XCTAssertNotNil(lannisterSigil)
    }
    
    func testAddPersons(){
        XCTAssertEqual(starkHouse.count, 0)
        
        starkHouse.add(person: robb)
        XCTAssertEqual(starkHouse.count, 1)
        
        starkHouse.add(person: arya)
        XCTAssertEqual(starkHouse.count, 2)
        
        starkHouse.add(person: tyrion)
        XCTAssertEqual(starkHouse.count, 2)
        
        
    }
    
    func testHouseEquality(){
        
        // Identidad
        XCTAssertEqual(starkHouse, starkHouse)
        
        // Igualdad
        let jinxed = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", wikiURL:URL(string:"http://awoiaf.westeros.org/index.php/House_Stark")!)
        XCTAssertEqual(jinxed, starkHouse)
        
        // Desigualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse)
        
        
    }
    
    func testHashable() {
        
        
        XCTAssertNotNil(starkHouse.hashValue)
        
    }
    
    func testHouseComparison(){
        
        XCTAssertLessThan(lannisterHouse, starkHouse)
    }
}


























