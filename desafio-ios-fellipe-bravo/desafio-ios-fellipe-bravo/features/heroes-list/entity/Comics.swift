//
//  Comics.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 27/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

// MARK: - Comics
struct Comics: Codable {
    let available, returned, collectionURI: String
    let items: [ComicsItem]
}