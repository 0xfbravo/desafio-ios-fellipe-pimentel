//
//  HeroesListPresenter.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 24/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

final class HeroesListPresenter {
    
    weak var view: HeroesListViewProtocol!
    var router: HeroesListRouterProtocol!
    var interactor: HeroesListInteractorProtocol!
    
    init(view: HeroesListViewProtocol, router: HeroesListRouterProtocol, interactor: HeroesListInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

// MARK: - Protocol
extension HeroesListPresenter: HeroesListPresenterProtocol {

    func getHeroesList() {
        interactor
                .getHeroesList(offset: 0, limit: 10)
                .subscribe(onNext: { [weak self] response in
                    print(response)
                }, onError: { [weak self] error in
                    print(error)
                })
    }

}
