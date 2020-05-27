//
//  MostExpensiveHqViewController.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 26/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import UIKit

class MostExpensiveHqViewController: UIViewController {
    
    var presenter: MostExpensiveHqPresenterProtocol!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MostExpensiveHqFeature.assemblePresenter(view: self)
    }

}

// MARK: - Protocol
extension MostExpensiveHqViewController: MostExpensiveHqViewProtocol {
    
}
