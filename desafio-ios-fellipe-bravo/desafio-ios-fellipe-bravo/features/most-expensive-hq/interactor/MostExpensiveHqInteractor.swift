//
//  MostExpensiveHqInteractor.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 26/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation
import RxSwift

final class MostExpensiveHqInteractor {
    
    var repository: MostExpensiveHqRepositoryProtocol
    
    init(repository: MostExpensiveHqRepositoryProtocol) {
        self.repository = repository
    }
    
}

enum MostExpensiveHqError: Error {
    case emptyList, conversionError
}

// MARK: - Protocol
extension MostExpensiveHqInteractor: MostExpensiveHqInteractorProtocol {

    func getCharacterComicsList(characterId: Int) -> Observable<ComicsInformation> {
        self.repository.getCharacterComicsList(characterId: characterId)
                .flatMap { (characterComicsListResponse) -> Observable<ComicsInformation> in
                    if (characterComicsListResponse.data.results.isEmpty) {
                        throw MostExpensiveHqError.emptyList
                    }

                    let mostExpensiveHq = characterComicsListResponse.data.results.max(by: { comicA, comicB in
                        let comicAHighestPrice = comicA.prices.max(by: { $0.price > $1.price })?.price
                        let comicBHighestPrice = comicB.prices.max(by: { $0.price > $1.price })?.price
                        return comicAHighestPrice! > comicBHighestPrice!
                    })

                    return .just(mostExpensiveHq!)
                }
    }

}
