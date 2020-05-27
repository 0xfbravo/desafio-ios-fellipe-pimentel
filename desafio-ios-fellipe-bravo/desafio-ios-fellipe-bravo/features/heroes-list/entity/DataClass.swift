//
//  DataClass.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 27/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

// MARK: - DataClass
struct DataClass: Codable {
    let offset, limit, total, count: String
    let results: [Result]
}
