//
//  CharactersListFeature.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 24/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import UIKit

final class CharactersListFeature {

    public static let storyboardName = "CharactersList"
    public static let viewControllerIdentifier = "CharactersListViewController"

    public static func assemblePresenter(view: CharactersListViewController) -> CharactersListPresenter {
        let router = CharactersListRouter(currentViewController: view)
        let localDataManager = CharactersListLocalDataManager()
        let remoteDataManager = CharactersListRemoteDataManager()
        let repository = CharactersListRepository(localDataManager: localDataManager, remoteDataManager: remoteDataManager)
        let interactor = CharactersListInteractor(repository: repository)
        return CharactersListPresenter(view: view, router: router, interactor: interactor)
    }

    public static func assemble() -> CharactersListViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier) as! CharactersListViewController
        return view
    }
    
}
