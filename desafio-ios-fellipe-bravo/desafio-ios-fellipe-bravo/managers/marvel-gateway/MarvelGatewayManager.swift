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
    
    var gatewayURL: String
    var privateKey: String
    var publicKey: String

    init() {
        do {
            guard let path = Bundle.main.path(forResource: "MarvelGateway", ofType: "plist") else { throw MarvelGatewayError.load }
            let url = URL(fileURLWithPath: path)
            let data = try Data(contentsOf: url)
            guard let plist = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? [String:String] else { throw MarvelGatewayError.cast }

            self.gatewayURL = plist["gatewayURL"] ?? ""
            self.privateKey = plist["privateKey"] ?? ""
            self.publicKey = plist["publicKey"] ?? ""
        }
        catch _ {
            self.gatewayURL = ""
            self.privateKey = ""
            self.publicKey = ""
        }
    }
    
}

enum MarvelGatewayError: Error {
     case load
     case cast
}
