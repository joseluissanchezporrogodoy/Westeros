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
            
            let season1 = Season(name: "Season 1", releaseDate: Date.stringToDate(dateString: "17-04-2011"),image: #imageLiteral(resourceName: "season1.jpg"),synopsis: "Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring.")
            let season2 = Season(name: "Season 2", releaseDate: Date.stringToDate(dateString: "01-04-2012"), image: #imageLiteral(resourceName: "season2.jpg"), synopsis: "The cold winds of winter are rising in Westeros...war is coming...and five kings continue their savage quest for control of the all-powerful Iron Throne. With winter fast approaching, the coveted Iron Throne is occupied by the cruel Joffrey, counseled by his conniving mother Cersei and uncle Tyrion. But the Lannister hold on the Throne is under assault on many fronts. Meanwhile, a new leader is rising among the wildings outside the Great Wall, adding new perils for Jon Snow and the order of the Night's Watch.")
            let season3 = Season(name: "Season 3", releaseDate: Date.stringToDate(dateString: "31-03-2013"), image: #imageLiteral(resourceName: "season3.jpg"), synopsis: "Duplicity and treachery...nobility and honor...conquest and triumph...and, of course, dragons. In Season 3, family and loyalty are the overarching themes as many critical storylines from the first two seasons come to a brutal head. Meanwhile, the Lannisters maintain their hold on King's Landing, though stirrings in the North threaten to alter the balance of power; Robb Stark, King of the North, faces a major calamity as he tries to build on his victories; a massive army of wildlings led by Mance Rayder march for the Wall; and Daenerys Targaryen--reunited with her dragons--attempts to raise an army in her quest for the Iron Throne.")
            let season4 = Season(name: "Season 4", releaseDate: Date.stringToDate(dateString: "06-04-2014"),image: #imageLiteral(resourceName: "season4.jpg"), synopsis: "The War of the Five Kings is drawing to a close, but new intrigues and plots are in motion, and the surviving factions must contend with enemies not only outside their ranks, but within.")
            let season5 = Season(name: "Season 5", releaseDate: Date.stringToDate(dateString: "12-04-2015"), image: #imageLiteral(resourceName: "season5.jpg") , synopsis: "The War of the Five Kings, once thought to be drawing to a close, is instead entering a new and more chaotic phase. Westeros is on the brink of collapse, and many are seizing what they can while the realm implodes, like a corpse making a feast for crows.")
            let season6 = Season(name: "Season 6", releaseDate: Date.stringToDate(dateString: "24-04-2016"), image: #imageLiteral(resourceName: "season6.jpg"), synopsis:"Following the shocking developments at the conclusion of season five, survivors from all parts of Westeros and Essos regroup to press forward, inexorably, towards their uncertain individual fates. Familiar faces will forge new alliances to bolster their strategic chances at survival, while new characters will emerge to challenge the balance of power in the east, west, north and south.")
            
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
