//
//  MostExpensiveHqRepository.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 26/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation
import RxSwift

final class MostExpensiveHqRepository {

    private var localDataManager: MostExpensiveHqLocalDataManagerProtocol
    private var remoteDataManager: MostExpensiveHqRemoteDataManagerProtocol
    
    init(localDataManager: MostExpensiveHqLocalDataManagerProtocol, remoteDataManager: MostExpensiveHqRemoteDataManagerProtocol) {
        self.localDataManager = localDataManager
        self.remoteDataManager = remoteDataManager
    }
    
}

// MARK: - Protocol
extension MostExpensiveHqRepository: MostExpensiveHqRepositoryProtocol {
    func getCharacterComicsList(characterId: Int) -> Observable<ComicsListResponse> {
        self.remoteDataManager.getCharacterComicsList(characterId: characterId)
    }
}
