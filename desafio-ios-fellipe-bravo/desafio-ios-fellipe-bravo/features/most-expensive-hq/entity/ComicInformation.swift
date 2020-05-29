//
// Created by Fellipe Bravo on 29/05/20.
// Copyright (c) 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

struct ComicsInformation: Codable {

    let id: Int
    let title: String
    let resultDescription: String?
    let prices: [ComicsPrice]
    let thumbnail: ComicsThumbnail

    enum CodingKeys: String, CodingKey {
        case id, title
        case resultDescription = "description"
        case prices, thumbnail
    }

}