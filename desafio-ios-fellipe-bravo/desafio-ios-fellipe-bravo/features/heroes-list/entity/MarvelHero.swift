//
//  Hero.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 27/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

// MARK: - MarvelHero
struct MarvelHero: Codable {
    let code, status, copyright, attributionText: String
    let attributionHTML: String
    let data: DataClass
    let etag: String
}
