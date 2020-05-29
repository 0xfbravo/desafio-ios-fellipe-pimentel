//
// Created by Fellipe Bravo on 28/05/20.
// Copyright (c) 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

struct URLElement: Codable {

    let type: URLType
    let url: String

}

enum URLType: String, Codable {

    case comiclink = "comiclink"
    case detail = "detail"
    case wiki = "wiki"

}