//
//  CharactersListPresenter.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 24/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class CharactersListPresenter {
    
    weak var view: CharactersListViewProtocol!
    var router: CharactersListRouterProtocol!
    var interactor: CharactersListInteractorProtocol!

    var disposeBag = DisposeBag()
    var charactersList = BehaviorRelay<[CharacterInformation]>(value: [])
    var offset = 0
    var pageSize = 58
    
    init(view: CharactersListViewProtocol, router: CharactersListRouterProtocol, interactor: CharactersListInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

// MARK: - Protocol
extension CharactersListPresenter: CharactersListPresenterProtocol {

    func getCharactersList() {
        let currentOffset = self.offset
        let nextOffset = self.offset + self.pageSize

        interactor
                .getCharactersList(offset: currentOffset, limit: pageSize)
                .subscribe(onNext: { marvelCharactersList in
                    self.offset = nextOffset
                    self.charactersList.accept(marvelCharactersList)
                    print(marvelCharactersList)
                }, onError: { error in
                    print(error)
                })
                .disposed(by: disposeBag)
    }

}
