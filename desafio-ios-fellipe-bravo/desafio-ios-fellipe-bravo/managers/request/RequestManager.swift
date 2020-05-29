//
//  RequestManager.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 27/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxAlamofire

final class RequestManager {

    private let encoder: JSONEncoder
    private let decoder: JSONDecoder
    private let marvelGatewayManager: MarvelGatewayManagerProtocol

    init(encoder: JSONEncoder = JSONEncoder(),
         decoder: JSONDecoder = JSONDecoder(),
         marvelGatewayManager: MarvelGatewayManagerProtocol = MarvelGatewayManager()) {
        self.encoder = encoder
        self.decoder = decoder
        self.marvelGatewayManager = marvelGatewayManager
    }

    private func getBasicParameters() -> [String: Any] {
        let requestTimestamp = Date()
        let parameters: [String: Any] = [
            "apikey": marvelGatewayManager.publicKey,
            "ts": requestTimestamp,
            "hash": "\(requestTimestamp)\(marvelGatewayManager.privateKey)\(marvelGatewayManager.publicKey)".md5
        ]
        return parameters
    }

}

extension RequestManager: RequestManagerProtocol {
    
    func doRequest(_ method: Alamofire.HTTPMethod, path: String, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: HTTPHeaders? = nil) -> Observable<Data> {
        let url = "\(marvelGatewayManager.gatewayURL)\(path)"
        var basicParameters = getBasicParameters()
        if let customParameters = parameters {
            basicParameters = basicParameters.merging(customParameters) { (current, _) in current }
        }

        return data(method, url, parameters: basicParameters, encoding: encoding, headers: headers)
    }
    
}
