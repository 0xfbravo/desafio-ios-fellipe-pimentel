//
//  CharactersListViewController.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 24/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CharactersListViewController: UIViewController {
    
    var presenter: CharactersListPresenterProtocol!
    
    // MARK: - Outlets
    @IBOutlet private weak var charactersListTableView: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = CharactersListFeature.assemblePresenter(view: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        assembleUI()
    }

    // MARK: - UI
    private func assembleUI() {
        charactersListTableView.rx.setDelegate(self).disposed(by: presenter.disposeBag)

        let characterViewCellXib = UINib(nibName: CharacterViewCell.xibName, bundle: nil)
        charactersListTableView.register(characterViewCellXib, forCellReuseIdentifier: CharacterViewCell.cellIdentifier)

        presenter.charactersList.bind(to: charactersListTableView.rx.items(cellIdentifier: CharacterViewCell.cellIdentifier, cellType: CharacterViewCell.self)) {
            (row: Int, item: CharacterInformation, cell: CharacterViewCell) in
            cell.assemble(characterInformation: item)
        }.disposed(by: presenter.disposeBag)

        presenter.getCharactersList()
    }
    
    // MARK: - Actions

}

// MARK: - Protocol
extension CharactersListViewController: CharactersListViewProtocol {
    
}

extension CharactersListViewController: UITableViewDelegate {

}
