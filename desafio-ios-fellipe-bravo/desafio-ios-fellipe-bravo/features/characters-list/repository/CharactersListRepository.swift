//
//  CharactersListRepository.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 24/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation
import RxSwift

final class CharactersListRepository {

    private var localDataManager: CharactersListLocalDataManagerProtocol
    private var remoteDataManager: CharactersListRemoteDataManagerProtocol
    
    init(localDataManager: CharactersListLocalDataManagerProtocol, remoteDataManager: CharactersListRemoteDataManagerProtocol) {
        self.localDataManager = localDataManager
        self.remoteDataManager = remoteDataManager
    }
    
}

// MARK: - Protocol
extension CharactersListRepository: CharactersListRepositoryProtocol {

    func getCharactersList(offset: Int, limit: Int) -> Observable<CharactersListResponse> {
        self.remoteDataManager.getCharactersList(offset: offset, limit: limit)
    }

}
