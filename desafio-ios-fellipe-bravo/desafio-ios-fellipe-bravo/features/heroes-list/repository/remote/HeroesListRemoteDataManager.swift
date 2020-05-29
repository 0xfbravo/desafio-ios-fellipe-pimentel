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
    private let decoder: JSONDecoder
    
    init(requestManager: RequestManagerProtocol = RequestManager(),
         decoder: JSONDecoder = JSONDecoder()) {
        self.requestManager = requestManager
        self.decoder = decoder
    }
    
}

// MARK: - Protocol
extension HeroesListRemoteDataManager: HeroesListRemoteDataManagerProtocol {
    
    func getHeroesList(offset: Int = 0, limit: Int = 20) -> Observable<HeroListResponse> {
        let parameters: [String: Any] = [
            "offset": offset,
            "limit": limit
        ]
        
        return requestManager
                .doRequest(.get, path: HeroesListEndpoints.getHeroesList.path, parameters: parameters, encoding: URLEncoding.default, headers: nil)
                .flatMap { (data) -> Observable<HeroListResponse> in
                    let marvelHeroListResponse = try? self.decoder.decode(HeroListResponse.self, from: data)
                    return .just(marvelHeroListResponse!)
                }
    }
    
}
