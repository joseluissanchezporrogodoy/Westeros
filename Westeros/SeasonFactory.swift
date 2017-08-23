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
            
            let e1s1 = Episode(title: "Winter is coming", date: Date.stringToDate(dateString:"17-04-2011"), season: season1, image: #imageLiteral(resourceName: "episode1x01.jpg"), synopsis:"Jon Arryn, the Hand of the King, is dead. King Robert Baratheon plans to ask his oldest friend, Eddard Stark, to take Jon's place. Across the sea, Viserys Targaryen plans to wed his sister to a nomadic warlord in exchange for an army.")
            let e2s1 = Episode(title: "The Kingsroad", date: Date.stringToDate(dateString:"24-04-2011"), season: season1,image: #imageLiteral(resourceName: "episode1x02.jpg"),synopsis: "While Bran recovers from his fall, Ned takes only his daughters to Kings Landing. Jon Snow goes with his uncle Benjen to The Wall. Tyrion joins them.")
            
            let e1s2 = Episode(title: "The North Remembers", date: Date.stringToDate(dateString:"01-04-2012"), season: season2, image: #imageLiteral(resourceName: "episode2x01.jpg"), synopsis: "As Robb Stark and his northern army continue the war against the Lannisters, Tyrion arrives in King’s Landing to counsel Joffrey and temper the young king’s excesses.  On the island of Dragonstone, Stannis Baratheon plots an invasion to claim his late brother’s throne, allying himself with the fiery Melisandre, a strange priestess of a stranger god.  Across the sea, Daenerys, her three young dragons, and the khalasar trek through the Red Waste in search of allies, or water.  In the North, Bran presides over a threadbare Winterfell, while beyond the Wall, Jon Snow and the Night’s Watch must shelter with a devious wildling.")
            let e2s2 = Episode(title: "The Night Lands", date: Date.stringToDate(dateString:"08-04-2012"), season: season2,image: #imageLiteral(resourceName: "episode2x02.jpg"),synopsis: "In the wake of a bloody purge in the capital, Tyrion chastens Cersei for alienating the king’s subjects.  On the road north, Arya shares a secret with Gendry, a Night’s Watch recruit.  With supplies dwindling, one of Dany’s scouts returns with news of their position.  After nine years as a Stark ward, Theon Greyjoy reunites with his father Balon, who wants to restore the ancient Kingdom of the Iron Islands.  Davos enlists Salladhor Saan, a pirate, to join forces with Stannis and Melisandre for a naval invasion of King’s Landing.")
            
            let e1s3 = Episode(title: "Valar Dohaeris", date: Date.stringToDate(dateString:"31-03-2013"), season: season3, image: #imageLiteral(resourceName: "episode3x01.jpg"), synopsis: "Jon meets the King-Beyond-the-Wall while his Night Watch Brothers flee south. In King's Landing, Tyrion wants a reward, Margaery shows her charitable nature, Cersei arranges a dinner party, and Littlefinger offers to help Sansa. Across the Narrow Sea, Daenerys starts her journey west.")
            let e2s3 = Episode(title: "Dark Wings, Dark Words", date: Date.stringToDate(dateString:"07-04-2013"), season: season3, image: #imageLiteral(resourceName: "episode3x02.jpg"), synopsis:"Sansa says too much. Shae asks Tyrion for a favor. Jaime finds a way to pass the time, while Arya encounters the Brotherhood Without Banners.")
            
            let e1s4 = Episode(title: "Two Swords", date: Date.stringToDate(dateString:"06-04-2014"), season: season4, image: #imageLiteral(resourceName: "episode4x01.jpg"), synopsis: "Tyrion welcomes a guest to King’s Landing. At Castle Black, Jon Snow finds himself unwelcome. Dany is pointed to Meereen, the mother of all slave cities. Arya runs into an old friend.")
            let e2s4 = Episode(title: "The Lion and the Rose", date: Date.stringToDate(dateString:"13-04-2014"), season: season4, image: #imageLiteral(resourceName: "episode4x02.jpg"), synopsis: "Tyrion lends Jaime a hand. Joffrey and Margaery host a breakfast. At Dragonstone, Stannis loses patience with Davos. Ramsay finds a purpose for his pet. North of the Wall, Bran sees where they must go.")
            
            let e1s5 = Episode(title: "The Wars to Come ", date: Date.stringToDate(dateString:"12-04-2015"), season: season5, image: #imageLiteral(resourceName: "episode5x01.jpg"), synopsis: "Cersei and Jaime adjust to a world without Tywin. Varys reveals a conspiracy to Tyrion. Dany faces a new threat to her rule. Jon is caught between two kings.")
            let e2s5 = Episode(title: "The House of Black and White", date: Date.stringToDate(dateString:"19-04-2015"), season: season5, image: #imageLiteral(resourceName: "episode5x02.jpg") , synopsis: "Arya arrives in Braavos. Podrick and Brienne run into trouble on the road. Cersei fears for her daughter's safety in Dorne as Ellaria Sand seeks revenge for Oberyn's death. Stannis tempts Jon. An adviser tempts Daenerys.")
            
            let e1s6 = Episode(title: "The Red Woman", date: Date.stringToDate(dateString:"24-04-2016"), season: season6, image: #imageLiteral(resourceName: "episode6x01.jpg"), synopsis: "The fate of Jon Snow is revealed. Daenerys meets a strong man. Cersei sees her daughter once again.")
            let e2s6 = Episode(title: "Home ", date: Date.stringToDate(dateString:"01-05-2016"), season: season6, image: #imageLiteral(resourceName: "episode6x02.jpg"), synopsis: "Bran trains with the Three-Eyed Raven. In King’s Landing, Jaime advises Tommen. Tyrion demands good news, but has to make his own. At Castle Black, the Night’s Watch stands behind Thorne. Ramsay Bolton proposes a plan, and Balon Greyjoy entertains other proposals.")
            
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
