//
//  SeasonViewController.swift
//  Westeros
//
//  Created by jose luis sanchez-porro godoy on 23/08/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import UIKit

class SeasonViewController: UIViewController {

    @IBOutlet weak var seasonTitleView: UILabel!
  
    @IBOutlet weak var seasonImageView: UIImageView!
   
    @IBOutlet weak var synopsisView: UILabel!
    
    let model : Season
    
    init(model: Season){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = self.model.name
    }
    
    // Chapu apple
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncViewWithModel()
        setupUI()
    }
    
    func syncViewWithModel(){
        seasonTitleView.text = model.name
        seasonImageView.image = model.image
        synopsisView.text = model.synopsis
    }
    func setupUI(){
        let episode = UIBarButtonItem(title: "Episodes",
                                      style: .plain,
                                      target: self,
                                      action: #selector(displayEpisodes))
        navigationItem.rightBarButtonItem = episode
        
    }
    
    @objc func displayEpisodes(){
        let dataSource = DataSources.episodeDataSource(model: model.sortedEpisodes())
        let episodesVC = ArrayTableViewController(dataSource: dataSource, title:"Episodes", style: .plain, delegate: nil)
        navigationController?.pushViewController(episodesVC, animated: true)
    }
}
