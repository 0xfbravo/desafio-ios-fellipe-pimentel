//
//  HeroesListProtocols.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 24/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

// MARK: - View
protocol HeroesListViewProtocol: class {
    var presenter: HeroesListPresenterProtocol! { get set }
}

// MARK: - Presenter
protocol HeroesListPresenterProtocol {
    
}

// MARK: - Interactor
protocol HeroesListInteractorProtocol {
    
}

// MARK: - Router
protocol HeroesListRouterProtocol {
    
}

// MARK: - DataManager
protocol HeroesListRemoteDataManagerProtocol {
    
}

protocol HeroesListLocalDataManagerProtocol {
    
}

// MARK: - Repository
protocol HeroesListRepositoryProtocol {
    
}
