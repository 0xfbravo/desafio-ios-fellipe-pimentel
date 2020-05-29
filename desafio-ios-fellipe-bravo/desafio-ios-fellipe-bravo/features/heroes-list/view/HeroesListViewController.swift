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
    
    // MARK: - Outlets
    @IBOutlet weak var heroesListTableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = HeroesListFeature.assemblePresenter(view: self)
        assembleUI()
    }
    
    // MARK: - UI
    private func assembleUI() {
        heroesListTableView.delegate = self
        heroesListTableView.dataSource = self
        presenter.getHeroesList()
    }
    
    // MARK: - Actions

}

// MARK: - Protocol
extension HeroesListViewController: HeroesListViewProtocol {
    
}

extension HeroesListViewController: UITableViewDelegate {
    
}

extension HeroesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20 // TODO: Remove this mock
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = heroesListTableView.dequeueReusableCell(withIdentifier: "heroViewCell", for: indexPath) as? HeroViewCell
            else { return UITableViewCell() }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         // TODO: Implement didSelect
    }
    
}
