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

    func getCharacterComicsList(characterId: Int) -> Observable<[ComicsInformation]> {
        self.repository.getCharacterComicsList(characterId: characterId)
                .flatMap { (characterComicsListResponse) -> Observable<[ComicsInformation]> in
                    if (characterComicsListResponse.data.results.isEmpty) {
                        throw CharactersListError.emptyList
                    }

                    return .just(characterComicsListResponse.data.results)
                }
    }

}
