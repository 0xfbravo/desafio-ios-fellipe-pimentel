//
//  MarvelGatewayManager.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 27/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation
import Alamofire

final class MarvelGatewayManager: MarvelGatewayManagerProtocol {

    private var marvelGatewayInfo: [[String:String]]
    var gatewayURL: String
    var publicKey: String


    init() throws {
        guard let path = Bundle.main.path(forResource: "MarvelGateway", ofType: "plist") else { throw MarvelGatewayError.load }
        let url = URL(fileURLWithPath: path)
        let data = try! Data(contentsOf: url)
        guard let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? [[String:String]] else { throw MarvelGatewayError.cast }
        
        self.marvelGatewayInfo = plist
        self.gatewayURL = ""
        self.publicKey = ""
    }
    
}

enum MarvelGatewayError: Error {
     case load
     case cast
}
