//
//  CharacterTests.swift
//  Westeros
//
//  Created by jose luis sanchez-porro godoy on 06/07/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import XCTest
@testable import Westeros

class PersonTest: XCTestCase {
    
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
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
    
    func testPersonExistence(){
        
        
        
        XCTAssertNotNil(tyrion)
    }
    
    func testFullName(){
        XCTAssertEqual(tyrion.fullName, "Tyrion Lannister")
    }
    
    
    func testPersonEquality(){
        
        // Identidad
        XCTAssertEqual(tyrion, tyrion)
        
        // Igualdad
        let imp = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
        XCTAssertEqual(imp, tyrion)
        
        // Desigualdad
        XCTAssertNotEqual(tyrion, arya)
        
    }
    
    func testComparation(){
        XCTAssertLessThan(arya, robb)
        XCTAssertGreaterThan(robb, arya)

    }
    
}
