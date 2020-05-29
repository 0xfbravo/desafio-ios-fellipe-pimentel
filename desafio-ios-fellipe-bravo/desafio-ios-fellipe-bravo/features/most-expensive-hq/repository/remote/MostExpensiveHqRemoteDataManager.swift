//
//  MostExpensiveHqRemoteDataManager.swift
//  desafio-ios-fellipe-bravo
//
//  Created by Fellipe Bravo on 26/05/20.
//  Copyright © 2020 Fellipe Bravo. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

final class MostExpensiveHqRemoteDataManager {

    private let requestManager: RequestManagerProtocol
    private let decoder: JSONDecoder

    init(requestManager: RequestManagerProtocol = RequestManager(),
         decoder: JSONDecoder = JSONDecoder()) {
        self.requestManager = requestManager
        self.decoder = decoder
    }

}

// MARK: - Protocol
extension MostExpensiveHqRemoteDataManager: MostExpensiveHqRemoteDataManagerProtocol {

    func getCharacterComicsList(characterId: Int) -> Observable<ComicsListResponse> {
        let parameters: [String: Any] = [
            "offset": 0,
            "limit": 100,
            "orderBy": "-onsaleDate"
        ]

        let characterComicsPath = String(format: MostExpensiveHqEndpoints.getComicsList.path, characterId)
        return requestManager
                .doRequest(.get, path: characterComicsPath, parameters: parameters, encoding: URLEncoding.default, headers: nil)
                .flatMap { [weak self] (data) -> Observable<ComicsListResponse> in
                    guard let characterComicsListResponse = try? self?.decoder.decode(ComicsListResponse.self, from: data)
                            else { throw MostExpensiveHqError.conversionError }
                    return .just(characterComicsListResponse)
                }
    }

}
