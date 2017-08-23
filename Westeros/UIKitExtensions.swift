//
//  UIKitExtensions.swift
//  Westeros
//
//  Created by jose luis sanchez-porro godoy on 11/07/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import UIKit

extension UIViewController{
    func wrappedInNavigation() -> UINavigationController {
        let nav = UINavigationController(rootViewController: self)
        return nav
    }
    
}
