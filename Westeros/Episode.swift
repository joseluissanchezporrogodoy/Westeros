//
//  Episode.swift
//  Westeros
//
//  Created by José Luis Sánchez-Porro Godoy on 27/7/17.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation

final class Episode{
    let title : String
    let date : Date
    weak var season : Season?
    
    
    init(title: String, date: Date, season: Season) {
        (self.title, self.date, self.season) = (title, date, season)
        
    }
}

extension Episode {
    var proxy : String {
        return "\(title) \(date) \(season!.name)"
    }
}

extension Episode: Hashable{
    var hashValue: Int {
        get{
            return proxy.hashValue
        }
    }
}

extension Episode: Equatable{
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxy.hashValue == rhs.proxy.hashValue
    }
    
}
extension Episode: Comparable {
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}

extension Episode: CustomStringConvertible{
    var description: String {
        get{
            return proxy
        }
    }
}
