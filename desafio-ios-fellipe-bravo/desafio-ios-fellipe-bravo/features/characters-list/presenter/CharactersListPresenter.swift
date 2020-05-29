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
    var pageSize = 20
    var isGettingCharactersList = false
    
    init(view: CharactersListViewProtocol, router: CharactersListRouterProtocol, interactor: CharactersListInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

// MARK: - Protocol
extension CharactersListPresenter: CharactersListPresenterProtocol {

    func getCharactersList() {
        self.isGettingCharactersList = true
        let currentOffset = self.offset
        let nextOffset = self.offset + self.pageSize

        interactor
                .getCharactersList(offset: currentOffset, limit: pageSize)
                .subscribe(onNext: { [weak self] marvelCharactersList in
                    self?.isGettingCharactersList = false
                    self?.offset = nextOffset
                    self?.charactersList.accept(self!.charactersList.value + marvelCharactersList)

                    print(marvelCharactersList)
                }, onError: { [weak self] error in
                    self?.isGettingCharactersList = false

                    print(error)
                })
                .disposed(by: disposeBag)
    }

}
