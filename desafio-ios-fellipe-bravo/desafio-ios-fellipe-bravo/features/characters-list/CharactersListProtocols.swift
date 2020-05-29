//
//  CharactersListProtocols.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 24/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

// MARK: - View
protocol CharactersListViewProtocol: class {
    var presenter: CharactersListPresenterProtocol! { get set }
}

// MARK: - Presenter
protocol CharactersListPresenterProtocol {
    var disposeBag: DisposeBag { get }
    var charactersList: BehaviorRelay<[CharacterInformation]> { get }
    var isGettingCharactersList: Bool { get }

    func getCharactersList()
    func handleOnCharacterSelected(characterInfo: CharacterInformation)
}

// MARK: - Interactor
protocol CharactersListInteractorProtocol {
    func getCharactersList(offset: Int, limit: Int) -> Observable<[CharacterInformation]>
}

// MARK: - Router
protocol CharactersListRouterProtocol {
    func openDetails(of character: CharacterInformation)
}

// MARK: - DataManager
protocol CharactersListRemoteDataManagerProtocol {
    func getCharactersList(offset: Int, limit: Int) -> Observable<CharactersListResponse>
}

protocol CharactersListLocalDataManagerProtocol {
    
}

// MARK: - Repository
protocol CharactersListRepositoryProtocol {
    func getCharactersList(offset: Int, limit: Int) -> Observable<CharactersListResponse>
}
