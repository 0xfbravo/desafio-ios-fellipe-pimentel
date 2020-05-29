//
//  CharacterDetailRepository.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 29/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation
import RxSwift

final class CharacterDetailRepository {

    private var localDataManager: CharacterDetailLocalDataManagerProtocol
    private var remoteDataManager: CharacterDetailRemoteDataManagerProtocol
    
    init(localDataManager: CharacterDetailLocalDataManagerProtocol, remoteDataManager: CharacterDetailRemoteDataManagerProtocol) {
        self.localDataManager = localDataManager
        self.remoteDataManager = remoteDataManager
    }
    
}

// MARK: - Protocol
extension CharacterDetailRepository: CharacterDetailRepositoryProtocol {

}
