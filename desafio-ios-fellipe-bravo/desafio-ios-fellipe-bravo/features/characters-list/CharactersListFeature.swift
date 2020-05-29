//
//  CharactersListFeature.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 24/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import UIKit

final class CharactersListFeature {
    
    static let storyboardName = "CharactersList"
    static let viewControllerIdentifier = "CharactersListViewController"
    
    static func assemblePresenter(view: CharactersListViewController) -> CharactersListPresenter {
        let router = CharactersListRouter(currentViewController: view)
        let localDataManager = CharactersListLocalDataManager()
        let remoteDataManager = CharactersListRemoteDataManager()
        let repository = CharactersListRepository(localDataManager: localDataManager, remoteDataManager: remoteDataManager)
        let interactor = CharactersListInteractor(repository: repository)
        return CharactersListPresenter(view: view, router: router, interactor: interactor)
    }
    
    static func assemble() -> CharactersListViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier) as! CharactersListViewController
        return view
    }
    
}
