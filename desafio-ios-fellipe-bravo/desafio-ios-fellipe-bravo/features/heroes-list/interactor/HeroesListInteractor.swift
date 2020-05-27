//
//  HeroesListInteractor.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 24/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

final class HeroesListInteractor {
    
    var repository: HeroesListRepositoryProtocol
    
    init(repository: HeroesListRepositoryProtocol) {
        self.repository = repository
    }
    
}

// MARK: - Protocol
extension HeroesListInteractor: HeroesListInteractorProtocol {
    
}
