//
//  CharactersListRouter.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 24/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

final class CharactersListRouter: BaseRouter {
    
}

// MARK: - Protocol
extension CharactersListRouter: CharactersListRouterProtocol {

    func openDetails(of character: CharacterInformation) {
        let feature = CharacterDetailFeature.assemble()
        feature.presenter.characterDetail = character
        currentViewController.present(feature, animated: true)
    }

}
