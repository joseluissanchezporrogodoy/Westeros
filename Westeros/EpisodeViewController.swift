//
//  EpisodeViewController.swift
//  Westeros
//
//  Created by jose luis sanchez-porro godoy on 23/08/2017.
//  Copyright © 2017 jose luis sanchez-porro godoy. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController {

    @IBOutlet weak var episodeTitleView: UILabel!
    
    @IBOutlet weak var episodeImageView: UIImageView!
    
    @IBOutlet weak var episodeSynopsisView: UILabel!
    let model: Episode
    
    init(model: Episode){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncViewWithModel()
    }
    func syncViewWithModel(){
        episodeTitleView.text = model.title
        episodeImageView.image = model.image
        episodeSynopsisView.text = model.synopsis
    }
}
