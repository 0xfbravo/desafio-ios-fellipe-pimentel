//
//  HeroesListProtocols.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 24/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation
import RxSwift

// MARK: - View
protocol HeroesListViewProtocol: class {
    var presenter: HeroesListPresenterProtocol! { get set }
}

// MARK: - Presenter
protocol HeroesListPresenterProtocol {
    func getHeroesList()
}

// MARK: - Interactor
protocol HeroesListInteractorProtocol {
    func getHeroesList(offset: Int, limit: Int) -> Observable<MarvelHeroListResponse>
}

// MARK: - Router
protocol HeroesListRouterProtocol {
    
}

// MARK: - DataManager
protocol HeroesListRemoteDataManagerProtocol {
    func getHeroesList(offset: Int, limit: Int) -> Observable<MarvelHeroListResponse>
}

protocol HeroesListLocalDataManagerProtocol {
    
}

// MARK: - Repository
protocol HeroesListRepositoryProtocol {
    func getHeroesList(offset: Int, limit: Int) -> Observable<MarvelHeroListResponse>
}
