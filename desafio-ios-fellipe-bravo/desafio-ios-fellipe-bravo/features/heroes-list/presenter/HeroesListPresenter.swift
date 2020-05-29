//
//  HeroesListPresenter.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 24/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class HeroesListPresenter {
    
    weak var view: HeroesListViewProtocol!
    var router: HeroesListRouterProtocol!
    var interactor: HeroesListInteractorProtocol!

    var disposeBag = DisposeBag()
    var heroesList = PublishSubject<[HeroInformation]>()
    var offset = 0
    var pagination = 20
    
    init(view: HeroesListViewProtocol, router: HeroesListRouterProtocol, interactor: HeroesListInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

// MARK: - Protocol
extension HeroesListPresenter: HeroesListPresenterProtocol {

    func getHeroesList() {
        let currentOffset = self.offset
        let nextOffset = self.offset + self.pagination

        interactor
                .getHeroesList(offset: currentOffset, limit: nextOffset)
                .subscribe(onNext: { marvelHeroList in
                    self.offset = nextOffset
                    self.heroesList.onNext(marvelHeroList)
                    print(marvelHeroList)
                }, onError: { error in
                    print(error)
                })
                .disposed(by: disposeBag)
    }

}
