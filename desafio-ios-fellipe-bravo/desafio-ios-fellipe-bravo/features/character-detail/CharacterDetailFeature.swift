//
// Created by Fellipe Bravo on 29/05/20.
// Copyright (c) 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

import UIKit

final class CharacterDetailFeature {

    public static let storyboardName = "CharacterDetail"
    public static let viewControllerIdentifier = "CharacterDetailViewController"

    public static func assemblePresenter(view: CharacterDetailViewController) -> CharacterDetailPresenter {
        let router = CharacterDetailRouter(currentViewController: view)
        let localDataManager = CharacterDetailLocalDataManager()
        let remoteDataManager = CharacterDetailRemoteDataManager()
        let repository = CharacterDetailRepository(localDataManager: localDataManager, remoteDataManager: remoteDataManager)
        let interactor = CharacterDetailInteractor(repository: repository)
        return CharacterDetailPresenter(view: view, router: router, interactor: interactor)
    }

    public static func assemble() -> CharacterDetailViewController {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier) as! CharacterDetailViewController
        view.presenter = assemblePresenter(view: view)
        return view
    }

}