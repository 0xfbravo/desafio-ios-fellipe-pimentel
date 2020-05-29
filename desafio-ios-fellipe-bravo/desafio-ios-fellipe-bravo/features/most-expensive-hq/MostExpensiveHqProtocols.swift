//
//  MostExpensiveHqProtocols.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 26/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

// MARK: - View
protocol MostExpensiveHqViewProtocol: class {
    var presenter: MostExpensiveHqPresenterProtocol! { get set }
}

// MARK: - Presenter
protocol MostExpensiveHqPresenterProtocol {
    var characterDetail: CharacterInformation! { get set }
    
    func getMostExpensiveComic()
}

// MARK: - Interactor
protocol MostExpensiveHqInteractorProtocol {
    func getCharacterComicsList(characterId: Int) -> Observable<[ComicsInformation]>
}

// MARK: - Router
protocol MostExpensiveHqRouterProtocol {
    
}

// MARK: - DataManager
protocol MostExpensiveHqRemoteDataManagerProtocol {
    func getCharacterComicsList(characterId: Int) -> Observable<ComicsListResponse>
}

protocol MostExpensiveHqLocalDataManagerProtocol {
    
}

// MARK: - Repository
protocol MostExpensiveHqRepositoryProtocol {
    func getCharacterComicsList(characterId: Int) -> Observable<ComicsListResponse>
}
