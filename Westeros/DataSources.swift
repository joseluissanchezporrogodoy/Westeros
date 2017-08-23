//
//  DataSources.swift
//  Westeros
//
//  Created by jose luis sanchez-porro godoy on 22/08/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import UIKit

final class DataSources{
    static func housesDataSource(model: [House]) -> ArrayDataSource<House>{
        
        return ArrayDataSource(model: model) { (house:House, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "House"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil{
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            cell?.imageView?.image = house.sigil.image
            cell?.textLabel?.text = house.name
            cell?.detailTextLabel?.text = "\(house.count) members"
            return cell!
        }
        
    }
    
    static func personsDataSource(model: [Person]) -> ArrayDataSource<Person>{
        
        return ArrayDataSource(model: model) { (person:Person, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "Person"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil{
                cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
            }
            
            cell?.textLabel?.text = person.fullName
            return cell!
        }
        
    }
    static func seasonsDataSource(model: [Season]) -> ArrayDataSource<Season>{
        
        return ArrayDataSource(model: model, cellMaker: { (season: Season, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "House"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil{
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            cell?.imageView?.image = season.image
            cell?.textLabel?.text = season.name
            cell?.detailTextLabel?.text = "\(season.count) Episodes"
            return cell!
        })
    }
    static func episodeDataSource(model: [Episode]) -> ArrayDataSource<Episode>{
        
        return ArrayDataSource(model: model, cellMaker: { (episode: Episode, tableView: UITableView) -> UITableViewCell in
            
            let cellID = "House"
            var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
            if cell == nil{
                cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellID)
            }
            
            cell?.imageView?.image = episode.image
            cell?.textLabel?.text = episode.title
            cell?.detailTextLabel?.text = "Estreno: \(String(describing: Date.dateToString(date: episode.date))) "
            return cell!
        })
    }
    

}
