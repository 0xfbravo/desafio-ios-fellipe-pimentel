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

final class CharactersListRemoteDataManager {
    
    private let requestManager: RequestManagerProtocol
    private let decoder: JSONDecoder
    
    init(requestManager: RequestManagerProtocol = RequestManager(),
         decoder: JSONDecoder = JSONDecoder()) {
        self.requestManager = requestManager
        self.decoder = decoder
    }
    
}

// MARK: - Protocol
extension CharactersListRemoteDataManager: CharactersListRemoteDataManagerProtocol {
    
    func getCharactersList(offset: Int, limit: Int) -> Observable<CharactersListResponse> {
        let parameters: [String: Any] = [
            "offset": offset,
            "limit": limit
        ]
        
        return requestManager
                .doRequest(.get, path: CharactersListEndpoints.getCharactersList.path, parameters: parameters, encoding: URLEncoding.default, headers: nil)
                .flatMap { (data) -> Observable<CharactersListResponse> in
                    let marvelCharactersListResponse = try? self.decoder.decode(CharactersListResponse.self, from: data)
                    return .just(marvelCharactersListResponse!)
                }
    }
    
}
