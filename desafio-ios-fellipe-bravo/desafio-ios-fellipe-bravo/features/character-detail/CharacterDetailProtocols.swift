//
//  CharacterDetailProtocols.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 24/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

// MARK: - View
protocol CharacterDetailViewProtocol: class {
    var presenter: CharacterDetailPresenterProtocol! { get set }
}

// MARK: - Presenter
protocol CharacterDetailPresenterProtocol {
    var characterDetail: CharacterInformation! { get set }
}

// MARK: - Interactor
protocol CharacterDetailInteractorProtocol {

}

// MARK: - Router
protocol CharacterDetailRouterProtocol {
    func openMostExpensiveHq(of character: CharacterInformation)
}

// MARK: - DataManager
protocol CharacterDetailRemoteDataManagerProtocol {

}

protocol CharacterDetailLocalDataManagerProtocol {
    
}

// MARK: - Repository
protocol CharacterDetailRepositoryProtocol {

}
