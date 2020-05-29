//
//  CharacterDetailViewController.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 29/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CharacterDetailViewController: UIViewController {
    
    var presenter: CharacterDetailPresenterProtocol!
    
    // MARK: - Outlets
    @IBOutlet private weak var image: UIImageView!
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var characterDescription: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        assembleUI()
    }

    // MARK: - UI
    private func assembleUI() {
        name.text = presenter.characterDetail.name
        characterDescription.text = (presenter.characterDetail.resultDescription.isEmpty) ? "No description..." : presenter.characterDetail.resultDescription
        image.kf.indicatorType = .activity
        image.kf.setImage(with: presenter.characterDetail.thumbnail.getDetailsURL(), options: [.transition(.fade(1))])
    }
    
    // MARK: - Actions
    @IBAction func onTouchMostExpensiveHq(_ sender: Any) {
        presenter.handleOnMostExpensiveHqTouched()
    }
    
}

// MARK: - Protocol
extension CharacterDetailViewController: CharacterDetailViewProtocol {
    
}
