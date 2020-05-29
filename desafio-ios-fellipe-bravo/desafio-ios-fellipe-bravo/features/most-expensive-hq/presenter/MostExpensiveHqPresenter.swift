//
//  MostExpensiveHqPresenter.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 26/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class MostExpensiveHqPresenter {
    
    weak var view: MostExpensiveHqViewProtocol!
    var router: MostExpensiveHqRouterProtocol!
    var interactor: MostExpensiveHqInteractorProtocol!

    var characterDetail: CharacterInformation!
    var disposeBag = DisposeBag()
    var mostExpensiveHq = PublishRelay<ComicsInformation>()

    init(view: MostExpensiveHqViewProtocol, router: MostExpensiveHqRouterProtocol, interactor: MostExpensiveHqInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
}

// MARK: - Protocol
extension MostExpensiveHqPresenter: MostExpensiveHqPresenterProtocol {

    func getMostExpensiveComic() {
        interactor
                .getCharacterComicsList(characterId: characterDetail.id)
                .subscribe(onNext: { [weak self] mostExpensiveHq in
                    self?.mostExpensiveHq.accept(mostExpensiveHq)

                    print(mostExpensiveHq)
                }, onError: { [weak self] error in
                    print(error)
                })
                .disposed(by: disposeBag)
    }

}
