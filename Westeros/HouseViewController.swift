//
//  HouseViewController.swift
//  Westeros
//
//  Created by jose luis sanchez-porro godoy on 22/08/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {

    @IBOutlet weak var houseNameView: UILabel!
    
  
    @IBOutlet weak var wordsView: UILabel!
    
    @IBOutlet weak var sigilImageView: UIImageView!
    
    let model : House
    
    init(model: House){
        self.model = model
        super.init(nibName:nil , bundle: nil)
        title = self.model.name
    }
    // Chapuza de apple
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncViewWithModel(){
        
        // model-> view
        houseNameView.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsView.text = model.words
        
    }
    
    func setupUI(){
        // Añadimos un botón a la barra del navigationController
        let wiki = UIBarButtonItem(title: "Wiki",
                                   style: .plain,
                                   target: self,
                                   action: #selector(displayWiki))
        
        // Añadimos un botón a la barra del navigationController
        let person = UIBarButtonItem(title: "Members",
                                     style: .plain,
                                     target: self,
                                     action: #selector(displayPersons))
        // Añadimos
        navigationItem.rightBarButtonItems = [wiki,person]
    }
    
    @objc func displayPersons(){
        // Hay que crear el table view que muestre personspersonsDataSource
        let dataSource = DataSources.personsDataSource(model: model.sortedMembers())
        let membersVC = ArrayTableViewController(dataSource: dataSource,title: "Members",
                                                 style: .plain,
                                                 delegate: nil)
        navigationController?.pushViewController(membersVC, animated: true)
        
    }
    
    @objc func displayWiki(){
        //Creamos un Wiki VC y lo cargamos en el navigation
        let wikiVC = WikiViewController(model: model)
        navigationController?.pushViewController(wikiVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        syncViewWithModel()
    }

}
