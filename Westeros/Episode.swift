//
//  Episode.swift
//  Westeros
//
//  Created by José Luis Sánchez-Porro Godoy on 27/7/17.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation
import UIKit
final class Episode{
    let title : String
    let date : Date
    let image : UIImage
    let synopsis: String
    weak var season : Season?
    
    
    init(title: String, date: Date, season: Season, image: UIImage, synopsis: String) {
        (self.title, self.date, self.season, self.image, self.synopsis) = (title, date, season, image, synopsis)
        
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
            return "Episode: \(title)"
        }
    }
}
