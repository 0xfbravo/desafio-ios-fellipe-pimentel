//
//  HeroesListViewController.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 24/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import UIKit

class HeroesListViewController: UIViewController {
    
    var presenter: HeroesListPresenterProtocol!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = HeroesListFeature.assemblePresenter(view: self)
    }

}

// MARK: - Protocol
extension HeroesListViewController: HeroesListViewProtocol {
    
}
