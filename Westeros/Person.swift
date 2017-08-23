//
//  Character.swift
//  Westeros
//
//  Created by jose luis sanchez-porro godoy on 06/07/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation

final class Person{
    let name : String
    let house : House
    // Ponemos ? por que puede ser nil puesto que no todos los characters son conocidos por su mote. Como es private se le suele poner un _delante
    private let _alias : String?
    var alias: String{
        get{
            return _alias ?? ""
        }
    }
    
    
    init(name: String, alias: String? , house: House){
        (self.name,_alias,self.house) = (name, alias, house)
    }
    
    convenience init (name: String, house: House){
        self.init(name: name, alias: nil, house:house)
    }
  
    
}
extension Person{
    var fullName: String{
        return "\(name) \(house.name)"  
    }
}

extension Person{
    var proxy : String{
        return "\(name) \(alias) \(house.name)"
    }
    var proxyForComparison : String{
        get{
            return   name.uppercased()
        }
    }
}

extension Person: Hashable{
     var hashValue: Int{
        get{
            return proxy.hashValue
        }
     }
}

extension Person: Equatable{
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

extension Person: Comparable{
    static func <(lhs: Person, rhs: Person) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}

