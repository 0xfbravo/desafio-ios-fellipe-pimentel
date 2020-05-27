//
//  MostExpensiveHqInteractor.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 26/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

final class MostExpensiveHqInteractor {
    
    var repository: MostExpensiveHqRepositoryProtocol
    
    init(repository: MostExpensiveHqRepositoryProtocol) {
        self.repository = repository
    }
    
}

// MARK: - Protocol
extension MostExpensiveHqInteractor: MostExpensiveHqInteractorProtocol {
    
}
