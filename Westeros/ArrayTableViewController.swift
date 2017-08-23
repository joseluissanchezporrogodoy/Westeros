//
//  ArrayTableViewController.swift
//  Westeros
//
//  Created by jose luis sanchez-porro godoy on 22/08/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import UIKit

class ArrayTableViewController<Element>: UITableViewController {
    
    
    let dataSource : ArrayDataSource<Element>
    let arrayDelegate : BaseViewControllerDelegate<Element>?
    
    init(dataSource: ArrayDataSource<Element>,
         title: String, style: UITableViewStyle,
         delegate: BaseViewControllerDelegate<Element>? = nil){
        
        
        self.dataSource = dataSource
        self.arrayDelegate = delegate
        super.init(style: style)
        self.tableView.dataSource = self.dataSource
        
        self.arrayDelegate?.viewController = self
        self.arrayDelegate?.source = dataSource
        
        self.tableView.delegate = self.arrayDelegate as? UITableViewDelegate
        
        
        self.title = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath)")
        
        
    }
    
}
