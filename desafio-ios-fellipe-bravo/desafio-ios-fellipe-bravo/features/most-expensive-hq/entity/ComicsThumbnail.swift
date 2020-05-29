//
// Created by Fellipe Bravo on 28/05/20.
// Copyright (c) 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

struct ComicsThumbnail: Codable {

    let path: String
    let thumbnailExtension: ComicsThumbnailExtension

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }

    func getDetailsURL() -> URL? {
        URL(string: "\(path).\(thumbnailExtension)")
    }

}

enum ComicsThumbnailExtension: String, Codable {

    case jpg = "jpg"
    case gif = "gif"
    case png = "png"
    case jpeg = "jpeg"

}