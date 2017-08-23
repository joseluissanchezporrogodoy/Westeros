//
//  Season.swift
//  Westeros
//
//  Created by José Luis Sánchez-Porro Godoy on 27/7/17.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation
import UIKit

typealias Episodes = Set<Episode>


final class Season{
    let name: String
    let releaseDate : Date
    let image: UIImage
    let synopsis: String
    
    private var _episodes : Episodes
    init(name: String, releaseDate:Date, image: UIImage, synopsis: String ){
        self.name = name
        self.releaseDate = releaseDate
        self.image = image
        self.synopsis = synopsis
        _episodes = Episodes()
    }
}

extension Season{
    
    var count : Int{
        return _episodes.count
    }
    
    func add(episode: Episode){
        // Como compruebo que no me meten episodios de otras temporadas
        guard episode.season?.name == name else {
            return
        }
        _episodes.insert(episode)
    }
    
    func add(episodes: Episode...){
        
        for episode in episodes{
            add(episode: episode)
        }
    }
    
    func sortedEpisodes() -> [Episode] {
        return _episodes.sorted()
    }
}

// MARK: - Proxy
extension Season {
    
    // Variable para igualdad de objetos
    private var proxy: String {
        get {
            return "\(name) \(releaseDate)"
        }
    }
    
    
}

// MART_ - Hashable
extension Season: Hashable {
    var hashValue: Int {
        get {
            return proxy.hashValue
        }
    }
}

// MART_ - Equatable
extension Season: Equatable {
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxy == rhs.proxy
    }
}

// MART_ - Comparable
extension Season: Comparable {
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxy < rhs.proxy
    }
}

extension Season: CustomStringConvertible{
    var description: String {
        get{
            return proxy
        }
    }
}



