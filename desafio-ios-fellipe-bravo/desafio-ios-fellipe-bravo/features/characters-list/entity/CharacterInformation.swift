//
// Created by Fellipe Bravo on 28/05/20.
// Copyright (c) 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

struct CharacterInformation: Codable {

    let id: Int64
    let name, resultDescription: String
    let modified: String // TODO: Should be a Date, but the format is strange and I can't convert right now
    let thumbnail: Thumbnail
    let resourceURI: String
    let comics, series: Comics
    let stories: Stories
    let events: Comics
    let urls: [URLElement]

    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case modified, thumbnail, resourceURI, comics, series, stories, events, urls
    }

}