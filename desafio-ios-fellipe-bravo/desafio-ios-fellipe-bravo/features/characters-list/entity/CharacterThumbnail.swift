//
// Created by Fellipe Bravo on 28/05/20.
// Copyright (c) 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

struct CharacterThumbnail: Codable {

    let path: String
    let thumbnailExtension: CharacterThumbnailExtension

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }

    func getListURL() -> URL? {
        URL(string: "\(path)/standard_fantastic.\(thumbnailExtension)")
    }

    func getDetailsURL() -> URL? {
        URL(string: "\(path).\(thumbnailExtension)")
    }

}

enum CharacterThumbnailExtension: String, Codable {

    case jpg = "jpg"
    case gif = "gif"
    case png = "png"
    case jpeg = "jpeg"

}