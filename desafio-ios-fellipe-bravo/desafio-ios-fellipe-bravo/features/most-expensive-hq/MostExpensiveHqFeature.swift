//
//  MostExpensiveHqFeature.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 26/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

import UIKit

final class MostExpensiveHqFeature {
    
    static let storyboardName = "MostExpensiveHq"
    static let viewControllerIdentifier = "MostExpensiveHqViewController"
    
    static func assemblePresenter(view: MostExpensiveHqViewController) -> MostExpensiveHqPresenter {
        let router = MostExpensiveHqRouter(currentViewController: view)
        let localDataManager = MostExpensiveHqLocalDataManager()
        let remoteDataManager = MostExpensiveHqRemoteDataManager()
        let repository = MostExpensiveHqRepository(localDataManager: localDataManager, remoteDataManager: remoteDataManager)
        let interactor = MostExpensiveHqInteractor(repository: repository)
        return MostExpensiveHqPresenter(view: view, router: router, interactor: interactor)
    }
    
    static func assemble() -> MostExpensiveHqViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier) as! MostExpensiveHqViewController
        view.presenter = assemblePresenter(view: view)
        return view
    }
    
}
