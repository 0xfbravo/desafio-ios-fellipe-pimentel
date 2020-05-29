//
// Created by Fellipe Bravo on 28/05/20.
// Copyright (c) 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

struct Stories: Codable {

    let available: Int
    let collectionURI: String
    let items: [StoriesItem]
    let returned: Int

}