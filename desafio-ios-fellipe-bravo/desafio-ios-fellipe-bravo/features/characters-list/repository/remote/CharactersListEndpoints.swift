//
//  CharactersListEndpoints.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 27/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

enum CharactersListEndpoints {
    case getCharactersList;

    var path: String {
        switch self {
            case .getCharactersList: return "/v1/public/characters"
        }
    }

}