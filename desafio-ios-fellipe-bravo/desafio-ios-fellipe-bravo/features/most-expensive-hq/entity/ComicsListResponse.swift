//
//  ComicsListResponse.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 29/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

struct ComicsListResponse: Codable {

    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: ComicsDataClass

}
