//
//  CharactersListInteractor.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 24/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation
import RxSwift

final class CharactersListInteractor {
    
    var repository: CharactersListRepositoryProtocol
    
    init(repository: CharactersListRepositoryProtocol) {
        self.repository = repository
    }
    
}

// MARK: - Protocol
extension CharactersListInteractor: CharactersListInteractorProtocol {

    func getCharactersList(offset: Int, limit: Int) -> Observable<[CharacterInformation]> {
        self.repository.getCharactersList(offset: offset, limit: limit)
                .flatMap { (marvelCharactersListResponse) -> Observable<[CharacterInformation]> in
                    .just(marvelCharactersListResponse.data.results)
                }
    }

}
