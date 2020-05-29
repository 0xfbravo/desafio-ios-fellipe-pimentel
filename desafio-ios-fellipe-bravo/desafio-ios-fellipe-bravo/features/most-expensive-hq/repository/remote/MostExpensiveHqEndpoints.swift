//
//  MostExpensiveHqEndpoints.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 27/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

enum MostExpensiveHqEndpoints {
    case getComicsList;

    var path: String {
        switch self {
            case .getComicsList: return "/v1/public/characters/%1$/comics"
        }
    }

}