//
//  House.swift
//  Westeros
//
//  Created by jose luis sanchez-porro godoy on 06/07/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation
import UIKit


typealias Words = String
typealias Members = Set<Person>


// MARK: - Clases
final class House{
    let name : String
    let sigil : Sigil
    let words : Words
    let wikiURL: URL
    var _members: Members
    
    init(name: String, sigil : Sigil, words: Words, wikiURL: URL){
        (self.name,self.sigil,self.words,self.wikiURL) = (name, sigil, words,wikiURL)
        _members = Members()
    }
    
}

final class Sigil{
    
    let description : String
    let image : UIImage
    
    init(description: String, image: UIImage) {
        (self.description, self.image) = (description, image)
    }
    
}

/// Tenemos que implementar equatable como ejercicio para comparar person.house == house
// El hashable y el comparable
extension House{
    var count: Int{
        return _members.count
    }
    
    func add(person: Person){
        guard person.house.name == name else {
            return
        }
        _members.insert(person)
    }
    
    ///Función variatica ... es un método que puede recibir varios parámetros separados por "," las funciones con los ... lo convierten "automágicamente" en un array
    func add(persons: Person...){
        for person in persons{
            add(person: person)
        }
    }
    
    // Devuelve un array ordenado de personas Sorted[Person]
    func sortedMembers()-> [Person]{
        return _members.sorted()
    }
}


extension House{
    
    var proxyForEquality: String{
        get{
           return "\(name) \(words) \(count)"
        }
        
    }
    var proxyForComparison : String{
        get{
         return   name.uppercased()
        }
    }
}



// MARK: - Equatable

extension House: Equatable{
    static func ==(lhs: House, rhs: House) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

// MARK: - Hashable
extension House: Hashable{
    var hashValue: Int{
        get{
            return proxyForEquality.hashValue
        }
    }
}

// MARK: - Comparable

extension House: Comparable{
    static func <(lhs: House, rhs: House) -> Bool {        
            return lhs.proxyForComparison < rhs.proxyForComparison
    }
}
























