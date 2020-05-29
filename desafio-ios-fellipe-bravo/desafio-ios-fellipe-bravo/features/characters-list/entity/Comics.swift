//
// Created by Fellipe Bravo on 28/05/20.
// Copyright (c) 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

struct Comics: Codable {

    let available: Int
    let collectionURI: String
    let items: [ComicsItem]
    let returned: Int

}