//
//  SeasonFactory.swift
//  Westeros
//
//  Created by José Luis Sánchez-Porro Godoy on 23/8/17.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import Foundation

protocol SeasonFactory {
    typealias FilterSeason = (Season)->Bool
    
    var seasons : [Season]{get}
    func seasons(filteredBy: FilterSeason)->[Season]
}



extension LocalFactory:SeasonFactory{
    
    func seasons(filteredBy: FilterSeason) -> [Season] {
        let filtered = Repository.local.seasons.filter(filteredBy)
        return filtered
    }
    
    var seasons: [Season] {
        get{
            
            // Creo las temporadas
            
            let season1 = Season(name: "1", releaseDate: Date.stringToDate(dateString: "17-04-2011"))
            let season2 = Season(name: "2", releaseDate: Date.stringToDate(dateString: "01-04-2012"))
            let season3 = Season(name: "3", releaseDate: Date.stringToDate(dateString: "31-03-2013"))
            let season4 = Season(name: "4", releaseDate: Date.stringToDate(dateString: "06-04-2014"))
            let season5 = Season(name: "5", releaseDate: Date.stringToDate(dateString: "12-04-2015"))
            let season6 = Season(name: "6", releaseDate: Date.stringToDate(dateString: "24-04-2016"))
            
            // Creo los episodios
            
            let e1s1 = Episode(title: "Winter is coming", date: Date.stringToDate(dateString:"17-04-2011"), season: season1)
            let e2s1 = Episode(title: "The Kingsroad", date: Date.stringToDate(dateString:"24-04-2011"), season: season1)
            
            let e1s2 = Episode(title: "The North Remembers", date: Date.stringToDate(dateString:"01-04-2012"), season: season2)
            let e2s2 = Episode(title: "The Night Lands", date: Date.stringToDate(dateString:"08-04-2012"), season: season2)
            
            let e1s3 = Episode(title: "Valar Dohaeris", date: Date.stringToDate(dateString:"31-03-2013"), season: season3)
            let e2s3 = Episode(title: "Dark Wings, Dark Words", date: Date.stringToDate(dateString:"07-04-2013"), season: season3)
            
            let e1s4 = Episode(title: "Two Swords", date: Date.stringToDate(dateString:"06-04-2014"), season: season4)
            let e2s4 = Episode(title: "The Lion and the Rose", date: Date.stringToDate(dateString:"13-04-2014"), season: season4)
            
            let e1s5 = Episode(title: "The Wars to Come ", date: Date.stringToDate(dateString:"12-04-2015"), season: season5)
            let e2s5 = Episode(title: "The House of Black and White", date: Date.stringToDate(dateString:"19-04-2015"), season: season5)
            
            let e1s6 = Episode(title: "The Red Woman", date: Date.stringToDate(dateString:"24-04-2016"), season: season6)
            let e2s6 = Episode(title: "Home ", date: Date.stringToDate(dateString:"01-05-2016"), season: season6)
            
            // Añado los episodios a las temporadas
            
            season1.add(episodes: e1s1,e2s1)
            season2.add(episodes: e1s2,e2s2)
            season3.add(episodes: e1s3,e2s3)
            season4.add(episodes: e1s4,e2s4)
            season5.add(episodes: e1s5,e2s5)
            season6.add(episodes: e1s6,e2s6)
            
            return [season1,season2,season3,season4,season5,season6].sorted()
            
        }
    }
    
    
}
