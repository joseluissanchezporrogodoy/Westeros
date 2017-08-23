//
//  HouseFactory.swift
//  Westeros
//
//  Created by José Luis Sánchez-Porro Godoy on 23/8/17.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation

protocol HouseFactory {
    typealias Filter = (House)->Bool
    
    var houses : [House] {get}
    func house(named: String)->House?
    func houses(filteredBy: Filter) -> [House]
}

extension LocalFactory : HouseFactory{
    var houses: [House]{
        get{
            // Aquí es donde te creas tus casas
            let starkSigil = Sigil(description: "Direwolf", image: #imageLiteral(resourceName: "codeIsComing.png"))
            let lannisterSigil = Sigil(description: "Rampant Lion", image: #imageLiteral(resourceName: "lannister.jpg"))
            let targaryenSigil = Sigil(description: "Three headed dragon", image: #imageLiteral(resourceName: "targaryenSmall.jpg"))
            
            
            let starkURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")
            let lannisterURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")
            let targaryenURL = URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")
            
            let stark = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!",wikiURL:starkURL!)
            let lannister = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!",wikiURL:lannisterURL!)
            let targaryen = House(name: "Targaryen", sigil: targaryenSigil, words: "Fire & Blood",wikiURL:targaryenURL!)
            
            let robb = Person(name: "Robb", alias: "The young wolf", house: stark)
            let arya = Person(name: "Arya", house: stark)
            
            let tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannister)
            let jaime = Person(name: "Jaime", alias: "Kingslayer", house: lannister)
            let cersei = Person(name: "Cersei", house: lannister)
            
            let dani = Person(name: "Daenerys", alias: "Mother of dragons", house: targaryen)
            
            // Añadir los personajes a las casas
            stark.add(persons: robb, arya)
            lannister.add(persons: tyrion, jaime, cersei)
            targaryen.add(person: dani)
            
            return [stark, lannister, targaryen].sorted()
        }
    }
    
    func houses(filteredBy: Filter) -> [House] {
        let filtered = Repository.local.houses.filter(filteredBy)
        return filtered
    }
    
    func house(named: String) -> House? {
        
        let house = houses.filter{$0.name.uppercased() == named.uppercased()}.first
        return house
        
    }
}
