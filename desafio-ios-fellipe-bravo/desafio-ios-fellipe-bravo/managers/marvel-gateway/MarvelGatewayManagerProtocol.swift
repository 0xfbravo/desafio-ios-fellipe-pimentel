//
//  MarvelGatewayManagerProtocol.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 27/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation

protocol MarvelGatewayManagerProtocol {

    var gatewayURL: String { get }
    var privateKey: String { get }
    var publicKey: String { get }

}
