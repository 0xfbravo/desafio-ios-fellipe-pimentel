//
//  HeroesListViewController.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 24/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HeroesListViewController: UIViewController {
    
    var presenter: HeroesListPresenterProtocol!
    
    // MARK: - Outlets
    @IBOutlet private weak var heroesListTableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = HeroesListFeature.assemblePresenter(view: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        assembleUI()
    }

    // MARK: - UI
    private func assembleUI() {
        heroesListTableView.rx.setDelegate(self).disposed(by: presenter.disposeBag)

        let heroViewCellXib = UINib(nibName: CharacterViewCell.xibName, bundle: nil)
        heroesListTableView.register(heroViewCellXib, forCellReuseIdentifier: CharacterViewCell.cellIdentifier)

        presenter.heroesList.bind(to: heroesListTableView.rx.items(cellIdentifier: CharacterViewCell.cellIdentifier, cellType: CharacterViewCell.self)) {
            (row: Int, item: CharacterInformation, cell: CharacterViewCell) in
            cell.assemble(characterInformation: item)
        }.disposed(by: presenter.disposeBag)

        presenter.getHeroesList()
    }
    
    // MARK: - Actions

}

// MARK: - Protocol
extension HeroesListViewController: HeroesListViewProtocol {
    
}

extension HeroesListViewController: UITableViewDelegate {

}
