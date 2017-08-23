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

