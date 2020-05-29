//
// Created by Fellipe Bravo on 28/05/20.
// Copyright (c) 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

struct ComicsPrice: Codable {

    let price: Double
    let type: ExtensionType

    enum CodingKeys: String, CodingKey {
        case price
        case type
    }

}

enum ExtensionType: String, Codable {

    case printPrice = "printPrice"
    case digitalPurchasePrice = "digitalPurchasePrice"

}