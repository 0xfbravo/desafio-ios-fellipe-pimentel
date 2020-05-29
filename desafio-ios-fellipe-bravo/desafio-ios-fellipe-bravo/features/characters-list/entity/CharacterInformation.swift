//
// Created by Fellipe Bravo on 29/05/20.
// Copyright (c) 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

struct CharacterInformation: Codable {

    let id: Int
    let name, resultDescription: String
    let thumbnail: CharacterThumbnail

    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case thumbnail
    }

}