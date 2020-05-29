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

        let heroViewCellXib = UINib(nibName: HeroViewCell.xibName, bundle: nil)
        heroesListTableView.register(heroViewCellXib, forCellReuseIdentifier: HeroViewCell.cellIdentifier)

        presenter.heroesList.bind(to: heroesListTableView.rx.items(cellIdentifier: HeroViewCell.cellIdentifier, cellType: HeroViewCell.self)) {
            (row: Int, item: HeroInformation, cell: HeroViewCell) in
            cell.assemble(heroInformation: item)
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
