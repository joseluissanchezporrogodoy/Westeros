//
//  Delegates.swift
//  Westeros
//
//  Created by jose luis sanchez-porro godoy on 22/08/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import UIKit

class BaseViewControllerDelegate<Element>: NSObject{
    var source : ArrayDataSource<Element>?
    var viewController : UIViewController?
    
    
}

final class GreatHousesDelegate: BaseViewControllerDelegate<House>, UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let house = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController{
            let vc = HouseViewController(model: house)
            nav.pushViewController(vc, animated: true)
        }
    }
}

final class GreatSeasonsDelegate: BaseViewControllerDelegate<Season>, UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let season = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController{
            let vc = SeasonViewController(model: season)
            nav.pushViewController(vc, animated: true)
        }
    }
}

final class GreatEpisodesDelegate: BaseViewControllerDelegate<Episode>, UITableViewDelegate{
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let episode = source?.element(atIndexPath: indexPath),
            let nav = viewController?.navigationController{
            let vc = EpisodeViewController(model: episode)
            nav.pushViewController(vc, animated: true)
        }
    }
}
