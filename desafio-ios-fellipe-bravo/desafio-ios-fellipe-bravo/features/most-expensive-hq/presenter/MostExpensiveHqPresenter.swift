//
//  MostExpensiveHqPresenter.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 26/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

final class MostExpensiveHqPresenter {
    
    weak var view: MostExpensiveHqViewProtocol!
    var router: MostExpensiveHqRouterProtocol!
    var interactor: MostExpensiveHqInteractorProtocol!

    var characterDetail: CharacterInformation!

    init(view: MostExpensiveHqViewProtocol, router: MostExpensiveHqRouterProtocol, interactor: MostExpensiveHqInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

// MARK: - Protocol
extension MostExpensiveHqPresenter: MostExpensiveHqPresenterProtocol {

    func getMostExpensiveComic() {

    }

}
