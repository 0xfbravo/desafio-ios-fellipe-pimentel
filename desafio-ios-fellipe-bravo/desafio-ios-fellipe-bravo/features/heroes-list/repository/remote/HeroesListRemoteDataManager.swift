//
//  RemoteRepositoryManager.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 24/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation
import Alamofire
import RxAlamofire
import RxSwift

final class HeroesListRemoteDataManager {
    
    private let requestManager: RequestManagerProtocol
    private let marvelGatewayManager: MarvelGatewayManagerProtocol
    private let decoder: JSONDecoder
    
    init(requestManager: RequestManagerProtocol = RequestManager(),
         marvelGatewayManager: MarvelGatewayManagerProtocol = MarvelGatewayManager(),
         decoder: JSONDecoder = JSONDecoder()) {
        self.requestManager = requestManager
        self.marvelGatewayManager = marvelGatewayManager
        self.decoder = decoder
    }
    
}

// MARK: - Protocol
extension HeroesListRemoteDataManager: HeroesListRemoteDataManagerProtocol {
    
    func getHeroesList(offset: Int = 0, limit: Int = 20) {
        let parameters: [String: Any] = [
            "apikey": marvelGatewayManager.publicKey,
            "offset": offset,
            "limit": limit
        ]
        
        requestManager
                .doRequest(.get, marvelGatewayManager.gatewayURL, parameters: parameters, encoding: URLEncoding.default, headers: nil)
                .flatMap { (httpResponse, jsonResponse) -> Observable<MarvelHeroListResponse> in
                    guard let bodyData = (jsonResponse as? String)?.data(using: .utf8),
                          let marvelHeroListResponse = try? self.decoder.decode(MarvelHeroListResponse.self, from: bodyData)
                            else { throw ErrorManager.decodeJsonResponse }
                    print(marvelHeroListResponse)
                    return .just(marvelHeroListResponse)
                }
                .subscribe(onNext: { [weak self] response in
                    print(response)
                }, onError: { error in
                    print(error)
                })
    }
    
}
