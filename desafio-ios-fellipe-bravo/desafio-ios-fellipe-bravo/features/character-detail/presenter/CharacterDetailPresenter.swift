//
//  CharacterDetailPresenter.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 29/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class CharacterDetailPresenter {
    
    weak var view: CharacterDetailViewProtocol!
    var router: CharacterDetailRouterProtocol!
    var interactor: CharacterDetailInteractorProtocol!

    var characterDetail: CharacterInformation!
    
    init(view: CharacterDetailViewProtocol, router: CharacterDetailRouterProtocol, interactor: CharacterDetailInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

// MARK: - Protocol
extension CharacterDetailPresenter: CharacterDetailPresenterProtocol {

}
