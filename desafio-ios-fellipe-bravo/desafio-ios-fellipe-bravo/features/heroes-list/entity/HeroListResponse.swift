//
// Created by Fellipe Bravo on 28/05/20.
// Copyright (c) 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

struct HeroListResponse: Codable {

    let code: Int64
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: DataClass

}

