//
//  HeroesListEndpoints.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 27/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

enum HeroesListEndpoints {
    case getHeroesList;

    var path: String {
        switch self {
            case .getHeroesList: return "/v1/public/characters"
        }
    }

}