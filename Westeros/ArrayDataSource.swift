//
//  ArrayDataSource.swift
//  Westeros
//
//  Created by jose luis sanchez-porro godoy on 22/08/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import UIKit

class ArrayDataSource <Element>: NSObject, UITableViewDataSource{
    
    
    typealias CellMaker = (Element, UITableView)->UITableViewCell
    
    private let _model : [Element]
    private let _cellMaker : CellMaker
    
    init(model: [Element], cellMaker: @escaping CellMaker) {
        _model = model
        _cellMaker = cellMaker
    }
    
    func element(atIndexPath indexPath: IndexPath)->Element{
        return _model[indexPath.row]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _model.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let elt = element(atIndexPath: indexPath)
        return _cellMaker(elt, tableView)
    }
    
}
