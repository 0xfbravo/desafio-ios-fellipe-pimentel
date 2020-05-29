//
// Created by Fellipe Bravo on 28/05/20.
// Copyright (c) 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

struct ComicsDataClass: Codable {

    let offset, limit, total, count: Int
    let results: [ComicsInformation]

}