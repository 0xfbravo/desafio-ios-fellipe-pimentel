//
// Created by Fellipe Bravo on 28/05/20.
// Copyright (c) 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

struct StoriesItem: Codable {

    let resourceURI: String
    let name: String
    let type: ItemType

}

enum ItemType: String, Codable {

    case cover = "cover"
    case empty = ""
    case interiorStory = "interiorStory"

}