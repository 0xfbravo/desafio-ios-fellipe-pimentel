//
//  HeroesListFeature.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 24/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import UIKit

final class HeroesListFeature {
    
    static let storyboardName = "HeroesList"
    static let viewControllerIdentifier = "HeroesListViewController"
    
    static func assemblePresenter(view: HeroesListViewController) -> HeroesListPresenter {
        let router = HeroesListRouter(currentViewController: view)
        let localDataManager = HeroesListLocalDataManager()
        let remoteDataManager = HeroesListRemoteDataManager()
        let repository = HeroesListRepository(localDataManager: localDataManager, remoteDataManager: remoteDataManager)
        let interactor = HeroesListInteractor(repository: repository)
        return HeroesListPresenter(view: view, router: router, interactor: interactor)
    }
    
    static func assemble() -> HeroesListViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier) as! HeroesListViewController
        return view
    }
    
}
